module Cubed.Prelude.Cat.Displayed.StructureOver where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Cat.Precat.Base
open import Cubed.Prelude.Cat.Displayed.Base

open import Cubed.Prelude.HLevel.Base

private
  variable
    ℓob ℓhom ℓobᴰ ℓhomᴰ : Level


module _ (C : Precat ℓob ℓhom) where
  open Precat C

  private
    variable
      a b c : ob
      f : hom a b
      g : hom b c

  record StructureOver
    (ℓobᴰ ℓhomᴰ : Level) :
    Type (ℓob ⊔ ℓhom ⊔ lsuc (ℓobᴰ ⊔ ℓhomᴰ)) where
    field
      ob[_] : ob → Type ℓobᴰ
      hom[_] : hom a b → ob[ a ] → ob[ b ] → Type ℓhomᴰ
      idᴰ : {aᴰ : ob[ a ]} →
        hom[ id ] aᴰ aᴰ
      seqᴰ : ∀ {aᴰ bᴰ cᴰ} →
        hom[ f ] aᴰ bᴰ → hom[ g ] bᴰ cᴰ → hom[ seq f g ] aᴰ cᴰ
      homᴰ-is-prop : ∀ {aᴰ bᴰ} →
        is-prop (hom[ f ] aᴰ bᴰ)

    →Displayed : Displayed C ℓobᴰ ℓhomᴰ
    →Displayed .Displayed.ob[_] = ob[_]
    →Displayed .Displayed.hom[_] = hom[_]
    →Displayed .Displayed.idᴰ = idᴰ
    →Displayed .Displayed.seqᴰ = seqᴰ
    →Displayed .Displayed.idᴰ-seqᴰ = is-prop→PathP (λ i → homᴰ-is-prop) _ _
    →Displayed .Displayed.seqᴰ-idᴰ = is-prop→PathP (λ i → homᴰ-is-prop) _ _
    →Displayed .Displayed.seqᴰ-assoc _ _ _ = is-prop→PathP (λ i → homᴰ-is-prop) _ _

  PropertyOver : (ob → Type ℓobᴰ) → Displayed C ℓobᴰ lzero
  PropertyOver P = StructureOver.→Displayed struct
    where
    open StructureOver
    struct : StructureOver _ _
    struct .ob[_] = P
    struct .hom[_] _ _ _ = ⊤
    struct .idᴰ = tt
    struct .seqᴰ _ _ = tt
    struct .homᴰ-is-prop = ⊤-is-prop

