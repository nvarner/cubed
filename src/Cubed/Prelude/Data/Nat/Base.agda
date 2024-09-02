module Cubed.Prelude.Data.Nat.Base where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Data.Dec.Base

module Nat where

  import Cubed.Core.Builtin as Builtin
  open Builtin.Nat public

  private variable
    m n : Nat

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

  znots : {n : Nat} → ¬ zero ≡ suc n
  znots p = subst is-zero p tt

  nat-≡-dec : (n m : Nat) → Dec (n ≡ m)
  nat-≡-dec zero zero = yes refl
  nat-≡-dec zero (suc m) = no znots
  nat-≡-dec (suc n) zero = no (znots ∘ sym)
  nat-≡-dec (suc n) (suc m) = nat-≡-dec n m & Dec.map (cong suc) (λ ¬p → ¬p ∘ cong safe-pred)

  instance
    inst-nat-≡-dec : {n m : Nat} → Dec (n ≡ m)
    inst-nat-≡-dec = nat-≡-dec _ _

    inst-<-notation : Notation.<-notation Nat
    inst-<-notation = Notation.strict-ord-from-<.< _ _<_

    inst->-notation : Notation.>-notation Nat
    inst->-notation = Notation.strict-ord-from-<.> _ _<_

open Nat
  using (Nat ; zero ; suc)
  hiding (module Nat)
  public

