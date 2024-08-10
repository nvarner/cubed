module Cubed.Prelude.Effect.Empty where

open import Cubed.Core.Prelude

private
  variable
    ℓ ℓ' : Level
    A : Type ℓ

record Empty (F : Type ℓ → Type ℓ') : Type (lsuc ℓ ⊔ ℓ') where
  field
    empty : F A

open Empty {{...}} public

