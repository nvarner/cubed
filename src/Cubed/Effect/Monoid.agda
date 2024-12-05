open import Cubed.Level

open import Cubed.Data.List.Base as List using (List; []; _∷_)

open import Cubed.Effect.Semigroup using (Raw-semigroup; _<>_)


module Cubed.Effect.Monoid where

private variable
  ℓ : Level

record Raw-monoid (A : Type ℓ) : Type ℓ where
  field
    overlap {{semigroup}} : Raw-semigroup A
    mempty : A

  mconcat : List A → A
  mconcat = List.foldr _<>_ mempty

open Raw-monoid {{...}} public hiding (semigroup)

