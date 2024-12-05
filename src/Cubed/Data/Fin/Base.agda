open import Cubed.Level

open import Cubed.Data.Nat.Base using (Nat; zero; suc)


module Cubed.Data.Fin.Base where

private variable
  n : Nat

data Fin : Nat → Type where
  zero : Fin (suc n)
  suc : Fin n → Fin (suc n)

weaken : Fin n → Fin (suc n)
weaken zero = zero
weaken (suc k) = suc (weaken k)

to-nat : ∀ {n} → Fin n → Nat
to-nat zero = zero
to-nat (suc k) = suc (to-nat k)

