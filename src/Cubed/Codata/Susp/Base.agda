open import Cubed.Level


module Cubed.Codata.Susp.Base where

private variable
  ℓ : Level
  A B : Type _

record Susp (A : Type ℓ) : Type ℓ where
  coinductive
  constructor delay
  field
    force : A

open Susp public

rec : (A → B) → Susp A → B
rec f a = f (a .force)

map : (A → B) → Susp A → Susp B
map f a .force = rec f a

