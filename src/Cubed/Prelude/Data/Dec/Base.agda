module Cubed.Prelude.Data.Dec.Base where

open import Cubed.Core.Prelude

private
  variable
    ℓ : Level
    A B : Type ℓ


module Dec where

  data Dec (A : Type ℓ) : Type ℓ where
    yes : A → Dec A
    no : ¬ A → Dec A

  rec : (A → B) → (¬ A → B) → Dec A → B
  rec f g (yes a) = f a
  rec f g (no ¬a) = g ¬a

  Lift-closed : Dec A → Dec (Lift {ℓ' = ℓ} A)
  Lift-closed (yes a) = yes (lift a)
  Lift-closed (no ¬a) = no (¬a ∘ lower)

  ⊤-closed : Dec Types.⊤
  ⊤-closed = yes tt

  ×-closed : Dec A → Dec B → Dec (A Types.× B)
  ×-closed (yes a) (yes b) = yes (a , b)
  ×-closed (no ¬a) _ = no (¬a ∘ fst)
  ×-closed _ (no ¬b) = no (¬b ∘ snd)

  instance
    inst-Lift-closed : {{Dec A}} → Dec (Lift {ℓ' = ℓ} A)
    inst-Lift-closed {{A-dec}} = Lift-closed A-dec

    inst-⊤-closed : Dec Types.⊤
    inst-⊤-closed = ⊤-closed

    inst-×-closed : {{Dec A}} → {{Dec B}} → Dec (A Types.× B)
    inst-×-closed {{A-dec}} {{B-dec}} = ×-closed A-dec B-dec

open Dec
  using (Dec ; yes ; no)
  hiding (module Dec)
  public

