module Cubed.Data.Finite.Base where

open import Cubed.Core.Prelude

open import Cubed.Data.DecProp.Base using (Dec-prop)
open import Cubed.Data.Fin.Base as Fin using (Fin)
open import Cubed.Data.Nat.Base using (Nat ; _·_)

open import Cubed.Types.PropTrunc.Base using (∥_∥ ; ∣_∣)

private variable
  ℓ ℓ' : Level


opaque
  Is-finite : Type ℓ → Type ℓ
  Is-finite A = Σ[ n ∈ Nat ] ∥ A ≃ Fin n ∥

Finite : (ℓ : Level) → Type (lsuc ℓ)
Finite ℓ = Σ (Type ℓ) Is-finite

opaque
  unfolding Is-finite

  _×_ : Finite ℓ → Finite ℓ' → Finite (ℓ ⊔ ℓ')
  (A , m , A-equiv-m) × (B , n , B-equiv-n) = A Types.× B , m · n , ?

opaque
  ℙ : Finite ℓ → (ℓP : Level) → Type (ℓ ⊔ lsuc ℓP)
  ℙ A ℓP = ⟨ A ⟩ → Type ℓP

opaque
  Decℙ-type : (ℓP : Level) → Finite ℓ → Type (ℓ ⊔ lsuc ℓP)
  Decℙ-type ℓP A = ⟨ A ⟩ → Dec-prop ℓP

opaque
  unfolding Decℙ-type Is-finite

  instance
    Decℙ-type-is-finite : {A : Finite ℓ} → Is-finite (Decℙ-type ℓ' A)
    Decℙ-type-is-finite = {!!}

opaque
  Decℙ : (ℓP : Level) → Finite ℓ → Finite (ℓ ⊔ lsuc ℓP)
  Decℙ ℓP A = Decℙ-type ℓP A , known!

