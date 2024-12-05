open import Cubed.Level

open import Cubed.Data.Bool.Base using (Bool)
open import Cubed.Data.Char.Base using (Char)
open import Cubed.Data.List.Base as List using (List)

open import Cubed.Fun.Base using (_∘_)


module Cubed.Data.String.Base where

import Agda.Builtin.String as String

open String public
  using (String)
  renaming
    ( primStringUncons to uncons
    ; primStringToList to to-list
    ; primStringFromList to from-list
    ; primShowString to show
    )

infix 4 _≡ᵇ_
_≡ᵇ_ : String → String → Bool
_≡ᵇ_ = String.primStringEquality

infixr 5 _++_
_++_ : String → String → String
_++_ = String.primStringAppend

split-byᵇ : (Char → Bool) → String → List String
split-byᵇ p = List.map from-list ∘ List.split-byᵇ p ∘ to-list

