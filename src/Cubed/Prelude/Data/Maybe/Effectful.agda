module Cubed.Prelude.Data.Maybe.Effectful where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Data.Maybe.Base

open import Cubed.Prelude.Effect.Alternative
open import Cubed.Prelude.Effect.Applicative
open import Cubed.Prelude.Effect.Choice
open import Cubed.Prelude.Effect.Empty

private
  variable
    ℓ : Level

instance
  applicative : Applicative {ℓ} Maybe
  applicative = make-applicative.→Applicative record
    { pure = just
    ; seq = Maybe.rec (const nothing) (λ f → Maybe.rec nothing (just ∘ f))
    ; seq-id = {!!}
    ; seq-comp = {!!}
    ; seq-hom = {!!}
    ; seq-interchange = {!!}
    }

