module Cubed.Prelude.Data.Nat.Base where

module Nat where

  open import Agda.Builtin.Nat
    using (Nat ; zero ; suc ; _+_ ; _-_ ; _*_)
    public

open Nat
  using (Nat ; zero ; suc)
  hiding (module Nat)
  public

