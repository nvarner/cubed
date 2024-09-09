module Cubed.Core.Cat.Base where

open import Cubed.Core.Primitives
open import Cubed.Core.Types.Base
open import Cubed.Core.Paths.Base


record Cat-raw ℓOb ℓHom : Type (ℓsuc (ℓOb ⊔ ℓHom)) where
  field
    Ob : Type ℓOb
    Hom : Ob → Ob → Type ℓHom
    seq : ∀ {a b c} (f : Hom a b) (g : Hom b c) → Hom a c


module _ {ℓOb ℓHom} (C : Cat-raw ℓOb ℓHom) where
  open Cat-raw C


  record Is-initial (x : Ob) : Type (ℓ-of-type-of C) where
    field
      univ-prop : (y : Ob) → Σ[ f ∈ Hom x y ] ((g : Hom x y) → g ≡ f)


  record Has-initial : Type (ℓ-of-type-of C) where
    field
      ⊥ : Ob
      ⊥-is-initial : Is-initial ⊥

  open Has-initial {{...}} public


  record Is-terminal (x : Ob) : Type (ℓ-of-type-of C) where
    field
      univ-prop : (y : Ob) → Σ[ f ∈ Hom y x ] ((g : Hom y x) → g ≡ f)


  record Has-terminal : Type (ℓ-of-type-of C) where
    field
      ⊤ : Ob
      ⊤-is-terminal : Is-terminal ⊤

  open Has-terminal {{...}} public


  record Has-products-raw : Type (ℓ-of-type-of C) where
    field
      _×_ : Ob → Ob → Ob

  open Has-products-raw {{...}} public

