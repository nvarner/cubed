module Cubed.Data.Nat1.Base where

open import Cubed.Core.Prelude

open import Cubed.Data.Nat.Base as Nat using (Nat ; zero ; suc)


record Nat1 : Type lzero where
  constructor 1+_
  field
    pred : Nat

open Nat1 public

instance
  inst-from-nat : Has-from-nat Nat1
  inst-from-nat .Has-from-nat.Constraint zero = Types.⊥
  inst-from-nat .Has-from-nat.Constraint (suc n) = Types.⊤
  inst-from-nat .Has-from-nat.fromNat (suc n) = 1+ n

instance
  inst-to-nat : Canonical.Map Nat1 Nat
  inst-to-nat = Canonical.mk (suc ∘ pred)

_+_ : Nat1 → Nat1 → Nat1
(1+ m) + (1+ n) = 1+ (m Nat.+ n)

instance
  inst-+-notation : Notation.+-notation Nat1 Nat1 Nat1
  inst-+-notation = Notation.mk _+_

_·_ : Nat1 → Nat1 → Nat1
(1+ m) · (1+ n) = 1+ ((m Nat.· n) Nat.+ m Nat.+ n)

instance
  inst-·-notation : Notation.·-notation Nat1 Nat1 Nat1
  inst-·-notation = Notation.mk _·_

