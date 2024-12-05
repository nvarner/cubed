open import Cubed.Level

open import Cubed.Effect.Functor
open import Cubed.Effect.Applicative
open import Cubed.Effect.Monad


module Cubed.Effect.Monad.Id where

private variable
  ℓ : Level

record Id (A : Type ℓ) : Type ℓ where
  constructor mk
  field
    run : A

open Id public

instance functor : Raw-functor {ℓ = ℓ} Id
functor = record
  { map = λ f a → mk (f (run a))
  }

instance applicative : Raw-applicative {ℓ = ℓ} Id
applicative = record
  { pure = mk
  ; seq = λ f a → mk (run f (run a))
  }

instance monad : Raw-monad {ℓ = ℓ} Id
monad = record
  { bind = λ a f → f (run a)
  }

