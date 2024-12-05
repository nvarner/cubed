open import Cubed.Level

open import Cubed.Data.Maybe.Base as Maybe using (Maybe; just)

open import Cubed.Effect.Functor
open import Cubed.Effect.Applicative
open import Cubed.Effect.Monad


module Cubed.Data.Maybe.Effectful where

private variable
  ℓ : Level

instance functor : Raw-functor {ℓ = ℓ} Maybe
functor = record
  { map = Maybe.map
  }

instance applicative : Raw-applicative {ℓ = ℓ} Maybe
applicative = record
  { pure = just
  ; seq = Maybe.seq
  }

instance monad : Raw-monad {ℓ = ℓ} Maybe
monad = record
  { bind = Maybe.bind
  }

