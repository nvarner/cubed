open import Cubed.Level

open import Cubed.Data.List.Base as List using (List; []; _∷_)
open import Cubed.Data.Maybe.Base using (Maybe; just; nothing)
open import Cubed.Data.Nat.Base as Nat using (Nat; zero; suc; _+_)
open import Cubed.Data.Nat.Properties as Nat using ()
open import Cubed.Data.Prod.Base using (_×_; _,_; fst; snd)

open import Cubed.Fun.Base using (_∘_; _|>_; id; const; flip)

open import Cubed.Path.Base using (_≡_)


module Cubed.Data.Stream.Fin-with-len where

private variable
  ℓ : Level
  A B : Type _
  m n k : Nat

data Cell (A : Type ℓ) : Nat → Type ℓ
record Stream (A : Type ℓ) (length : Nat) : Type ℓ

infixr 5 _∷_
data Cell A where
  [] : Cell A zero
  _∷_ : A → Stream A n → Cell A (suc n)

record Stream A length where
  coinductive
  constructor delay
  field
    force : Cell A length

open Stream public

empty : Stream A zero
empty .force = []

length : Stream A n → Nat
length {n = n} s = n

case : {B : Nat → Type ℓ} → B zero → ({n : Nat} → B (suc n)) → {n : Nat} → Stream A n → B n
case z s {n = zero} stream = z
case z s {n = suc n} stream = s

foldl : {B : Nat → Type ℓ} → ({n : Nat} → B n → A → B (suc n)) → B zero → {n : Nat} → Stream A n → B n
foldl ih init {n = zero} s = init
foldl {B = B} ih init {n = suc n} s = s .force |> λ where (a ∷ s') → foldl {B = B ∘ suc} ih (ih init a) s'

foldr : {B : Nat → Type ℓ} → ({n : Nat} → A → B n → B (suc n)) → B zero → {n : Nat} → Stream A n → B n
foldr ih init {n = zero} s = init
foldr {B = B} ih init {n = suc n} s = s .force |> λ where (a ∷ s') → ih a (foldr {B = B} ih init s')

from-list : (elts : List A) → Stream A (List.length elts)
from-list [] .force = []
from-list (x ∷ elts) .force = x ∷ from-list elts

to-list : Stream A n → List A
to-list = foldr _∷_ []

map : (A → B) → Stream A n → Stream B n
map {n = zero} f s .force = []
map {n = suc n} f s .force = s .force |> λ where (x ∷ s') → f x ∷ map f s'

head : Stream A (suc n) → A
head s = s .force |> λ where (x ∷ s') → x

safe-head : Stream A n → Maybe A
safe-head {n = zero} = const nothing
safe-head {n = suc n} = just ∘ head

tail : Stream A (suc n) → Stream A n
tail s .force = s .force |> λ where (x ∷ s') → s' .force

safe-tail : Stream A n → Maybe (Stream A (Nat.safe-pred n))
safe-tail {n = zero} = const nothing
safe-tail {n = suc n} = just ∘ tail

pop : Stream A (suc n) → A × Stream A n
pop s = s .force |> λ where (x ∷ s') → x , s'

safe-pop : Stream A n → Maybe (A × Stream A (Nat.safe-pred n))
safe-pop {n = zero} = const nothing
safe-pop {n = suc n} = just ∘ pop

infixr 5 _++_
_++_ : Stream A m → Stream A n → Stream A (m + n)
_++_ {m = zero} xs ys = ys
_++_ {m = suc m} xs ys .force = xs .force |> λ where (x ∷ xs') → x ∷ xs' ++ ys

reverse : Stream A n → Stream A n
reverse = foldl {B = Stream _} (λ where r a .force → a ∷ r) empty

