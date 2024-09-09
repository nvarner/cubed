module Cubed.Core.HLevel.Base where

open import Cubed.Core.Primitives
open import Cubed.Core.Types.Base
open import Cubed.Core.Paths.Base

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

upward-closed : Is-of-hlevel n A → Is-of-hlevel (suc n) A
upward-closed {n = zero} (pf-is-contr (x₀ , p)) = pf-is-prop (λ x y → p x ∙ sym (p y))
upward-closed {n = suc n} (pf-is-prop is-prop) = pf-suc (λ x y → pf-is-prop (λ p q → {!:wqa!}))
upward-closed {n = suc (suc n)} (pf-suc is-hlevel) = {!!}

