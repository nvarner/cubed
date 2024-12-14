open import Cubed.Level


module Cubed.Data.Sum.Base where

private variable
  ℓ ℓ' : Level
  A B : Type _

infixr 1 _⊎_
data _⊎_ (A : Type ℓ) (B : Type ℓ') : Type (ℓ ⊔ ℓ') where
  inl : A → A ⊎ B
  inr : B → A ⊎ B

[_,_] :
  {C : A ⊎ B → Type ℓ} →
  ((a : A) → C (inl a)) → ((b : B) → C (inr b)) →
  (ab : A ⊎ B) → C ab
[ f , g ] (inl a) = f a
[ f , g ] (inr b) = g b

