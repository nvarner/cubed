module Cubed.Prelude.Effect.Choice where

open import Cubed.Core.Prelude

private
  variable
    ℓ ℓ' : Level
    A : Type ℓ

record is-choice
  (F : Type ℓ → Type ℓ')
  (or-else : ∀ {A} → F A → F A → F A) :
  Type (lsuc ℓ ⊔ ℓ') where
  field
    or-else-assoc : (a b c : F A) →
      or-else a (or-else b c) ≡ or-else (or-else a b) c

record Choice (F : Type ℓ → Type ℓ') : Type (lsuc ℓ ⊔ ℓ') where
  field
    or-else : F A → F A → F A
    has-is-choice : is-choice F or-else

  infixr 3 _<|>_

  _<|>_ : F A → F A → F A
  _<|>_ = or-else

record make-choice (F : Type ℓ → Type ℓ') : Type (lsuc ℓ ⊔ ℓ') where
  field
    or-else : F A → F A → F A
    or-else-assoc : (a b c : F A) →
      or-else a (or-else b c) ≡ or-else (or-else a b) c

  →Choice : Choice F
  →Choice = record
    { or-else = or-else
    ; has-is-choice = record
      { or-else-assoc = or-else-assoc
      }
    }

open Choice {{...}} public

