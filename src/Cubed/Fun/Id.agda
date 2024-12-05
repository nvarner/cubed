open import Cubed.Level

open import Cubed.Id.Base using (Id-sys; _≡ₛ_; reflₛ; ≡→≡ₛ; ≡ₛ→≡; path-to-reflₛ)

open import Cubed.Path.Base as Path using (_≡_; refl)


module Cubed.Fun.Id where

private variable
  ℓ ℓ' : Level

module _ {A : Type ℓ} {B : A → Type ℓ'} where

  infix 4 _≡'_
  _≡'_ : (f g : (a : A) → B a) → Type (ℓ ⊔ ℓ')
  f ≡' g = ∀ x → f x ≡ g x

  refl' : {f : (a : A) → B a} → f ≡' f
  refl' {f = f} x = refl

  instance fun-id-sys : Id-sys ((a : A) → B a)
  fun-id-sys = record
    { _≡ₛ_ = _≡'_
    ; reflₛ = refl'
    ; ≡ₛ→≡ = λ eq i a → eq a i
    ; path-to-reflₛ = λ eq i a → Path.path-to-refl (eq a) i
    }

