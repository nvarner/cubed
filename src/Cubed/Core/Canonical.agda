module Cubed.Core.Canonical where

open import Cubed.Core.Primitives
open import Cubed.Core.Types
open import Cubed.Core.Path

private variable
  ℓ ℓ' : Level
  A B C : Type _
  P : A → Type _

record Map (From : Type ℓ) (To : Type ℓ') : Type (ℓ ⊔ ℓ') where
  constructor mk
  field
    ⟨_⟩ : From → To

open Map {{...}} public

instance
  id-map : Map A A
  id-map = mk (λ a → a)

  Σ-map : {{Map A B}} → Map (Σ A P) B
  Σ-map = mk (λ (a , p) → ⟨ a ⟩)

_to_ : {From : Type ℓ} → From → (To : Type ℓ') {{_ : Map From To}} → To
_to_ from To = ⟨ from ⟩

infixl 10 _to_

