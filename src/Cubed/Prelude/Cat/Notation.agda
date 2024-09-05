module Cubed.Prelude.Cat.Notation where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Cat.Instance.Product
open import Cubed.Prelude.Cat.Precat.Base

open Precat

private variable
  ℓob ℓhom ℓob' ℓhom' : Level


instance
  Precat-×-notation : Notation.×-notation
    (Precat ℓob ℓhom) (Precat ℓob' ℓhom')
    (Precat (ℓob ⊔ ℓob') (ℓhom ⊔ ℓhom'))
  Precat-×-notation .Notation.×-notation._×_ = _×_

