module Cubed.Prelude.Cat.Instance.Paths where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Cat.Precat.Base

open Precat

private
  variable
    ℓ : Level
    A : Type ℓ


Paths : Type ℓ → Precat ℓ ℓ
Paths A .ob = A
Paths A .hom x y = x ≡ y
Paths A .id = refl
Paths A .seq = _∙_
Paths A .id-seq = ∙.id-l _
Paths A .seq-id = ∙.id-r _
Paths A .seq-assoc = ∙.assoc

