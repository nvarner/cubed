open import Cubed.Level


module Cubed.Effect.Semigroup where

private variable
  ℓ : Level

record Raw-semigroup (A : Type ℓ) : Type ℓ where
  field
    _<>_ : A → A → A

  infixr 6 _<>_

open Raw-semigroup {{...}} public

