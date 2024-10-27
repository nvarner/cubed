{-# OPTIONS --lossy-unification #-}

open import Cubed.Core.Primitives
open import Cubed.Core.Types.Base
open import Cubed.Core.Fun.Base
open import Cubed.Core.Path
open import Cubed.Core.Square as Square using (_∙h_)
open import Cubed.Core.HLevel.Base
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

inv-is-equiv : (f-is-equiv : Is-equiv f) → Is-equiv (inv (f , f-is-equiv))
inv-is-equiv f-is-equiv = Is-iso→Is-equiv (inv-is-iso (Is-equiv→Is-iso f-is-equiv))

cong-by-fun : (e : A ≃ B) {x y : A} → (x ≡ y) ≃ (fun e x ≡ fun e y)
cong-by-fun e {x} {y} = ≅→≃ (cong (fun e) , cong-is-iso)
  where opaque
  unfolding cong
  cong-is-iso : Is-iso (cong {x = x} {y = y} (fun e))
  cong-is-iso .Is-iso.inv p i = {!p i!}
  cong-is-iso .Is-iso.inv-r = {!!}
  cong-is-iso .Is-iso.inv-l = {!!}
  -- cong-is-iso .Is-iso.inv p = sym (inv-r e x) ∙ cong (fun e) p ∙ inv-r e y
  -- cong-is-iso .Is-iso.inv-r p = cong.along-∙ (inv e) ∙h {!!}
  -- cong-is-iso .Is-iso.inv-l = {!!}

-- module _
--   {A : Type ℓ} {B : Type ℓ'} {C : Type ℓ''}
--   (g : B ≃ C) (f : A ≃ B)
--   where opaque
--     private
--       ∘-fiber : (y : C) → Fiber (⟨ g ⟩ ∘ ⟨ f ⟩) y
--       ∘-fiber y .fst = inv f (inv g y)
--       ∘-fiber y .snd = {!!} ∙ {!!}

--       ∘-is-equiv : Is-equiv (⟨ g ⟩ ∘ ⟨ f ⟩)
--       ∘-is-equiv .equiv-proof y = mk-is-contr (∘-fiber y) {!!}

--     _∘≃_ : A ≃ C
--     _∘≃_ .fst = ⟨ g ⟩ ∘ ⟨ f ⟩
--     _∘≃_ .snd = ∘-is-equiv

-- _∙≃_ : A ≃ B → B ≃ C → A ≃ C
-- f ∙≃ g = g ∘≃ f

