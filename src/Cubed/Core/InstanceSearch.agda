module Cubed.Core.InstanceSearch where

open import Cubed.Core.Primitives

private
  variable
    ℓ ℓ' : Level


record Wrap (P : Type ℓ → Type ℓ') (A : Type ℓ) : Type (ℓ ⊔ ℓ') where
  constructor wrap
  field
    unwrap : P A

open Wrap public


known! : {A : Type ℓ} {{a : A}} → A
known! {{a}} = a

