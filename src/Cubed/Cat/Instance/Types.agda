module Cubed.Cat.Instance.Types where

open import Cubed.Core.Prelude

open import Cubed.Cat.Base
  using (Precat)

open Precat

Types : (ℓ : Level) → Precat (lsuc ℓ) ℓ
Types ℓ .Ob = Type ℓ
Types ℓ .Hom A B = A → B
Types ℓ .id = idfun
Types ℓ ._⋆_ f g x = g (f x)
Types ℓ .⋆-id-l = refl
Types ℓ .⋆-id-r = refl
Types ℓ .⋆-assoc f g h = refl

