open import Cubed.Level
open import Cubed.Effect

open import Cubed.Data.Char.Base as Char using (Char; parse-digit)
open import Cubed.Data.List.Base as List using (List; []; _∷_)
open import Cubed.Data.Maybe.Base as Maybe using (Maybe; just; nothing; from-maybe)
open import Cubed.Data.Nat.Base as Nat using (Nat; zero; suc; _+_; _*_)
open import Cubed.Data.Prod.Base using (_×_; _,_; fst; snd)
open import Cubed.Data.Queue.Base using (IQueue; snoc; head; empty)
open import Cubed.Data.Queue.Effectful as QueueEffect using (pop)
open import Cubed.Data.Queue.Banker.Base as Banker-queue using ()
open import Cubed.Data.Queue.Batched.Base as Batched-queue using ()
open import Cubed.Data.Queue.Real-time.Base as Real-time-queue using ()
open import Cubed.Data.String.Base as String using (String)
open import Cubed.Data.Unit.Base using (Unit; tt)

open import Cubed.Effect.Monad.State.Base as State using (State)
open import Cubed.Effect.Monad.State.Trans.Base using (StateT; get; put; gets; modify)
open import Cubed.Effect.Monad.Reader.Trans using (ReaderT; reader; local; ask)

open import Cubed.Fun.Base using (_∘_; _$_; _|>_; id; const)

open import Cubed.IO.Base as IO using (IO; put-str-ln; get-line; get-args)

open import Cubed.Path.Base using (_≡_)


module Cubed.Example.Queue where

private variable
  ℓ : Level
  A : Type _

data Queue-option : Type lzero where
  Batched Banker Real-time : Queue-option

queue-by-name : String → Maybe Queue-option
queue-by-name "batched" = just Batched
queue-by-name "banker" = just Banker
queue-by-name "real-time" = just Real-time
queue-by-name s = nothing

queue-to-name : Queue-option → String
queue-to-name Batched = "batched"
queue-to-name Banker = "banker"
queue-to-name Real-time = "real-time"

record Config : Type lzero where
  field
    initial-load chunk-size num-chunks : Nat
    queue : Queue-option

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
  let num = List.foldl (λ acc d → 10 * acc + d) zero digits
  pure num

parse-input : String → IO (Maybe (List Nat))
parse-input input = do
  let words = String.split-byᵇ (' ' Char.≡ᵇ_) input
  let nums = mapM parse-nat words
  pure nums

setup : ReaderT Config IO Chunks
setup = do
  liftM $ put-str-ln "preparing for test..."

  queue ← reader Config.queue
  initial-load ← reader Config.initial-load
  chunk-size ← reader Config.chunk-size
  num-chunks ← reader Config.num-chunks

  liftM $ put-str-ln $ "queue: " String.++ queue-to-name queue
  liftM $ put-str-ln $ "initial load: " String.++ Nat.show initial-load
  liftM $ put-str-ln $ "chunk size: " String.++ Nat.show chunk-size
  liftM $ put-str-ln $ "num chunks: " String.++ Nat.show num-chunks

  let initial = List.down-from initial-load
  let chunks = List.chunked chunk-size (List.down-from (chunk-size * num-chunks))
  let result = mk initial-load chunk-size initial chunks

  liftM $ put-str-ln "preparations complete"
  pure result

module Experiment (Q : Type lzero) {{iqueue : IQueue Nat Q}} where
  TestAct : Type lzero → Type lzero
  TestAct = ReaderT Chunks (StateT Q IO)

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

  run : Chunks → IO Unit
  run chunks = StateT.eval (ReaderT.run test chunks) empty

queue-option-to-experiment : Queue-option → Chunks → IO Unit
queue-option-to-experiment Batched = Experiment.run (Batched-queue.Queue Nat)
queue-option-to-experiment Banker = Experiment.run (Banker-queue.Queue Nat)
queue-option-to-experiment Real-time = Experiment.run (Real-time-queue.Queue Nat)

parse-args : List String → IO Config
parse-args (queue-name ∷ initial-load ∷ chunk-size ∷ num-chunks ∷ []) =
  let queue = from-maybe Batched (queue-by-name queue-name) in
  let initial-load = from-maybe 0 (parse-nat initial-load) in
  let chunk-size = from-maybe 50 (parse-nat chunk-size) in
  let num-chunks = from-maybe 200000 (parse-nat num-chunks) in
  pure $ record { queue = queue; initial-load = initial-load; chunk-size = chunk-size; num-chunks = num-chunks }
parse-args _ = do
  put-str-ln "unexpected number of arguments"
  parse-args $ "" ∷ "" ∷ "" ∷ "" ∷ []

main : IO Unit
main = do
  config ← get-args >>= parse-args

  chunks ← ReaderT.run setup config
  let run-experiment = Config.queue config |> queue-option-to-experiment
  run-experiment chunks

  pure tt

