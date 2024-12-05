-- Most of the monad infrastructure is taken from agda-stdlib

open import Cubed.Level

open import Cubed.Effect.Applicative using (Raw-applicative)

open import Cubed.Fun.Base using (flip; id; const)


module Cubed.Effect.Monad where

private variable
  ℓ ℓ' ℓ'' : Level
  A B C : Type _

record Raw-monad (M : Type ℓ → Type ℓ') : Type (lsuc ℓ ⊔ ℓ') where
  field
    overlap {{applicative}} : Raw-applicative M
    bind : M A → (A → M B) → M B

  infixl 1 _>>=_
  _>>=_ : M A → (A → M B) → M B
  _>>=_ = bind

  infixl 1 _>>_
  _>>_ : M A → M B → M B
  Ma >> Mb = Ma >>= const Mb

  infixr 1 _=<<_
  _=<<_ : (A → M B) → M A → M B
  _=<<_ = flip bind

  infixr 1 _>=>_
  _>=>_ : (A → M B) → (B → M C) → (A → M C)
  (f >=> g) a = f a >>= g

  infixr 1 _<=<_
  _<=<_ : (B → M C) → (A → M B) → (A → M C)
  _<=<_ = flip _>=>_

open Raw-monad {{...}} public hiding (applicative)

module _ {M : Type ℓ → Type ℓ} {{_ : Raw-monad M}} where

  join : M (M A) → M A
  join Ma = Ma >>= id

record Raw-monadTd (M : Type ℓ → Type ℓ') (TM : Type ℓ → Type ℓ'') : Type (lsuc ℓ ⊔ ℓ' ⊔ ℓ'') where
  field
    overlap {{monad}} : Raw-monad M
    liftM : M A → TM A

open Raw-monadTd {{...}} public hiding (monad)

Raw-monadT : ((Type ℓ → Type ℓ') → (Type ℓ → Type ℓ'')) → Type (lsuc ℓ ⊔ lsuc ℓ' ⊔ ℓ'')
Raw-monadT T = ∀ {M} → {{Raw-monad M}} → Raw-monadTd M (T M)

