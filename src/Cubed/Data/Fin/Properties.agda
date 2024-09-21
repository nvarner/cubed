open import Cubed.Core.Prelude
open import Cubed.Data.Fin.Base

open import Cubed.Data.Nat.Base using (Nat ; zero ; suc)

open Notation

module Cubed.Data.Fin.Properties where

private variable
  m n : Nat

zero≃ : Fin zero ≃ ⊥
zero≃ = {!!}
  where private

×≃ : Fin m × Fin n ≃ Fin (m · n)
×≃ {zero} {n} = {!!}
×≃ {suc m} {n} = {!!}

