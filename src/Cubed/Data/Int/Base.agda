open import Cubed.Data.Nat.Base as Nat using (Nat)


module Cubed.Data.Int.Base where

open import Agda.Builtin.Int public
  using (Int; pos; negsuc)
  renaming (primShowInteger to show)

-- open import Cubed.Core.Prelude

-- open import Cubed.Data.Nat.Base as Nat using (Nat ; zero)
-- open import Cubed.Data.Nat1.Base as Nat1 using (Nat1 ; 1+_)

-- open import Cubed.Core.Builtin as Builtin
-- open Builtin.Int public

-- private variable
--   A B : Type _

-- instance
--   inst-from-nat-lit : Has-from-nat Int
--   inst-from-nat-lit .Has-from-nat.Constraint n = Types.⊤
--   inst-from-nat-lit .Has-from-nat.fromNat n = pos n

--   inst-from-neg-lit : Has-from-neg Int
--   inst-from-neg-lit .Has-from-neg.Constraint n = Types.⊤
--   inst-from-neg-lit .Has-from-neg.fromNeg zero = pos zero
--   inst-from-neg-lit .Has-from-neg.fromNeg (Nat.suc n) = negsuc n

--   inst-from-nat : Canonical.Map Nat Int
--   inst-from-nat = Canonical.mk pos

--   inst-from-nat1 : Canonical.Map Nat1 Int
--   inst-from-nat1 = Canonical.mk (λ n → n to Nat to Int)

suc : Int → Int
suc (pos n) = pos (Nat.suc n)
suc (negsuc Nat.zero) = pos Nat.zero
suc (negsuc (Nat.suc n)) = negsuc n

pred : Int → Int
pred (pos Nat.zero) = negsuc Nat.zero
pred (pos (Nat.suc n)) = pos n
pred (negsuc n) = negsuc (Nat.suc n)

_+Nat_ : Int → Nat → Int
m +Nat Nat.zero = m
m +Nat Nat.suc n = suc (m +Nat n)

_-Nat_ : Int → Nat → Int
m -Nat Nat.zero = m
m -Nat Nat.suc n = pred (m -Nat n)

_+_ : Int → Int → Int
m + pos n = m +Nat n
m + negsuc n = m -Nat (Nat.suc n)

-- instance
--   inst-+-notation : Notation.+-notation Int Int Int
--   inst-+-notation = Notation.mk _+_

-_ : Int → Int
- pos Nat.zero = pos Nat.zero
- pos (Nat.suc n) = negsuc n
- negsuc n = pos (Nat.suc n)

-- instance
--   inst-neg-notation : Notation.neg-notation Int Int
--   inst-neg-notation = Notation.mk -_

_·Nat_ : Int → Nat → Int
m ·Nat Nat.zero = pos Nat.zero
m ·Nat Nat.suc n = m + (m ·Nat n)

_·_ : Int → Int → Int
m · pos n = m ·Nat n
m · negsuc n = - (m ·Nat Nat.suc n)

-- instance
--   inst-·-notation : Notation.·-notation Int Int Int
--   inst-·-notation = Notation.mk _·_

