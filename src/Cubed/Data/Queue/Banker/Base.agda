open import Cubed.Level

open import Cubed.Data.Bool.Base using (Bool)
open import Cubed.Data.Dec.Base as Dec using ()
open import Cubed.Data.Stream.Fin-with-len as Fin-stream using (Stream; []; _∷_; delay; force)
open import Cubed.Data.List.Base as List using (List; []; _∷_)
open import Cubed.Data.Maybe.Base using (Maybe)
open import Cubed.Data.Maybe.Effectful using ()
open import Cubed.Data.Nat.Base as Nat using (Nat; _≤_; z≤; _≤?_)
open import Cubed.Data.Prod.Base using (_×_; _,_; fst; snd)
open import Cubed.Data.Queue.Base using (IQueue)

open import Cubed.Effect

open import Cubed.Fun.Base using (_∘_; _$_; _|>_)


module Cubed.Data.Queue.Banker.Base where

private variable
  ℓ : Level
  A : Type _
  n : Nat

record Queue (A : Type ℓ) : Type ℓ where
  constructor mk
  field
    {len-front} : Nat
    front : Stream A len-front
    back : List A
    @0 b≤f : List.length back ≤ len-front

open Queue

from-fin-stream : Stream A n → Queue A
from-fin-stream as = mk as [] z≤

private
  split-queue : (front : Stream A n) (back : List A) → Queue A
  split-queue {n = len-front} front back =
    List.length back ≤? len-front
    |> Dec.rec
      (λ b≤f → mk front back b≤f)
      (λ ¬b≤f → mk (front Fin-stream.++ Fin-stream.from-list (List.reverse back)) [] z≤)

empty : Queue A
empty = from-fin-stream Fin-stream.empty

is-empty : Queue A → Bool
is-empty = Nat.is-zeroᵇ ∘ len-front

snoc : A → Queue A → Queue A
snoc a q = split-queue (q .front) (a ∷ q .back)

pop : Queue A → Maybe (A × Queue A)
pop q = do
  (x , front') ← Fin-stream.safe-pop (front q)
  pure $ x , split-queue front' (back q)

head : Queue A → Maybe A
head = Fin-stream.safe-head ∘ front

tail : Queue A → Maybe (Queue A)
tail q = do
  front-tail ← Fin-stream.safe-tail (q .front)
  pure $ split-queue front-tail (q .back)

instance iqueue : IQueue A (Queue A)
iqueue = record
  { from-list = from-fin-stream ∘ Fin-stream.from-list
  ; empty = empty
  ; snoc = snoc
  ; pop = pop
  ; head = head
  ; tail = tail
  }

