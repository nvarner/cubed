module Cubed.Prelude.Effect.Alternative where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Data.List.Base
open import Cubed.Prelude.Data.Maybe.Base

open import Cubed.Prelude.Effect.Applicative
open import Cubed.Prelude.Effect.Choice
open import Cubed.Prelude.Effect.Empty
open import Cubed.Prelude.Effect.Functor

private
  variable
    ℓ ℓ' : Level
    A : Type ℓ


record is-alternative
  (F : Type ℓ → Type ℓ')
  (has-applicative : Applicative F)
  (has-empty : Empty F)
  (has-choice : Choice F) :
  Type (lsuc ℓ ⊔ ℓ') where
  instance
    _ = has-applicative
    _ = has-empty
    _ = has-choice
  field
    empty-or-else : (a : F A) →
      (empty <|> a) ≡ a
    or-else-empty : (a : F A) →
      (a <|> empty) ≡ a


record Alternative
  (F : Type ℓ → Type ℓ') :
  Type (lsuc ℓ ⊔ ℓ') where
  field
    overlap {{has-applicative}} : Applicative F
    overlap {{has-empty}} : Empty F
    overlap {{has-choice}} : Choice F
    has-is-alternative : is-alternative F has-applicative has-empty has-choice

open Alternative {{...}} public

