open import Cubed.Level

open import Cubed.Data.Prod.Base using (Σ; Σ-syntax; _×_; _,_; fst; snd)

open import Cubed.Fun.Base as Fun using (_∘_; uncurry')


module Cubed.Grammars.Mutual {ℓ} (Alph : Type ℓ) where

open import Cubed.Grammars.Base Alph hiding (rec; map)

private variable
  Branch : Type ℓ
  Idx : Branch → Type ℓ

data Mutual-functor (Branch : Type ℓ) (Idx : Branch → Type ℓ) : Type (lsuc ℓ) where
  k : Lin → Mutual-functor Branch Idx
  Var : (branch : Branch) → Idx branch → Mutual-functor Branch Idx
  &ᴰ ⊕ᴰ : (A : Type ℓ) → (A → Mutual-functor Branch Idx) → Mutual-functor Branch Idx
  _⊗_ : Mutual-functor Branch Idx → Mutual-functor Branch Idx → Mutual-functor Branch Idx

to-functor : Mutual-functor Branch Idx → Functor (Σ Branch Idx)
to-functor (k G) = k G
to-functor (Var branch idx) = Var (branch , idx)
to-functor (&ᴰ A F) = &ᴰF A (to-functor ∘ F)
to-functor (⊕ᴰ A F) = ⊕ᴰF A (to-functor ∘ F)
to-functor (F ⊗ F') = to-functor F ⊗F to-functor F'

μ-mutual :
  ((branch : Branch) → Idx branch → Mutual-functor Branch Idx) →
  (branch : Branch) → Idx branch → Lin
μ-mutual F branch idx = μ (λ (branch , idx) → to-functor (F branch idx)) (branch , idx)

