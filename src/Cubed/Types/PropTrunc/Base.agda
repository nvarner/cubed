module Cubed.Types.PropTrunc.Base where

open import Cubed.Core.Prelude

private
  variable
    ℓ : Level
    A B : Type ℓ

data ∥_∥ (A : Type ℓ) : Type ℓ where
  ∣_∣ : A → ∥ A ∥
  squash : (x y : ∥ A ∥) → x ≡ y

rec : (A → B) → Is-prop B → ∥ A ∥ → B
rec f _ ∣ a ∣ = f a
rec f B-hlevel@(pf-is-prop B-is-prop) (squash ∣a∣ ∣a'∣ i) =
  B-is-prop (rec f B-hlevel ∣a∣) (rec f B-hlevel ∣a'∣) i

has-is-prop : Is-prop ∥ A ∥
has-is-prop = pf-is-prop squash

