open import Cubed.Level

open import Cubed.Fun.Base using (_∘_)

open import Cubed.Path.Base as Path using (PathP; Path; _≡_; _∙_; sym; cong; J)


-- Identity system things are tagged with -ₛ, for "system" (or perhaps "specialized")
module Cubed.Id.Base where

private variable
  ℓ ℓ' : Level
  A B : Type _

record Id-sys (A : Type ℓ) : Type (lsuc ℓ) where
  infix 4 _≡ₛ_
  field
    _≡ₛ_ : A → A → Type ℓ
    reflₛ : {x : A} → x ≡ₛ x
    ≡ₛ→≡ : {x y : A} (id : x ≡ₛ y) → x ≡ y
    path-to-reflₛ : {x y : A} (eq : x ≡ₛ y) → PathP (λ i → ≡ₛ→≡ eq i ≡ₛ y) eq reflₛ

  ≡→≡ₛ : {x y : A} (p : x ≡ y) → x ≡ₛ y
  ≡→≡ₛ {x = x} {y} = J (λ y p → x ≡ₛ y) reflₛ

open Id-sys {{...}} public

{-# DISPLAY Id-sys._≡ₛ_ A x y = x ≡ₛ y #-}
{-# DISPLAY Id-sys.reflₛ A = reflₛ #-}
{-# DISPLAY Id-sys.≡ₛ→≡ A x y id = ≡ₛ→≡ x y id #-}
{-# DISPLAY Id-sys.≡→≡ₛ A x y id = ≡→≡ₛ x y id #-}

symₛ : {{id-sys : Id-sys A}} {x y : A} → x ≡ₛ y → y ≡ₛ x
symₛ = ≡→≡ₛ ∘ sym ∘ ≡ₛ→≡

congₛ : {{A-id-sys : Id-sys A}} {{B-id-sys : Id-sys B}} → (f : A → B) → {x y : A} → x ≡ₛ y → f x ≡ₛ f y
congₛ f = ≡→≡ₛ ∘ cong f ∘ ≡ₛ→≡

infixr 30 _∙ₛ_
_∙ₛ_ : {{id-sys : Id-sys A}} {x y z : A} → x ≡ₛ y → y ≡ₛ z → x ≡ₛ z
eq₁ ∙ₛ eq₂ = ≡→≡ₛ (≡ₛ→≡ eq₁ ∙ ≡ₛ→≡ eq₂)

