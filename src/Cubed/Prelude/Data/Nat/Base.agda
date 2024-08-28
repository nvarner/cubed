module Cubed.Prelude.Data.Nat.Base where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Data.Dec.Base

module Nat where

  open import Agda.Builtin.Nat
    using (Nat ; zero ; suc ; _+_ ; _-_ ; _*_)
    public

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

open Nat
  using (Nat ; zero ; suc)
  hiding (module Nat)
  public

