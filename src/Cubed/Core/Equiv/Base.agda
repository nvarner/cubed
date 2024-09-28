open import Cubed.Core.Primitives
open import Cubed.Core.Types
open import Cubed.Core.Functions
open import Cubed.Core.Path
open import Cubed.Core.HLevel.Base
open import Cubed.Core.HLevel.Properties

open import Cubed.Core.Canonical

module Cubed.Core.Equiv.Base where

private variable
  ℓ ℓ' : Level
  A B : Type _


record Is-equiv (f : A → B) : Type (level A ⊔ level B) where
  no-eta-equality
  field
    equiv-proof : (y : B) → Is-contr (Fiber f y)

open Is-equiv public


infix 4 _≃_
_≃_ : Type ℓ → Type ℓ' → Type (ℓ ⊔ ℓ')
A ≃ B = Σ (A → B) Is-equiv

inv : A ≃ B → B → A
inv e b = Is-contr.center (e .snd .equiv-proof b) .fst

has-contr-fibers : (e : A ≃ B) (y : B) → Is-contr (Fiber ⟨ e ⟩ y)
has-contr-fibers e = e .snd .equiv-proof

opaque
  cubical-contr :
    (A : Type ℓ) → Is-contr A →
    (ϕ : I) → (u : Partial ϕ A) → A
  cubical-contr A A-is-contr ϕ u = hcomp (λ i →
    λ { (ϕ = i1) → sym ((A-is-contr .≡center) (u 1=1)) i
      ; (ϕ = i0) → (A-is-contr .center) }) (A-is-contr .center)
    where open Is-contr

  cubical-equiv-proof :
    (A : Type ℓ) (B : Type ℓ') (e : A ≃ B) →
    (y : B) (ψ : I) (f : Partial ψ (Fiber ⟨ e ⟩ y)) → Fiber ⟨ e ⟩ y [ ψ ↦ f ]
  cubical-equiv-proof A B e y ψ f =
    inS (cubical-contr (Fiber ⟨ e ⟩ y) (has-contr-fibers e y) ψ f)

{-# BUILTIN EQUIV _≃_ #-}
{-# BUILTIN EQUIVFUN fst #-}
{-# BUILTIN EQUIVPROOF cubical-equiv-proof #-}

