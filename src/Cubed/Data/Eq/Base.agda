open import Cubed.Level

open import Cubed.Path.Base as Path using ()


module Cubed.Data.Eq.Base where

private variable
  A : Type _

open import Agda.Builtin.Equality public
  using (_≡_; refl)

from-path : {x y : A} → x Path.≡ y → x ≡ y
from-path = Path.J (λ y p → _ ≡ y) refl

to-path : {x y : A} → x ≡ y → x Path.≡ y
to-path refl = Path.refl

