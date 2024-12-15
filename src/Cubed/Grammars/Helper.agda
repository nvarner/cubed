open import Cubed.Level

open import Cubed.Data.Dec.Base as Dec using (Dec; yes; no; _≟_; dec!)
open import Cubed.Data.List.Base as List using (List; []; _∷_)
open import Cubed.Data.List.Properties using ()

open import Cubed.Fun.Base as Fun using (_|>_)

open import Cubed.Path.Base using (J)

open import Cubed.Relation.Nullary.Neg.Base using (¬_)


module Cubed.Grammars.Helper {ℓ} (Alph : Type ℓ) where

open import Cubed.Grammars.Base Alph hiding (map) renaming (cons to *-cons)

private variable
  A : Type ℓ
  G : Lin

_+ : Lin → Lin
G + = G ⊗ G *

module + where
  once : G ⊢ G +
  once = ⊗-unit-r⁻ ⋆ ⊗-map-r nil

  cons : G ⊗ G + ⊢ G +
  cons = ⊗-map-r *-cons

Chain1 : Lin → Lin → Lin
Chain1 G Op = G ⊗ (Op ⊗ G) *

