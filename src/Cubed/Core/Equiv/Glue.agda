open import Cubed.Core.Primitives
open import Cubed.Core.Types.Base
open import Cubed.Core.Equiv.Base
open import Cubed.Core.Glue

module Cubed.Core.Equiv.Glue where

private variable
  ℓ ℓ' : Level
  A : Type _

open import Cubed.Core.Glue public
  renaming (prim^glue to glue)

@0 Glue :
  (A : Type ℓ) {ϕ : I} →
  (Te : Partial ϕ (Σ[ T ∈ Type ℓ' ] T ≃ A)) →
  Type ℓ'
Glue A Te = primGlue A (λ x → Te x .fst) (λ x → Te x .snd)

@0 unglue :
  (ϕ : I) {T : Partial ϕ (Type ℓ')} {e : PartialP ϕ (λ o → T o ≃ A)} →
  primGlue A T e → A
unglue ϕ = prim^unglue {ϕ = ϕ}

