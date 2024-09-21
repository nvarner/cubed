module Cubed.Cat.Structure.BinProd.Base where

open import Cubed.Core.Prelude

open import Cubed.Cat.Base
  using (Precat)

private variable
  ℓOb ℓHom : Level


module _ (C : Precat ℓOb ℓHom) where
  open Precat C

  module _ (a b : Ob) where

    record Diagram : Type (ℓOb ⊔ ℓHom) where
      field
        c : Ob
        f : Hom c a
        g : Hom c b

    record Factors-through (d d' : Diagram) : Type ℓHom where
      open Diagram d
      open Diagram d' renaming (c to c' ; f to f' ; g to g')

      field
        ⟨f,g⟩ : Hom c c'
        commutes-f : f ≡ ⟨f,g⟩ ⋆ f'
        commutes-g : g ≡ ⟨f,g⟩ ⋆ g'

    record Is-bin-product (d : Diagram) : Type (ℓOb ⊔ ℓHom) where
      field
        univ-prop : ∀ d' → Factors-through d' d

    _×_ : Type (ℓOb ⊔ ℓHom)
    _×_ = Σ Diagram Is-bin-product

