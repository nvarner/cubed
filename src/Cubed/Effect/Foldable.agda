open import Cubed.Level

open import Cubed.Data.List.Base as List using (List; []; _∷_; _++_)
open import Cubed.Data.Nat.Base as Nat using (Nat; zero; suc)
open import Cubed.Data.Unit.Base using (Unit; tt)

open import Cubed.Effect.Applicative using (Raw-applicative; pure; _*>_)
open import Cubed.Effect.Monad using (Raw-monad; _>=>_)
open import Cubed.Effect.Monoid using (Raw-monoid; mempty)
open import Cubed.Effect.Semigroup using (_<>_)

open import Cubed.Fun.Base using (flip)


module Cubed.Effect.Foldable where

private variable
  ℓ ℓ' : Level
  A B M : Type _
  M' F : Type _ → Type _

record Raw-foldable (T : Type ℓ → Type ℓ') : Typeω where
  field
    foldr : (A → B → B) → B → T A → B
    foldl : (B → A → B) → B → T A → B

  fold : {{Raw-monoid M}} → T M → M
  fold = foldr _<>_ mempty

  fold-map : {{Raw-monoid M}} → (A → M) → T A → M
  fold-map f = foldr (λ a m → f a <> m) mempty

  to-list : T A → List A
  to-list = foldr _∷_ []

  length : T A → Nat
  length = foldr (λ _ → suc) zero

  foldrM : {{Raw-monad M'}} → (A → B → M' B) → B → T A → M' B
  foldrM f init xs = foldl (λ acc x → acc >=> f x) pure xs init

  foldlM : {{Raw-monad M'}} → (B → A → M' B) → B → T A → M' B
  foldlM f init xs = foldr (λ x acc → flip f x >=> acc) pure xs init

  traverse- : {{Raw-applicative F}} → (A → F B) → T A → F (Lift Unit)
  traverse- f = foldr (λ x acc → f x *> acc) (pure _)

  for- : {{Raw-applicative F}} → T A → (A → F B) → F (Lift Unit)
  for- = flip traverse-

  concat : T (List A) → List A
  concat = foldr _++_ []

  concat-map : (A → List B) → T A → List B
  concat-map f = foldr (λ a xs → f a ++ xs) []

open Raw-foldable {{...}} public

