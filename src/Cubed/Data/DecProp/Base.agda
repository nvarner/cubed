module Cubed.Data.DecProp.Base where

open import Cubed.Core.Prelude

open import Cubed.Data.Dec.Base using (Dec)

open Notation

private variable
  ℓ : Level


Is-dec-prop : Type ℓ → Type _
Is-dec-prop A = Dec A × Is-prop A

Dec-prop : (ℓ : Level) → Type _
Dec-prop ℓ = Σ (Type ℓ) Is-dec-prop

