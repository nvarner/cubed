module Cubed.Prelude.Data.Sum.Base where

open import Cubed.Core.Prelude

private
  variable
    ℓ ℓ' : Level


module Sum where

  data _⊎_ (A : Type ℓ) (B : Type ℓ') : Type (ℓ ⊔ ℓ') where
    inl : A → A ⊎ B
    inr : B → A ⊎ B

open Sum
  using (_⊎_ ; inl ; inr)
  public

