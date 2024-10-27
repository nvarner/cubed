module Cubed.Core.InstanceSearch where

open import Cubed.Core.Primitives

private variable
  ℓ : Level


record Wrap (A : Type ℓ) : Type ℓ where
  constructor wrap
  field
    unwrap : A

open Wrap public


known! : {A : Type ℓ} {{a : A}} → A
known! {{a}} = a

