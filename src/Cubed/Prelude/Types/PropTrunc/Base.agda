module Cubed.Prelude.Types.PropTrunc.Base where

open import Cubed.Core.Prelude

open import Cubed.Prelude.HLevel.Base

private
  variable
    ℓ : Level
    A B : Type ℓ

module PropTrunc where

  data ∥_∥ (A : Type ℓ) : Type ℓ where
    ∣_∣ : A → ∥ A ∥
    squash : is-prop ∥ A ∥

  rec : (A → B) → is-prop B → ∥ A ∥ → B
  rec f B-is-prop ∣ a ∣ = f a
  rec f B-is-prop (squash ∣a∣ ∣a'∣ i) =
    B-is-prop (rec f B-is-prop ∣a∣) (rec f B-is-prop ∣a'∣) i

  has-is-prop : is-prop ∥ A ∥
  has-is-prop = squash

open PropTrunc
  using (∥_∥ ; ∣_∣ ; squash)
  public

