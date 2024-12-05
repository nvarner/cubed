open import Cubed.Core.Primitives
open import Cubed.Core.Types.Base
open import Cubed.Core.Path
--open import Cubed.Core.Cube

open import Cubed.Core.Builtin using (module Nat)
open Nat

module Cubed.Core.HLevel.Base where

private variable
  ℓ : Level
  A : Type _
  n : Nat


Globe : (A : Type ℓ) (n : Nat) → Type ℓ
Globe A zero = Σ[ center ∈ A ] ((a : A) → a ≡ center)
Globe A (suc zero) = (x y : A) → x ≡ y
Globe A (suc (suc n)) = (x y : A) → Globe (x ≡ y) (suc n)

opaque
  Is-hlevel : (n : Nat) (A : Type ℓ) → Type ℓ
  Is-hlevel zero A = Σ[ center ∈ A ] ((a : A) → a ≡ center)
  Is-hlevel (suc zero) A = (x y : A) → x ≡ y
  Is-hlevel (suc (suc n)) A = (x y : A) → Is-hlevel (suc n) (x ≡ y)

Is-contr : (A : Type ℓ) → Type ℓ
Is-contr = Is-hlevel 0

Is-prop : (A : Type ℓ) → Type ℓ
Is-prop = Is-hlevel 1

Is-set : (A : Type ℓ) → Type ℓ
Is-set = Is-hlevel 2

Is-groupoid : (A : Type ℓ) → Type ℓ
Is-groupoid = Is-hlevel 3

opaque
  unfolding Is-hlevel

  mk-is-contr : (center : A) (≡center : (a : A) → a ≡ center) → Is-contr A
  mk-is-contr center ≡center = center , ≡center

  mk-is-prop : ((x y : A) → x ≡ y) → Is-prop A
  mk-is-prop p = p

  mk-is-set : ((x y : A) (p q : x ≡ y) → p ≡ q) → Is-set A
  mk-is-set p = p


module Is-contr (is-contr : Is-contr A) where
  opaque
    unfolding Is-hlevel

    center : A
    center = is-contr .fst

    ≡center : (a : A) → a ≡ center
    ≡center = is-contr .snd

  path : {x y : A} → x ≡ y
  path = ≡center _ ∙ sym (≡center _)

  is-prop : Is-prop A
  is-prop = mk-is-prop (λ x y → path)


module Is-set (is-set : Is-set A) where
  opaque
    unfolding Is-hlevel

    square :
      {a00 a01 a10 a11 : A}
      {left : a00 ≡ a01} {right : a10 ≡ a11}
      {bottom : a00 ≡ a10} {top : a01 ≡ a11} →
      Square left right bottom top
    square = ≡→[≡] (is-set _ _ _ _)


module Is-prop (is-prop : Is-prop A) where
  opaque
    unfolding Is-hlevel

    is-set : Is-set A
    is-set x y p q j i = hcomp
      (λ k → λ where
        (i = i0) → is-prop x x k
        (i = i1) → is-prop x y k
        (j = i0) → is-prop x (p i) k
        (j = i1) → is-prop x (q i) k)
      x

    path : {x y : A} → x ≡ y
    path = is-prop _ _

  Path-is-contr : (x y : A) → Is-contr (x ≡ y)
  Path-is-contr x y = mk-is-contr path (λ p → Is-set.square is-set)


opaque
  unfolding Is-hlevel

  is-hlevel-suc : Is-hlevel n A → Is-hlevel (suc n) A
  is-hlevel-suc {n = zero} = Is-contr.is-prop
  is-hlevel-suc {n = suc zero} = Is-prop.is-set
  is-hlevel-suc {n = suc (suc n)} is-hlevel x y =
    is-hlevel-suc {n = suc n} (is-hlevel x y)

  mk-is-hlevel+ :
    (path-is-hlevel : (x y : A) → Is-hlevel n (x ≡ y)) →
    Is-hlevel (suc n) A
  mk-is-hlevel+ {n = zero} path-is-contr x y =
    Is-contr.center (path-is-contr x y)
  mk-is-hlevel+ {n = suc n} path-is-hlevel = path-is-hlevel

  Path-is-hlevel :
    (is-hlevel : Is-hlevel (suc n) A)
    (x y : A) → Is-hlevel n (x ≡ y)
  Path-is-hlevel {n = zero} = Is-prop.Path-is-contr
  Path-is-hlevel {n = suc n} is-hlevel x y = is-hlevel x y

