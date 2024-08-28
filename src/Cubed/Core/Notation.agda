module Cubed.Core.Notation where

open import Cubed.Core.Primitives

private
  variable
    ℓ ℓ' : Level


record ⊤-notation (op : Level → Level) (A : (ℓ : Level) → Type (op ℓ)) : Typeω where
  field
    ⊤ : A ℓ

open ⊤-notation {{...}} public


record ⊥-notation (op : Level → Level) (A : (ℓ : Level) → Type (op ℓ)) : Typeω where
  field
    ⊥ : A ℓ

open ⊥-notation {{...}} public


record ×-notation (op : Level → Level) (A : (ℓ : Level) → Type (op ℓ)) : Typeω where
  field
    op2 : Level → Level → Level
    _×_ : A ℓ → A ℓ' → A (op2 ℓ ℓ')
  infixr 5 _×_

open ×-notation {{...}} public hiding (op2)


record ⟦⟧-notation (A : Type ℓ) : Typeω where
  field
    ⟦⟧-ℓ : Level
    ⟦A⟧ : Type ⟦⟧-ℓ
    ⟦_⟧ : A → ⟦A⟧

open ⟦⟧-notation {{...}} public using (⟦_⟧)

