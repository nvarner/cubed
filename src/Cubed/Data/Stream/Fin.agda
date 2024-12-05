open import Cubed.Level

open import Cubed.Data.List.Base as List using (List)
open import Cubed.Data.Maybe.Base as Maybe using (Maybe; just; nothing)
open import Cubed.Data.Nat.Base as Nat using (Nat; zero; suc; _+_)
open import Cubed.Data.Prod.Base using (_×_; _,_; fst; snd; map-snd)
open import Cubed.Data.Stream.Fin-with-len as With-len using (delay; force) renaming (Stream to With-len)

open import Cubed.Fun.Base using (_∘_; _$_; _|>_; id; const; flip)

open import Cubed.Path.Base using (_≡_)


module Cubed.Data.Stream.Fin where

private variable
  ℓ : Level
  A B : Type _

record Stream (A : Type ℓ) : Type ℓ where
  constructor lift
  field
    {length} : Nat
    stream-with-len : With-len A length

  open With-len.Stream stream-with-len

open Stream public

empty : Stream A
empty = lift With-len.empty

cons : A → Stream A → Stream A
cons a s .length = _
cons a s .stream-with-len .force = a With-len.∷ stream-with-len s

case : B → B → Stream A → B
case z s = With-len.case z s ∘ stream-with-len

foldl : (B → A → B) → B → Stream A → B
foldl ih init = With-len.foldl ih init ∘ stream-with-len

foldr : (A → B → B) → B → Stream A → B
foldr ih init = With-len.foldr ih init ∘ stream-with-len

from-list : List A → Stream A
from-list = lift ∘ With-len.from-list

to-list : Stream A → List A
to-list = With-len.to-list ∘ stream-with-len

map : (A → B) → Stream A → Stream B
map f = lift ∘ With-len.map f ∘ stream-with-len

head : Stream A → Maybe A
head = With-len.safe-head ∘ stream-with-len

tail : Stream A → Maybe (Stream A)
tail = Maybe.map lift ∘ With-len.safe-tail ∘ stream-with-len

pop : Stream A → Maybe (A × Stream A)
pop = Maybe.map (map-snd lift) ∘ With-len.safe-pop ∘ stream-with-len

infixr 5 _++_
_++_ : Stream A → Stream A → Stream A
xs ++ ys = lift $ stream-with-len xs With-len.++ stream-with-len ys

reverse : Stream A → Stream A
reverse = lift ∘ With-len.reverse ∘ stream-with-len

