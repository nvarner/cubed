open import Cubed.Level

open import Cubed.Data.Dec.Base as Dec using (Dec; yes; no)
open import Cubed.Data.List.Base as List using (List; []; _∷_)
open import Cubed.Data.Maybe.Base using (Maybe; just; nothing)
open import Cubed.Data.Nat.Base as Nat using (Nat; zero; suc; _+_)

open import Cubed.Fun.Base using (flip)


module Cubed.Data.Vec.Base where

private variable
  ℓ : Level
  A : Type _
  m n : Nat

infixr 5 _∷_
data Vec (A : Type ℓ) : Nat → Type ℓ where
  [] : Vec A zero
  _∷_ : A → Vec A n → Vec A (suc n)

foldl :
  {B : Nat → Type ℓ} →
  ({n : Nat} → B n → A → B (suc n)) → B zero →
  Vec A n → B n
foldl f init [] = init
foldl {n = suc n} f init (x ∷ as) = foldl (λ {n} → f {suc n}) (f init x) as

reverse : Vec A n → Vec A n
reverse = foldl {B = Vec _} (λ {n} xs x → x ∷ xs) []

infixr 5 _++_
_++_ : Vec A m → Vec A n → Vec A (m + n)
[] ++ ys = ys
(x ∷ xs) ++ ys = x ∷ (xs ++ ys)

from-list : (xs : List A) → Vec A (List.length xs)
from-list [] = []
from-list (x ∷ xs) = x ∷ from-list xs

to-list : Vec A n → List A
to-list [] = []
to-list (x ∷ xs) = x ∷ to-list xs

head : Vec A (suc n) → A
head (a ∷ as) = a

safe-head : Vec A n → Maybe A
safe-head [] = nothing
safe-head (a ∷ as) = just a

tail : Vec A (suc n) → Vec A n
tail (a ∷ as) = as

safe-tail : Vec A n → Maybe (Vec A (Nat.safe-pred n))
safe-tail [] = nothing
safe-tail (a ∷ as) = just as

data Is-empty {A : Type ℓ} : Vec A n → Type (level A) where
  [] : Is-empty []

is-empty? : (as : Vec A n) → Dec (Is-empty as)
is-empty? [] = yes []
is-empty? (a ∷ as) = no λ ()

