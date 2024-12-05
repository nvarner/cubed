open import Cubed.Level

open import Cubed.Effect.Functor
open import Cubed.Effect.Applicative
open import Cubed.Effect.Monad

open import Cubed.Fun.Base using (_∘_)

open import Cubed.IO.Base as IO using (IO)


module Cubed.IO.Effectful where

private variable
  ℓ : Level

instance functor : Raw-functor {ℓ = ℓ} IO
functor = record
  { map = λ f a → IO.bind a (IO.pure ∘ f)
  }

instance applicative : Raw-applicative {ℓ = ℓ} IO
applicative = record
  { pure = IO.pure
  ; seq = λ f a → IO.bind a (λ a → IO.bind f (λ f → IO.pure (f a)))
  }

instance monad : Raw-monad {ℓ = ℓ} IO
monad = record
  { bind = IO.bind
  }

