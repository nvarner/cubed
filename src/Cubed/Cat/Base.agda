module Cubed.Cat.Base where

open import Cubed.Core.Prelude


record Precat (ℓOb ℓHom : Level) : Type (lsuc (ℓOb ⊔ ℓHom)) where
  infixr 9 _⋆_
  field
    Ob : Type ℓOb
    Hom : Ob → Ob → Type ℓHom
    id : {a : Ob} → Hom a a
    _⋆_ : {a b c : Ob} → Hom a b → Hom b c → Hom a c
    ⋆-id-l : {a b : Ob} {f : Hom a b} →
      id ⋆ f ≡ f
    ⋆-id-r : {a b : Ob} {f : Hom a b} →
      f ⋆ id ≡ f
    ⋆-assoc : {a b c d : Ob} (f : Hom a b) (g : Hom b c) (h : Hom c d) →
      (f ⋆ g) ⋆ h ≡ f ⋆ (g ⋆ h)

