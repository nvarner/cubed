module Cubed.Prelude.HLevel.Base where

open import Cubed.Core.Prelude

private
  variable
    ℓ ℓ' : Level
    A B : Type ℓ


is-contr : Type ℓ → Type ℓ
is-contr A = Σ[ base ∈ A ] ((a : A) → base ≡ a)

is-prop : Type ℓ → Type ℓ
is-prop A = (x y : A) → x ≡ y

is-prop→PathP :
  {B : I → Type ℓ} → ((i : I) → is-prop (B i)) →
  (b0 : B i0) (b1 : B i1) →
  PathP B b0 b1
is-prop→PathP Bi-is-prop b0 b1 = Path→PathP (Bi-is-prop _ _ _)

⊤-is-prop : is-prop ⊤
⊤-is-prop tt tt = refl

×-is-prop : is-prop A → is-prop B → is-prop (A × B)
×-is-prop A-is-prop B-is-prop (xA , xB) (yA , yB) i = (A-is-prop xA yA i) , (B-is-prop xB yB i)

→-is-prop : is-prop B → is-prop (A → B)
→-is-prop B-is-prop f g i a = B-is-prop (f a) (g a) i


instance
  inst-⊤-is-prop : Wrap is-prop ⊤
  inst-⊤-is-prop = wrap ⊤-is-prop

  inst-×-is-prop : {{Wrap is-prop A}} → {{Wrap is-prop B}} → Wrap is-prop (A × B)
  inst-×-is-prop {{A-is-prop}} {{B-is-prop}} =
    wrap (×-is-prop (unwrap A-is-prop) (unwrap B-is-prop))

  inst-→-is-prop : {{Wrap is-prop B}} → Wrap is-prop (A → B)
  inst-→-is-prop {{B-is-prop}} = wrap (→-is-prop (unwrap B-is-prop))

