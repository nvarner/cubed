open import Cubed.Core.Primitives
open import Cubed.Core.Types
open import Cubed.Core.Path

open import Cubed.Core.Builtin using (module Nat)
open Nat

module Cubed.Core.HLevel.Base where

private variable
  ℓ : Level
  A : Type _
  n : Nat


Is-prop : (A : Type ℓ) → Type ℓ
Is-prop A = (x y : A) → x ≡ y

record Is-contr (A : Type ℓ) : Type ℓ where
  constructor mk-is-contr
  field
    center : A
    ≡center : (a : A) → a ≡ center

  →≡ : (x y : A) → x ≡ y
  →≡ x y = ≡center x ∙ sym (≡center y)

  →Is-prop : Is-prop A
  →Is-prop = →≡

Is-hlevel : (n : Nat) → (A : Type ℓ) → Type ℓ
Is-hlevel zero = Is-contr
Is-hlevel (suc zero) = Is-prop
Is-hlevel (suc (suc n)) A = (x y : A) → Is-hlevel (suc n) (x ≡ y)

Is-set : (A : Type ℓ) → Type ℓ
Is-set = Is-hlevel 2

Is-groupoid : (A : Type ℓ) → Type ℓ
Is-groupoid = Is-hlevel 3

