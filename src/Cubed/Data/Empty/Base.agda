open import Cubed.Level


module Cubed.Data.Empty.Base where

private variable
  A : Type _

data Empty : Type lzero where

rec : Empty → A
rec ()

