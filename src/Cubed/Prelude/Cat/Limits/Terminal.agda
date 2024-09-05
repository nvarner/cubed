module Cubed.Prelude.Cat.Limits.Terminal where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Cat.Precat.Base

open import Cubed.Prelude.HLevel.Base

private variable
  ℓob ℓhom : Level


module _
  (C : Precat ℓob ℓhom)
  where

  open Precat C

  is-terminal : ob → Type (ℓob ⊔ ℓhom)
  is-terminal a = (b : ob) → is-contr (hom b a)

  record Has-terminal : Type (ℓob ⊔ ℓhom) where
    field
      ⊤ : ob
      ⊤-is-terminal : is-terminal ⊤

