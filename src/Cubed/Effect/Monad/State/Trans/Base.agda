open import Cubed.Level

open import Cubed.Data.Prod.Base using (_×_; _,_; fst; snd; map-snd)
open import Cubed.Data.Unit.Base using (Unit; tt)

open import Cubed.Effect.Functor
open import Cubed.Effect.Applicative
open import Cubed.Effect.Monad

open import Cubed.Fun.Base using (_∘_; id; const)


module Cubed.Effect.Monad.State.Trans.Base where

private variable
  ℓ ℓ' : Level
  A S : Type _
  M : Type _ → Type _

record Raw-monad-state (S : Type ℓ) (M : Type ℓ → Type ℓ') : Type (lsuc ℓ ⊔ ℓ') where
  field
    gets : (S → A) → M A
    modify : (S → S) → M (Lift Unit)

  get : M S
  get = gets id

  put : S → M (Lift Unit)
  put = modify ∘ const

open Raw-monad-state {{...}} public


record StateT (S : Type ℓ) (M : Type ℓ → Type ℓ') (A : Type ℓ) : Type (ℓ ⊔ ℓ') where
  constructor mk
  field
    run : S → M (S × A)

open StateT public

eval : {{Raw-functor M}} → StateT S M A → S → M A
eval Ma s = snd <$> run Ma s

exec : {{Raw-functor M}} → StateT S M A → S → M S
exec Ma s = fst <$> run Ma s


instance functor : {{Raw-functor M}} → Raw-functor (StateT S M)
functor = record
  { map = λ f Ma → mk (λ s → map-snd f <$> run Ma s)
  }

instance applicative : {{Raw-monad M}} → Raw-applicative (StateT S M)
applicative = record
  { pure = λ a → mk (pure ∘ (_, a))
  ; seq = λ Mf Ma → mk (λ s → do
      (s' , f) ← run Mf s
      (s'' , a) ← run Ma s'
      pure (s'' , f a))
  }

instance monad : {{Raw-monad M}} → Raw-monad (StateT S M)
monad = record
  { bind = λ Ma f → mk (λ s → do
      (s' , a) ← run Ma s
      run (f a) s')
  }

instance monadT : Raw-monadT {ℓ' = ℓ} (StateT S)
monadT = record
  { liftM = λ Ma → mk (λ s → (s ,_) <$> Ma)
  }

instance monad-state : {{Raw-monad M}} → Raw-monad-state S (StateT S M)
monad-state = record
  { gets = λ f → mk (λ s → pure (s , f s))
  ; modify = λ f → mk (λ s → pure (f s , liftℓ tt))
  }

