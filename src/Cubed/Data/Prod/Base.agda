open import Cubed.Level


module Cubed.Data.Prod.Base where

private variable
  ℓ ℓ' : Level
  A B C : Type _
  B₁ C₁ : A → Type _

open import Agda.Builtin.Sigma public
  using (Σ ; _,_ ; fst ; snd)

infix 2 Σ-syntax
Σ-syntax : (A : Type ℓ) (B : A → Type ℓ') → Type (ℓ ⊔ ℓ')
Σ-syntax = Σ
syntax Σ-syntax A (λ x → B) = Σ[ x ∈ A ] B

infixr 5 _×_
_×_ : Type ℓ → Type ℓ' → Type (ℓ ⊔ ℓ')
A × B = Σ A (λ _ → B)

map-fst : (A → C) → A × B → C × B
map-fst f (a , b) = (f a , b)

map-snd : ({a : A} → B₁ a → C₁ a) → Σ A B₁ → Σ A C₁
map-snd f (a , b) = (a , f b)

