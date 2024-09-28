open import Cubed.Core.Primitives
open import Cubed.Core.Types
open import Cubed.Core.Functions
open import Cubed.Core.Path
open import Cubed.Core.HLevel.Base
open import Cubed.Core.HLevel.Properties
open import Cubed.Core.Equiv.Base
open import Cubed.Core.Equiv.Glue
open import Cubed.Core.Iso.Base

open import Cubed.Core.Canonical
open import Cubed.Core.InstanceSearch

module Cubed.Core.Equiv.Properties where

private variable
  ℓ ℓ' ℓ'' : Level
  A B C : Type _
  f g : A → B

Is-iso→Is-equiv : Is-iso f → Is-equiv f
Is-iso→Is-equiv f-is-iso .equiv-proof y .Is-contr.center =
  f-is-iso .Is-iso.inv y , f-is-iso .Is-iso.inv-r y
Is-iso→Is-equiv f-is-iso .equiv-proof y .Is-contr.≡center = {!!}

instance
  inst-Is-iso→Is-equiv : {{Is-iso f}} → Is-equiv f
  inst-Is-iso→Is-equiv {{f-is-iso}} = Is-iso→Is-equiv f-is-iso

≅→≃ : A ≅ B → A ≃ B
≅→≃ (f , f-is-iso) = f , Is-iso→Is-equiv f-is-iso

module _
  {A : Type ℓ} {B : Type ℓ'} {C : Type ℓ''}
  (g : B ≃ C) (f : A ≃ B)
  where opaque
    private
      ∘-fiber : (y : C) → Fiber (⟨ g ⟩ ∘ ⟨ f ⟩) y
      ∘-fiber y .fst = inv f (inv g y)
      ∘-fiber y .snd = {!!} ∙ {!!}

      ∘-is-equiv : Is-equiv (⟨ g ⟩ ∘ ⟨ f ⟩)
      ∘-is-equiv .equiv-proof y = mk-is-contr (∘-fiber y) {!!}

    _∘≃_ : A ≃ C
    _∘≃_ .fst = ⟨ g ⟩ ∘ ⟨ f ⟩
    _∘≃_ .snd = ∘-is-equiv

_∙≃_ : A ≃ B → B ≃ C → A ≃ C
f ∙≃ g = g ∘≃ f

