module Cubed.Prelude.HLevel.Base where

open import Cubed.Core.Prelude

private
  variable
    ℓ : Level
    A B : Type ℓ


is-contr : Type ℓ → Type ℓ
is-contr A = Σ[ base ∈ A ] ((a : A) → base ≡ a)

is-prop : Type ℓ → Type ℓ
is-prop A = (x y : A) → x ≡ y

×-is-prop : is-prop A → is-prop B → is-prop (A × B)
×-is-prop A-is-prop B-is-prop (xA , xB) (yA , yB) i = (A-is-prop xA yA i) , (B-is-prop xB yB i)

→-is-prop : is-prop B → is-prop (A → B)
→-is-prop B-is-prop f g i a = B-is-prop (f a) (g a) i

