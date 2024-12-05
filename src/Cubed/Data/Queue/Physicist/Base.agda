open import Cubed.Level

open import Cubed.Codata.Susp.Base using (Susp; delay; force)

open import Cubed.Data.Dec.Base as Dec using ()
open import Cubed.Data.Empty.Base as Empty using ()
open import Cubed.Data.Maybe.Base using (Maybe)
open import Cubed.Data.Maybe.Effectful using ()
open import Cubed.Data.Nat.Base as Nat using (Nat; _≤_; z≤; _≤?_; Is-zero)
open import Cubed.Data.Prod.Base using (Σ; Σ-syntax; _,_)
open import Cubed.Data.Queue.Base using (IQueue)
open import Cubed.Data.Vec.Base as Vec using (Vec; []; _∷_; _++_; reverse; Is-empty)
open import Cubed.Data.Vec.Properties as Vec using ()

open import Cubed.Effect

open import Cubed.Fun.Base using (_∘_; _$_; _|>_)


module Cubed.Data.Queue.Physicist.Base where

private variable
  ℓ : Level
  A : Type _
  m n : Nat

record Pre-front (A : Type ℓ) (len : Nat) : Type ℓ where
  constructor mk
  field
    front : Susp (Vec A len)
    {len-working} : Nat
    working : Vec A len-working

Invariant-front : Pre-front A n → Type (level A)
Invariant-front {n = len-front} pre-front = Is-empty working → Is-zero len-front
  where open Pre-front pre-front

fix-front : Pre-front A n → Σ[ pre-front ∈ Pre-front A n ] Invariant-front pre-front
fix-front pre-front =
  Vec.is-empty? working
  |> Dec.rec
    (λ empty → record { front = front; working = front .force } , Vec.Is-empty→Is-zero)
    (λ ¬empty → pre-front , Empty.rec ∘ ¬empty)
  where open Pre-front pre-front

record Pre-queue (A : Type ℓ) : Type ℓ where
  constructor mk
  field
    {len-front} : Nat
    pre-front : Pre-front A len-front
    {len-back} : Nat
    back : Vec A len-back

Invariant-balanced : Pre-queue A → Type lzero
Invariant-balanced pre-queue = len-back ≤ len-front
  where open Pre-queue pre-queue

balance : Pre-queue A → Σ[ pre-queue ∈ Pre-queue A ] Invariant-balanced pre-queue
balance pre-queue =
  len-back ≤? len-front
  |> Dec.rec
    (λ b≤f → pre-queue , b≤f)
    (λ ¬b≤f →
      let working' = front .force in
      let front' = delay (working' ++ reverse back) in
      mk (mk front' working') [] , z≤)
  where
    open Pre-queue pre-queue
    open Pre-front pre-front

record Queue (A : Type ℓ) : Type ℓ where
  constructor mk
  field
    {len-front} : Nat
    front : Susp (Vec A len-front)
    {len-working} : Nat
    working : Vec A len-working
    {len-back} : Nat
    back : Vec A len-back
    @0 invariant₁ : len-back ≤ len-front
    @0 invariant₂ : Is-empty working → Is-zero len-front

open Queue

to-pre-front : (queue : Queue A) → Pre-front A (len-front queue)
to-pre-front queue = record { Queue queue }

to-pre-queue : Queue A → Pre-queue A
to-pre-queue queue = record { Queue queue; pre-front = to-pre-front queue }

from-pre-queue :
  (pre-queue : Pre-queue A) →
  Invariant-balanced pre-queue →
  Invariant-front (pre-queue .Pre-queue.pre-front) →
  Queue A
from-pre-queue pre-queue invariant₁ invariant₂ = record
  { Pre-queue pre-queue
  ; Pre-front (pre-queue .Pre-queue.pre-front)
  ; invariant₁ = invariant₁
  ; invariant₂ = invariant₂
  }

fix : Pre-queue A → Queue A
fix pre-queue =
  let (pre-queue , balanced) = balance pre-queue in
  let (pre-front , invariant-front) = fix-front (pre-queue .Pre-queue.pre-front) in
  let pre-queue = record { Pre-queue pre-queue; pre-front = pre-front } in
  from-pre-queue pre-queue balanced invariant-front

snoc : A → Queue A → Queue A
snoc a queue = fix (mk (to-pre-front queue) (a ∷ queue .back))

head : Queue A → Maybe A
head = Vec.safe-head ∘ working

tail : Queue A → Maybe (Queue A)
tail queue = do
  working' ← Vec.safe-tail $ queue .working
  let front' = {!!}
  pure $ fix (mk (mk front' working') (queue .back))

instance iqueue : IQueue A (Queue A)
iqueue = record
  { from-list = {!!}
  ; empty = {!!}
  ; snoc = snoc
  ; head = head
  ; tail = {!!}
  }

