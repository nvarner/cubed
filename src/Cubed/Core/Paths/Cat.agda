module Cubed.Core.Paths.Cat where

open import Cubed.Core.Primitives
open import Cubed.Core.Paths.Base
open import Cubed.Core.Cat.Base


module _ {ℓ} (A : Type ℓ) where
  open Cat-raw

  Paths : Cat-raw ℓ
  Paths .Ob = A
  Paths .Hom x y = x ≡ y
  Paths .seq = _∙_

