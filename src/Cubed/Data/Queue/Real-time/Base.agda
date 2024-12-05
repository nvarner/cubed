open import Cubed.Level

open import Cubed.Data.List.Base as List using (List; []; _∷_)
open import Cubed.Data.Maybe.Base as Maybe using (Maybe; just; nothing)
open import Cubed.Data.Maybe.Effectful using ()
open import Cubed.Data.Prod.Base using (_×_; _,_)
open import Cubed.Data.Queue.Base using (IQueue)
open import Cubed.Data.Stream.Fin as Stream using (Stream)

open import Cubed.Effect

open import Cubed.Fun.Base using (_∘_; _$_; _|>_)


module Cubed.Data.Queue.Real-time.Base where

private variable
  ℓ : Level
  A : Type _

record Queue (A : Type ℓ) : Type ℓ where
  constructor mk
  field
    front : Stream A
    back : List A
    schedule : Stream A

open Queue

private
  rotate : Stream A → List A → Stream A → Stream A
  rotate = Stream.foldl
    (λ ih x → λ where
      [] acc → Stream.cons x (ih [] acc)
      (y ∷ back') acc → Stream.cons x (ih back' (Stream.cons y acc)))
    (λ back acc → Stream.from-list (List.reverse back) Stream.++ acc)

  fixed : Stream A → List A → Stream A → Queue A
  fixed front back schedule =
    Stream.pop schedule
    |> (λ where
      (just (a , schedule')) →
        mk front back schedule'
      nothing →
        let front' = rotate front back Stream.empty in
        mk front' [] front')

empty : Queue A
empty = fixed Stream.empty [] Stream.empty

snoc : A → Queue A → Queue A
snoc a q = fixed (front q) (a ∷ back q) (schedule q)

pop : Queue A → Maybe (A × Queue A)
pop q = do
  x , front' ← Stream.pop (front q)
  pure $ x , fixed front' (back q) (schedule q)

head : Queue A → Maybe A
head = Stream.head ∘ front

tail : Queue A → Maybe (Queue A)
tail q = do
  front' ← Stream.tail (front q)
  pure $ fixed front' (back q) (schedule q)

instance iqueue : IQueue A (Queue A)
iqueue = record
  { from-list = List.foldr snoc empty
  ; empty = empty
  ; snoc = snoc
  ; pop = pop
  ; head = head
  ; tail = tail
  }

