module Cubed.Core.HLevel.Base where

open import Cubed.Core.Primitives
open import Cubed.Core.Types
open import Cubed.Core.Path

open import Cubed.Core.Builtin
  using (module Nat)
open Nat

private variable
  ℓ : Level
  A : Type _
  n : Nat


data Is-of-hlevel {ℓ} : Nat → Type ℓ → Type (lsuc ℓ) where
  pf-is-contr : Σ[ x₀ ∈ A ] ((x : A) → x ≡ x₀) → Is-of-hlevel zero A
  pf-is-prop : ((x y : A) → x ≡ y) → Is-of-hlevel (suc zero) A
  pf-suc : ((x y : A) → Is-of-hlevel (suc n) (x ≡ y)) → Is-of-hlevel (suc (suc n)) A


Is-contr : Type ℓ → Type (lsuc ℓ)
Is-contr = Is-of-hlevel zero

Is-prop : Type ℓ → Type (lsuc ℓ)
Is-prop = Is-of-hlevel (suc zero)

Is-set : Type ℓ → Type (lsuc ℓ)
Is-set = Is-of-hlevel (suc (suc zero))

pf-is-set : ({x y : A} (p q : x ≡ y) → p ≡ q) → Is-set A
pf-is-set pf = pf-suc (λ x y → pf-is-prop pf)

Is-contr→Is-prop : Is-contr A → Is-prop A
Is-contr→Is-prop (pf-is-contr (x₀ , p)) = pf-is-prop (λ x y → p x ∙ sym (p y))

opaque
  Is-prop→Is-set : Is-prop A → Is-set A
  Is-prop→Is-set (pf-is-prop is-prop) =
    pf-suc (λ x y → pf-is-prop (λ p q j i →
      hcomp (λ k → λ { (i = i0) → is-prop x x k
                     ; (i = i1) → is-prop x y k
                     ; (j = i0) → is-prop x (p i) k
                     ; (j = i1) → is-prop x (q i) k
                     })
            x))

upward-closed : Is-of-hlevel n A → Is-of-hlevel (suc n) A
upward-closed is-contr@(pf-is-contr _) = Is-contr→Is-prop is-contr
upward-closed is-prop@(pf-is-prop _) = Is-prop→Is-set is-prop
upward-closed (pf-suc is-hlevel) = pf-suc (λ x y → upward-closed (is-hlevel x y))

