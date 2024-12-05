open import Cubed.Level

open import Cubed.Data.Unit.Base using (Unit; tt)

open import Cubed.Effect.Functor
open import Cubed.Effect.Applicative
open import Cubed.Effect.Monad

open import Cubed.Fun.Base using (_∘_; id; const)


module Cubed.Effect.Monad.Reader.Trans where

private variable
  ℓ ℓ' : Level
  A R : Type _
  M : Type _ → Type _

record Raw-monad-reader (R : Type ℓ) (M : Type ℓ → Type ℓ') : Type (lsuc ℓ ⊔ ℓ') where
  field
    reader : (R → A) → M A
    local : (R → R) → M A → M A

  ask : M R
  ask = reader id

open Raw-monad-reader {{...}} public


record ReaderT (R : Type ℓ) (M : Type ℓ → Type ℓ') (A : Type ℓ) : Type (ℓ ⊔ ℓ') where
  constructor mk
  field
    run : R → M A

open ReaderT public

instance functor : {{Raw-functor M}} → Raw-functor (ReaderT R M)
functor = record
  { map = λ f Ma → mk (λ r → f <$> run Ma r)
  }

instance applicative : {{Raw-monad M}} → Raw-applicative (ReaderT R M)
applicative = record
  { pure = mk ∘ const ∘ pure
  ; seq = λ Mf Mx → mk (λ r → run Mf r <*> run Mx r)
  }

instance monad : {{Raw-monad M}} → Raw-monad (ReaderT R M)
monad = record
  { bind = λ Ma f → mk (λ r → do
      a ← run Ma r
      run (f a) r)
  }

instance monadT : Raw-monadT {ℓ' = ℓ} (ReaderT R)
monadT = record
  { liftM = mk ∘ const
  }

instance monad-reader : {{Raw-monad M}} → Raw-monad-reader R (ReaderT R M)
monad-reader = record
  { reader = λ f → mk (pure ∘ f)
  ; local = λ f Ma → mk (run Ma ∘ f)
  }

