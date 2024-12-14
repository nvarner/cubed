open import Cubed.Level

open import Cubed.Data.Bool.Base as Bool using (Bool; true; false)
open import Cubed.Data.Bool.Properties using ()
open import Cubed.Data.Char.Base using (Char; _≡ᵇ_; ≡ᵇ→≡; ¬≡ᵇ→¬≡)
open import Cubed.Data.Dec.Base as Dec using (Dec; yes; no; Is-discrete; _≟_)
open import Cubed.Data.Eq.Base using (from-path; to-path)
open import Cubed.Data.Eq.Unsafe as Eq-unsafe
open import Cubed.Data.Maybe.Base as Maybe using (Maybe; just; nothing)
open import Cubed.Data.Nat.Base as Nat using (Nat)

open import Cubed.Fun.Base as Fun using (_∘_; _|>_)

open import Cubed.Path.Base as Path using (_≡_)

open import Cubed.Relation.Nullary.Neg.Base using (¬_)


module Cubed.Data.Char.Properties where

instance char-is-discrete : Is-discrete Char
char-is-discrete {x = x} {y = y} = (x ≡ᵇ y) ≟ true |> Dec.map ≡ᵇ→≡ (¬≡ᵇ→¬≡ ∘ Bool.flip _)

