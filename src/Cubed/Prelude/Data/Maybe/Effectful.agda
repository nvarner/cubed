module Cubed.Prelude.Data.Maybe.Effectful where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Cat.Precat.Base

open import Cubed.Prelude.Data.Maybe.Base

open import Cubed.Prelude.Effect.Functor

private
  variable
    ℓ : Level

open Ftor-on
open is-ftor

instance

  functor : TypeFtor {ℓ} Maybe
  functor .map f = Maybe.rec nothing (just ∘ f)
  functor .has-is-ftor .map-id = funext (Maybe.elim refl (λ a → refl))
  functor .has-is-ftor .map-seq = funext (Maybe.elim refl (λ a → refl))

