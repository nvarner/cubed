module Cubed.Cat.Displayed.StructureOver where

open import Cubed.Core.Prelude

open import Cubed.Cat.Base
  using (Precat)
open import Cubed.Cat.Displayed.Base
  using (Displayed)

open import Cubed.Prelude.HLevel.Base

private
  variable
    ℓOb ℓHom ℓObᴰ ℓHomᴰ : Level


module _ (C : Precat ℓOb ℓHom) where
  open Precat C

  private
    variable
      a b c : Ob
      f : Hom a b
      g : Hom b c

  record StructureOver
    (ℓObᴰ ℓHomᴰ : Level) :
    Type (ℓOb ⊔ ℓHom ⊔ lsuc (ℓObᴰ ⊔ ℓHomᴰ)) where
    field
      Ob[_] : Ob → Type ℓObᴰ
      Hom[_] : Hom a b → Ob[ a ] → Ob[ b ] → Type ℓHomᴰ
      idᴰ : {aᴰ : Ob[ a ]} →
        Hom[ id ] aᴰ aᴰ
      _⋆ᴰ_ : ∀ {aᴰ bᴰ cᴰ} →
        Hom[ f ] aᴰ bᴰ → Hom[ g ] bᴰ cᴰ → Hom[ f ⋆ g ] aᴰ cᴰ
      Homᴰ-is-prop : ∀ {aᴰ bᴰ} →
        is-prop (Hom[ f ] aᴰ bᴰ)

    →Displayed : Displayed C ℓObᴰ ℓHomᴰ
    →Displayed .Displayed.Ob[_] = Ob[_]
    →Displayed .Displayed.Hom[_] = Hom[_]
    →Displayed .Displayed.idᴰ = idᴰ
    →Displayed .Displayed._⋆ᴰ_ = _⋆ᴰ_
    →Displayed .Displayed.⋆ᴰ-idᴰ-l = is-prop→PathP (λ i → Homᴰ-is-prop) _ _
    →Displayed .Displayed.⋆ᴰ-idᴰ-r = is-prop→PathP (λ i → Homᴰ-is-prop) _ _
    →Displayed .Displayed.⋆ᴰ-assoc _ _ _ = is-prop→PathP (λ i → Homᴰ-is-prop) _ _

  PropertyOver : (Ob → Type ℓObᴰ) → Displayed C ℓObᴰ lzero
  PropertyOver P = StructureOver.→Displayed struct
    where
    open StructureOver
    struct : StructureOver _ _
    struct .Ob[_] = P
    struct .Hom[_] _ _ _ = Types.⊤
    struct .idᴰ = tt
    struct ._⋆ᴰ_ _ _ = tt
    struct .Homᴰ-is-prop = ⊤-is-prop

