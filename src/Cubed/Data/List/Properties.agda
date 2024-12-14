open import Cubed.Level

open import Cubed.Data.Dec.Base as Dec using (Dec; yes; no; Is-discrete; _≟_)
open import Cubed.Data.List.Base as List using (List; []; _∷_; elim; _++_; Elt; here; there)
open import Cubed.Data.Prod.Base using (_×_; _,_)

open import Cubed.Fun.Base as Fun using (_|>_)

open import Cubed.Id.Base using (Id-sys; _≡ₛ_; reflₛ; path-to-reflₛ; ≡ₛ→≡)

open import Cubed.Path.Base using (_≡_; refl; cong; J)
open import Cubed.Path.Id using ()

open import Cubed.Relation.Nullary.Neg.Base using (¬_)


module Cubed.Data.List.Properties where

private variable
  A : Type _
  x : A
  xs : List A

instance id-sys : Id-sys (List A)
id-sys .Id-sys._≡ₛ_ = List._≡_
id-sys .Id-sys.reflₛ = List.refl _
id-sys .Id-sys.≡ₛ→≡ = List.≡→Path
id-sys .Id-sys.path-to-reflₛ = List.path-to-refl

++-id-rₛ : (as : List A) → as ++ [] ≡ₛ as
++-id-rₛ as@[] = List.refl as
++-id-rₛ (a ∷ as) = refl , ++-id-rₛ as

++-id-r : (as : List A) → as ++ [] ≡ as
++-id-r as = ≡ₛ→≡ (++-id-rₛ as)

++-assoc : (xs ys zs : List A) → xs ++ (ys ++ zs) ≡ (xs ++ ys) ++ zs
++-assoc [] ys zs = refl
++-assoc (x ∷ xs) ys zs = cong (x ∷_) (++-assoc xs ys zs)

instance elt-dec : {{Is-discrete A}} → {x : A} {xs : List A} → Dec (Elt xs x)
elt-dec {xs = []} = no λ ()
elt-dec {x = x'} {xs = x ∷ xs} = x ≟ x' |> Dec.rec
  (J (λ x' p → Dec (Elt _ _)) (yes here))
  (λ ¬x≡x' → elt-dec {x = x'} {xs = xs} |> Dec.map
    there
    (λ ¬elt' → λ where
      here → ¬x≡x' refl
      (there elt') → ¬elt' elt'))

