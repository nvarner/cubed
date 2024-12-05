open import Cubed.Level

open import Cubed.Data.Nat.Base using (Nat; zero; suc)

open import Cubed.Fun.Base using (_∘_; _|>_)


module Cubed.Codata.Stream.Base where

private variable
  ℓ : Level
  A B : Type _

record Stream (A : Type ℓ) : Type ℓ
data StreamCell (A : Type ℓ) : Type ℓ

infixr 5 _∷_
data StreamCell A where
  [] : StreamCell A
  _∷_ : A → Stream A → StreamCell A

record Stream A where
  coinductive
  constructor delay
  field
    force : StreamCell A

open Stream public


map : (A → B) → Stream A → Stream B
map f s .force = s .force |> λ where
  [] → []
  (x ∷ s') → f x ∷ map f s'

take : Nat → Stream A → Stream A
take zero s .force = []
take (suc n) s .force = s .force |> λ where
  [] → []
  (x ∷ s') → x ∷ take n s'

drop : Nat → Stream A → Stream A
drop zero s = s
drop (suc n) s = s .force |> λ where
  [] → s
  (x ∷ s') → drop n s'

infixr 5 _++_
_++_ : Stream A → Stream A → Stream A
(xs ++ ys) .force = xs .force |> λ where
  [] → []
  (x ∷ xs') → x ∷ xs' ++ ys

