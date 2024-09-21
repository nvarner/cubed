module Cubed.DiscProb.Base where

open import Cubed.Core.Prelude

open import Cubed.Data.Dec.Base using (Is-discrete)

private variable
  ℓ : Level

module _ (Sample : Σ (Type ℓ) Is-discrete) where
  Event : Type (lsuc ℓ)
  Event = ⟨ Sample ⟩ → Type ℓ

