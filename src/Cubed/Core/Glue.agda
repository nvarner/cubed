{-# OPTIONS --cubical #-}

open import Cubed.Core.Primitives
open import Cubed.Core.Equiv.Base

module Cubed.Core.Glue where

primitive
  primGlue :
    ∀ {ℓ ℓ'} (A : Type ℓ) {ϕ : I} →
    (T : Partial ϕ (Type ℓ')) (e : PartialP ϕ (λ o → T o ≃ A)) →
    Type ℓ'

  prim^glue :
    ∀ {ℓ ℓ'} {A : Type ℓ} {ϕ : I} →
    {T : Partial ϕ (Type ℓ')} → {e : PartialP ϕ (λ o → T o ≃ A)} →
    (t : PartialP ϕ T) → (a : A) → primGlue A T e

  prim^unglue :
    ∀ {ℓ ℓ'} {A : Type ℓ} {ϕ : I} →
    {T : Partial ϕ (Type ℓ')} → {e : PartialP ϕ (λ o → T o ≃ A)} →
    primGlue A T e → A

