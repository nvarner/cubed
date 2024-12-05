open import Cubed.Level

open import Cubed.Data.Bool.Base using (Bool)
open import Cubed.Data.List.Base as List using (List; []; _∷_)
open import Cubed.Data.Maybe.Base using (Maybe)
open import Cubed.Data.Maybe.Effectful using ()
open import Cubed.Data.Prod.Base using (_×_; _,_; fst; snd)
open import Cubed.Data.Queue.Base using (IQueue)

open import Cubed.Effect

open import Cubed.Fun.Base using (_∘_; _$_)

open import Cubed.Path.Base using (_≡_)


module Cubed.Data.Queue.Batched.Base where

private variable
  ℓ : Level
  A : Type _

record Queue (A : Type ℓ) : Type ℓ where
  constructor mk
  field
    front : List A
    back : List A
    @0 invariant : List.Is-empty front → List.Is-empty back

open Queue

from-list : List A → Queue A
from-list [] = mk [] [] (λ _ → [])
from-list front@(_ ∷ _) = mk front [] (λ ())

private
  split-queue : List A → List A → Queue A
  split-queue [] = from-list ∘ List.reverse
  split-queue front@(_ ∷ _) back = mk front back (λ ())

empty : Queue A
empty = from-list []

is-empty : Queue A → Bool
is-empty = List.is-emptyᵇ ∘ front

snoc : A → Queue A → Queue A
snoc x q = split-queue (q .front) (x ∷ q .back)

pop : Queue A → Maybe (A × Queue A)
pop q = do
  (x , front') ← List.pop (front q)
  pure $ x , split-queue front' (back q)

head : Queue A → Maybe A
head = List.head ∘ front

tail : Queue A → Maybe (Queue A)
tail q = do
  front-tail ← List.tail (q .front)
  pure $ split-queue front-tail (q .back)

instance iqueue : IQueue A (Queue A)
iqueue = record
  { from-list = from-list
  ; empty = empty
  ; snoc = snoc
  ; pop = pop
  ; head = head
  ; tail = tail
  }

