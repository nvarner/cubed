module Cubed.Data.Fin where

module Fin where

  open import Cubed.Data.Fin.Base public

open Fin
  using (Fin ; zero ; suc)
  hiding (module Fin)
  public

