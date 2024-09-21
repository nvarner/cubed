module Cubed.Data.Nat.Base where

open import Cubed.Core.Prelude

open import Cubed.Data.Dec.Base as Dec
  using (Dec ; yes ; no)

import Cubed.Core.Builtin as Builtin
open Builtin.Nat public

private variable
  ℓ : Level
  A B : Type _
  m n : Nat

instance
  inst-from-nat : Has-from-nat Nat
  inst-from-nat .Has-from-nat.Constraint n = Types.⊤
  inst-from-nat .Has-from-nat.fromNat n = n

  inst-+-notation : Notation.+-notation Nat Nat Nat
  inst-+-notation = Notation.mk _+_

  inst-·-notation : Notation.·-notation Nat Nat Nat
  inst-·-notation = Notation.mk _·_

elim :
  {B : Nat → Type ℓ} →
  B zero →
  (∀ n → B n → B (suc n)) →
  ∀ n → B n
elim B-zero B-suc zero = B-zero
elim B-zero B-suc (suc n) = B-suc n (elim B-zero B-suc n)

rec : {B : Type ℓ} → B → (Nat → B → B) → Nat → B
rec = elim

data _<_ : Nat → Nat → Type lzero where
  z<s : zero < suc n
  suc : m < n → suc m < suc n

instance
  inst-z<s : zero < suc n
  inst-z<s = z<s

  inst-<-suc : {{m < n}} → suc m < suc n
  inst-<-suc {{m<n}} = suc m<n

_>_ : Nat → Nat → Type lzero
m > n = n < m

instance
  inst-<-notation : Notation.<-notation Nat
  inst-<-notation = Notation.strict-ord-from-<.< _ _<_

  inst->-notation : Notation.>-notation Nat
  inst->-notation = Notation.strict-ord-from-<.> _ _<_

max : Nat → Nat → Nat
max zero n = n
max m zero = m
max (suc m) (suc n) = suc (max m n)

safe-pred : Nat → Nat
safe-pred zero = zero
safe-pred (suc n) = n

is-zero : Nat → Type lzero
is-zero zero = Types.⊤
is-zero (suc n) = Types.⊥

