module Cubed.Data.Fin.Base where

open import Cubed.Prelude

data Fin : Nat → Type where
  zero : {n : Nat} → Fin (suc n)
  suc : {n : Nat} → Fin n → Fin (suc n)

→Nat : ∀ {n} → Fin n → Nat
→Nat zero = zero
→Nat (suc k) = suc (→Nat k)

