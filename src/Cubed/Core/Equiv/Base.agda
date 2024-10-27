open import Cubed.Core.Primitives
open import Cubed.Core.Types.Base
open import Cubed.Core.Fun.Base as Fun
  using (Fiber; Is-left-inv; Is-right-inv)
open import Cubed.Core.Path
open import Cubed.Core.Square as Square using (_∙h_)
open import Cubed.Core.HLevel.Base

module Cubed.Core.Equiv.Base where

private variable
  ℓ ℓ' : Level
  A B : Type _

open Is-contr


record Is-equiv (f : A → B) : Type (level A ⊔ level B) where
  no-eta-equality
  field
    equiv-proof : (y : B) → Is-contr (Fiber f y)

open Is-equiv public


infix 4 _≃_
_≃_ : Type ℓ → Type ℓ' → Type (ℓ ⊔ ℓ')
A ≃ B = Σ (A → B) Is-equiv

module _ (e : A ≃ B) where

  fun : A → B
  fun = e .fst

  inv : B → A
  inv b = (Is-contr.center (e .snd .equiv-proof b)) .fst

  has-contr-fibers : (y : B) → Is-contr (Fiber fun y)
  has-contr-fibers = e .snd .equiv-proof

  inv-r : Is-right-inv fun inv
  inv-r b = (Is-contr.center (has-contr-fibers b)) .snd

  inv-l : Is-left-inv fun inv
  inv-l a i = (Is-contr.≡center (has-contr-fibers (fun a))) (a , refl) (~ i) .fst

opaque
  cubical-contr :
    (A : Type ℓ) → Is-contr A →
    (ϕ : I) → (u : Partial ϕ A) → A
  cubical-contr A A-is-contr ϕ u = hcomp
    (λ i → λ where
      (ϕ = i1) → sym (≡center A-is-contr (u 1=1)) i
      (ϕ = i0) → center A-is-contr)
    (center A-is-contr)
    where open Is-contr

  cubical-equiv-proof :
    (A : Type ℓ) (B : Type ℓ') (e : A ≃ B) →
    (y : B) (ψ : I) (f : Partial ψ (Fiber (fun e) y)) → Fiber (fun e) y [ ψ ↦ f ]
  cubical-equiv-proof A B e y ψ f =
    inS (cubical-contr (Fiber (fun e) y) (has-contr-fibers e y) ψ f)

{-# BUILTIN EQUIV _≃_ #-}
{-# BUILTIN EQUIVFUN fst #-}
{-# BUILTIN EQUIVPROOF cubical-equiv-proof #-}

