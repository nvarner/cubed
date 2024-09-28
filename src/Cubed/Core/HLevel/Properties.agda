open import Cubed.Core.Primitives
open import Cubed.Core.Types
open import Cubed.Core.Path
open import Cubed.Core.HLevel.Base

open import Cubed.Core.Builtin using (module Nat)
open Nat

module Cubed.Core.HLevel.Properties where

private variable
  A : Type _
  n : Nat


mk-is-prop : (p : (x y : A) → x ≡ y) → Is-prop A
mk-is-prop p = p

mk'-is-prop : (p : (center : A) → ((a : A) → a ≡ center)) → Is-prop A
mk'-is-prop p x y = p y x

opaque
  Is-prop→Is-set : Is-prop A → Is-set A
  Is-prop→Is-set is-prop x y p q j i =
    hcomp (λ k →
      λ { (i = i0) → is-prop x x k
        ; (i = i1) → is-prop x y k
        ; (j = i0) → is-prop x (p i) k
        ; (j = i1) → is-prop x (q i) k
        })
      x

upward-closed : Is-hlevel n A → Is-hlevel (suc n) A
upward-closed {zero} = Is-contr.→Is-prop
upward-closed {suc zero} = Is-prop→Is-set
upward-closed {suc (suc n)} is-hlevel x y = upward-closed {suc n} (is-hlevel x y)

