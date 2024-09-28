open import Cubed.Core.Prelude

open import Cubed.Data.Nat.Base
  using (Nat ; zero ; suc)

module Cubed.Data.Fin.Base where

private variable
  n : Nat


data Fin : Nat → Type where
  zero : Fin (suc n)
  suc : Fin n → Fin (suc n)

weaken : Fin n → Fin (suc n)
weaken zero = zero
weaken (suc k) = suc (weaken k)

→Nat : ∀ {n} → Fin n → Nat
→Nat zero = zero
→Nat (suc k) = suc (→Nat k)

