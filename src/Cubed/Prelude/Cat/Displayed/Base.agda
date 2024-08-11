module Cubed.Prelude.Cat.Displayed.Base where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Cat.Precat.Base

private
  variable
    ℓob ℓhom ℓobᴰ ℓhomᴰ : Level


module _ (C : Precat ℓob ℓhom) where
  open Precat C

  private
    variable
      a b c d : ob
      f : hom a b
      g : hom b c
      h : hom c d

  record Displayed
    (ℓobᴰ ℓhomᴰ : Level) :
    Type (lsuc (ℓob ⊔ ℓhom ⊔ ℓobᴰ ⊔ ℓhomᴰ)) where

    field
      ob[_] : ob →
        Type ℓobᴰ
      hom[_] : hom a b →
        ob[ a ] → ob[ b ] → Type ℓhomᴰ
      idᴰ : {aᴰ : ob[ a ]} →
        hom[ id ] aᴰ aᴰ
      seqᴰ : ∀ {aᴰ bᴰ cᴰ} →
        hom[ f ] aᴰ bᴰ → hom[ g ] bᴰ cᴰ → hom[ seq f g ] aᴰ cᴰ

    _≡[_]_ : ∀ {a b aᴰ bᴰ} {f g : hom a b} → hom[ f ] aᴰ bᴰ → f ≡ g → hom[ g ] aᴰ bᴰ → Type ℓhomᴰ
    _≡[_]_ {_} {_} {aᴰ} {bᴰ} fᴰ p gᴰ = PathP (λ i → hom[ p i ] aᴰ bᴰ) fᴰ gᴰ

    field
      idᴰ-seqᴰ : ∀ {aᴰ bᴰ} {fᴰ : hom[ f ] aᴰ bᴰ} →
        seqᴰ idᴰ fᴰ ≡[ id-seq ] fᴰ
      seqᴰ-idᴰ : ∀ {aᴰ bᴰ} {fᴰ : hom[ f ] aᴰ bᴰ} →
        seqᴰ fᴰ idᴰ ≡[ seq-id ] fᴰ
      seqᴰ-assoc : ∀ {aᴰ bᴰ cᴰ dᴰ}
        (fᴰ : hom[ f ] aᴰ bᴰ) (gᴰ : hom[ g ] bᴰ cᴰ) (hᴰ : hom[ h ] cᴰ dᴰ) →
        seqᴰ (seqᴰ fᴰ gᴰ) hᴰ ≡[ seq-assoc f g h ] seqᴰ fᴰ (seqᴰ gᴰ hᴰ)

module _ {C : Precat ℓob ℓhom} (Cᴰ : Displayed C ℓobᴰ ℓhomᴰ) where
  open Precat
  open Displayed Cᴰ

  ∫ : Precat (ℓob ⊔ ℓobᴰ) (ℓhom ⊔ ℓhomᴰ)
  ∫ .ob = Σ (C .ob) ob[_]
  ∫ .hom (a , aᴰ) (b , bᴰ) = Σ[ f ∈ _ ] hom[ f ] aᴰ bᴰ
  ∫ .id = (C .id) , idᴰ
  ∫ .seq (f , fᴰ) (g , gᴰ) = (C .seq f g) , (seqᴰ fᴰ gᴰ)
  ∫ .id-seq {f = (f , fᴰ)} i = (C .id-seq {f = f} i) , (idᴰ-seqᴰ {fᴰ = fᴰ} i)
  ∫ .seq-id {f = (f , fᴰ)} i = (C .seq-id {f = f} i) , (seqᴰ-idᴰ {fᴰ = fᴰ} i)
  ∫ .seq-assoc (f , fᴰ) (g , gᴰ) (h , hᴰ) i = (C .seq-assoc f g h i) , (seqᴰ-assoc fᴰ gᴰ hᴰ i)

