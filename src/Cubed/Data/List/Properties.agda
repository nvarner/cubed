open import Cubed.Level

open import Cubed.Data.List.Base as List using (List; []; _∷_; elim; _++_)
open import Cubed.Data.Prod.Base using (_×_; _,_)

open import Cubed.Id.Base using (Id-sys; _≡ₛ_; reflₛ; path-to-reflₛ; ext)

open import Cubed.Path.Base using (_≡_; refl)
open import Cubed.Path.Id using ()


module Cubed.Data.List.Properties where

private variable
  A : Type _

module _ {{A-id-sys : Id-sys A}} where

  instance id-sys : Id-sys (List A)
  id-sys .Id-sys._≡ₛ_ = List._≡_
  id-sys .Id-sys.reflₛ = List.refl
  id-sys .Id-sys.is-id-sys = record
    { ≡ₛ→≡ = elim
      (λ where [] eq → refl)
      (λ where x xs ih (y ∷ ys) (x≡ₛy , xs≡ₛys) i → ext x≡ₛy i ∷ ih ys xs≡ₛys i)
    ; path-to-reflₛ = elim
      (λ where [] eq → refl)
      (λ where x xs ih (y ∷ ys) (x≡ₛy , xs≡ₛys) i → path-to-reflₛ x y x≡ₛy i , ih ys xs≡ₛys i)
    }

  ++-id-rₛ : (as : List A) → as ++ [] ≡ₛ as
  ++-id-rₛ [] = reflₛ {x = []}
  ++-id-rₛ (a ∷ as) = reflₛ {x = a} , ++-id-rₛ as

++-id-r : (as : List A) → as ++ [] ≡ as
++-id-r as = ext (++-id-rₛ as)

