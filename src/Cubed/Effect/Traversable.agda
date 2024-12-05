open import Cubed.Level

open import Cubed.Effect.Applicative using (Raw-applicative)
open import Cubed.Effect.Foldable using (Raw-foldable)
open import Cubed.Effect.Functor using (Raw-functor; map)
open import Cubed.Effect.Monad using (Raw-monad)

open import Cubed.Fun.Base using (id; flip; _∘_)


module Cubed.Effect.Traversable where

private variable
  ℓ : Level
  A B : Type _
  F M : Type _ → Type _

record Raw-traversable (T : Type ℓ → Type ℓ) : Typeω where
  field
    overlap {{functor}} : Raw-functor T
    overlap {{foldable}} : Raw-foldable T
    traverse : {{Raw-applicative F}} → (A → F B) → T A → F (T B)

  sequenceA : {{Raw-applicative F}} → T (F A) → F (T A)
  sequenceA = traverse id

  mapM : {{Raw-monad M}} → (A → M B) → T A → M (T B)
  mapM = traverse

  forM : {{Raw-monad M}} → T A → (A → M B) → M (T B)
  forM = flip mapM

  sequence : {{Raw-monad M}} → T (M A) → M (T A)
  sequence = traverse id

open Raw-traversable {{...}} public hiding (functor; foldable)

