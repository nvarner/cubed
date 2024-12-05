open import Cubed.Level
open import Cubed.Effect

open import Cubed.Data.Char.Base as Char using (Char; parse-digit)
open import Cubed.Data.List.Base as List using (List; []; _∷_)
open import Cubed.Data.Maybe.Base as Maybe using (Maybe; just; nothing; from-maybe)
open import Cubed.Data.Nat.Base as Nat using (Nat; zero; suc; _+_; _*_)
open import Cubed.Data.Prod.Base using (_×_; _,_; fst; snd)
open import Cubed.Data.Queue.Base using (snoc; head; empty)
open import Cubed.Data.Queue.Effectful as QueueEffect using (pop)
open import Cubed.Data.Queue.Banker.Base as Queue using (Queue)
open import Cubed.Data.String.Base as String using (String)
open import Cubed.Data.Unit.Base using (Unit; tt)

open import Cubed.Effect.Monad.State.Base as State using (State)
open import Cubed.Effect.Monad.State.Trans.Base using (StateT; get; put; gets; modify)
open import Cubed.Effect.Monad.Reader.Trans using (ReaderT; reader; local; ask)

open import Cubed.Fun.Base using (_∘_; _$_; _|>_; id; const)

open import Cubed.IO.Base as IO using (IO; put-str-ln; get-line)
open import Cubed.IO.Effectful using ()

open import Cubed.Path.Base using (_≡_)


module Cubed.Example.Queue where

private variable
  ℓ : Level

record Config : Type lzero where
  field
    initial-load chunk-size : Nat

record Chunks : Type lzero where
  constructor mk
  field
    initial-load chunk-size : Nat
    initial : List Nat
    chunks : List (List Nat)

parse-nat : String → Maybe Nat
parse-nat s = do
  let chars = String.to-list s
  digits ← mapM parse-digit chars
  let num = List.foldr (λ d acc → 10 * acc + d) zero digits
  pure num

parse-input : String → IO (Maybe (List Nat))
parse-input input = do
  let words = String.split-byᵇ (' ' Char.≡ᵇ_) input
  let nums = mapM parse-nat words
  pure nums

setup : List Nat → ReaderT Config IO Chunks
setup nums = do
  liftM $ put-str-ln "preparing for test..."

  initial-load ← reader Config.initial-load
  chunk-size ← reader Config.chunk-size

  let (initial , nums) = List.split-at initial-load nums
  let chunks = List.chunked chunk-size nums
  let result = mk initial-load chunk-size initial chunks

  liftM $ put-str-ln "preparations complete"
  pure result

TestAct : Type lzero → Type lzero
TestAct = ReaderT Chunks (StateT (Queue Nat) IO)

snoc-chunk : List Nat → TestAct (Lift Unit)
snoc-chunk = liftM ∘ traverse- QueueEffect.snoc

pull-chunk : Nat → TestAct (List Nat)
pull-chunk chunk-size = do
  List.filter-map id <$> forM (List.down-from chunk-size) (const (liftM pop))

print-chunk : List Nat → TestAct Unit
print-chunk [] = liftM $ liftM $ put-str-ln "[empty chunk]"
print-chunk (x ∷ chunk) = liftM $ liftM $ put-str-ln $ "[chunk from " String.++ Nat.show x String.++ "]"

test : TestAct Unit
test = do
  liftM $ liftM $ put-str-ln "loading initial chunk"
  initial-chunk ← reader Chunks.initial
  snoc-chunk initial-chunk

  liftM $ liftM $ put-str-ln "cycling through chunks"
  chunks ← reader Chunks.chunks
  chunk-size ← reader Chunks.chunk-size
  for- chunks (λ chunk → do
    snoc-chunk chunk
    pull-chunk chunk-size >>= print-chunk)

  liftM $ liftM $ put-str-ln "draining queue"
  initial-load ← reader Chunks.initial-load
  pull-chunk initial-load >>= print-chunk

  pure tt

main : IO Unit
main = do
  let config = record { initial-load = 100000; chunk-size = 10000 }

  maybe-nums ← get-line >>= parse-input
  Maybe.rec
    (put-str-ln "failed to read input data")
    (λ nums → do
      chunks ← ReaderT.run (setup nums) config
      StateT.eval (ReaderT.run test chunks) Queue.empty
      pure tt)
    maybe-nums

