module Cubed.Data.Finite.Base where

open import Cubed.Prelude

open import Cubed.Data.Fin

private
  variable
    ℓ : Level


is-finite : Type ℓ → Type ℓ
is-finite A = Σ[ n ∈ Nat ] ∥ A ≃ Fin n ∥

Finite : (ℓ : Level) → Type (lsuc ℓ)
Finite ℓ = Σ (Type ℓ) is-finite

Decℙ : Finite ℓ → Type ?
Decℙ A = A .fst → ?

