module Cubed.Core.Notation where

open import Cubed.Core.Primitives

private
  variable
    ℓ ℓ' : Level


record ⊤Notation (op : Level → Level) (A : (ℓ : Level) → Type (op ℓ)) : Typeω where
  field
    ⊤ : A ℓ

open ⊤Notation {{...}} public


record ⊥Notation (op : Level → Level) (A : (ℓ : Level) → Type (op ℓ)) : Typeω where
  field
    ⊥ : A ℓ

open ⊥Notation {{...}} public


record ×Notation (op : Level → Level) (A : (ℓ : Level) → Type (op ℓ)) : Typeω where
  field
    op2 : Level → Level → Level
    _×_ : A ℓ → A ℓ' → A (op2 ℓ ℓ')
  infixr 5 _×_

open ×Notation {{...}} public hiding (op2)

