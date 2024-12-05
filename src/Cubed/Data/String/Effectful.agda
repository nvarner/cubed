open import Cubed.Level

open import Cubed.Data.String.Base as String using (String; _++_)

open import Cubed.Effect.Semigroup
open import Cubed.Effect.Monoid


module Cubed.Data.String.Effectful where

instance semigroup : Raw-semigroup String
semigroup = record
  { _<>_ = _++_
  }

instance monoid : Raw-monoid String
monoid = record
  { mempty = ""
  }

