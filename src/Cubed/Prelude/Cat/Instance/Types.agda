module Cubed.Prelude.Cat.Instance.Types where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Cat.Precat.Base

open Precat

Types : (ℓ : Level) → Precat (lsuc ℓ) ℓ
Types ℓ .ob = Type ℓ
Types ℓ .hom A B = A → B
Types ℓ .id = idfun
Types ℓ .seq f g x = g (f x)
Types ℓ .id-seq = refl
Types ℓ .seq-id = refl
Types ℓ .seq-assoc f g h = refl


private module _ where

  open import Cubed.Prelude.Cat.Displayed.Base
  open import Cubed.Prelude.Cat.Displayed.StructureOver

  open import Cubed.Prelude.Data.Dec.Base

  open import Cubed.Prelude.HLevel.Base

  private
    variable
      ℓ ℓ' : Level

  Propᴰ : (ℓ : Level) → Displayed (Types ℓ) ℓ lzero
  Propᴰ ℓ = PropertyOver (Types ℓ) (Wrap is-prop)

  Prop : (ℓ : Level) → Precat (lsuc ℓ) ℓ
  Prop ℓ = ∫ (Propᴰ ℓ)

  Decidableᴰ : (ℓ : Level) → Displayed (Types ℓ) ℓ lzero
  Decidableᴰ ℓ = PropertyOver (Types ℓ) Dec

  Decidable : (ℓ : Level) → Precat (lsuc ℓ) ℓ
  Decidable ℓ = ∫ (Decidableᴰ ℓ)

  open Notation

  DecPropᴰ : (ℓ : Level) → Displayed (Types ℓ) ℓ lzero
  DecPropᴰ ℓ = PropertyOver _ (Dec × Wrap is-prop)

  instance
    inst-⊤-Prop : ⊤-notation (Prop lzero .ob)
    inst-⊤-Prop .⊤-notation.⊤ = ⊤ , known!

    inst-×-Prop : ×-notation (Prop ℓ .ob) (Prop ℓ' .ob) (Prop (ℓ ⊔ ℓ') .ob)
    inst-×-Prop .×-notation._×_ p q = (p .fst × q .fst) , known!
      where instance _ = p .snd ; _ = q .snd

    inst-⊤-Dec : ⊤-notation (Decidable lzero .ob)
    inst-⊤-Dec .⊤-notation.⊤ = ⊤ , known!

    inst-×-Dec : ×-notation (Decidable ℓ .ob) (Decidable ℓ' .ob) (Decidable (ℓ ⊔ ℓ') .ob)
    inst-×-Dec .×-notation._×_ A B = (A .fst × B .fst) , known!
      where instance _ = A .snd ; _ = B .snd

  -- _→'_ : Prop ℓ .ob → Prop ℓ' .ob → Prop (ℓ ⊔ ℓ') .ob
  -- p →' q = (p .fst → q .fst) , known!
  --   where instance _ = p .snd ; _ = q .snd


  -- test : Prop lzero .ob
  -- test = ⊤ × (⊤ →' ⊤)

  test2 : Decidable lzero .ob
  test2 = ⊤ × (⊤ × ⊤)

