module Cubed.Cat.Displayed.Base where

open import Cubed.Core.Prelude

open import Cubed.Cat.Base
  using (Precat)

private
  variable
    ℓOb ℓHom ℓObᴰ ℓHomᴰ ℓObᴰ' ℓHomᴰ' : Level


module _ (C : Precat ℓOb ℓHom) where
  open Precat C

  private
    variable
      a b c d : Ob
      f : Hom a b
      g : Hom b c
      h : Hom c d

  record Displayed
    (ℓObᴰ ℓHomᴰ : Level) :
    Type (lsuc (ℓOb ⊔ ℓHom ⊔ ℓObᴰ ⊔ ℓHomᴰ)) where
    infixr 9 _⋆ᴰ_
    field
      Ob[_] : Ob →
        Type ℓObᴰ
      Hom[_] : Hom a b →
        Ob[ a ] → Ob[ b ] → Type ℓHomᴰ
      idᴰ : {aᴰ : Ob[ a ]} →
        Hom[ id ] aᴰ aᴰ
      _⋆ᴰ_ : ∀ {aᴰ bᴰ cᴰ} →
        Hom[ f ] aᴰ bᴰ → Hom[ g ] bᴰ cᴰ → Hom[ f ⋆ g ] aᴰ cᴰ

    infixr 4 _≡[_]_
    _≡[_]_ : ∀ {a b aᴰ bᴰ} {f g : Hom a b} → Hom[ f ] aᴰ bᴰ → f ≡ g → Hom[ g ] aᴰ bᴰ → Type ℓHomᴰ
    _≡[_]_ {_} {_} {aᴰ} {bᴰ} fᴰ p gᴰ = PathP (λ i → Hom[ p i ] aᴰ bᴰ) fᴰ gᴰ

    field
      ⋆ᴰ-idᴰ-l : ∀ {aᴰ bᴰ} {fᴰ : Hom[ f ] aᴰ bᴰ} →
        idᴰ ⋆ᴰ fᴰ ≡[ ⋆-id-l ] fᴰ
      ⋆ᴰ-idᴰ-r : ∀ {aᴰ bᴰ} {fᴰ : Hom[ f ] aᴰ bᴰ} →
        fᴰ ⋆ᴰ idᴰ ≡[ ⋆-id-r ] fᴰ
      ⋆ᴰ-assoc : ∀ {aᴰ bᴰ cᴰ dᴰ}
        (fᴰ : Hom[ f ] aᴰ bᴰ) (gᴰ : Hom[ g ] bᴰ cᴰ) (hᴰ : Hom[ h ] cᴰ dᴰ) →
        (fᴰ ⋆ᴰ gᴰ) ⋆ᴰ hᴰ ≡[ ⋆-assoc f g h ] fᴰ ⋆ᴰ (gᴰ ⋆ᴰ hᴰ)


module _ {C : Precat ℓOb ℓHom} (Cᴰ : Displayed C ℓObᴰ ℓHomᴰ) where
  open Precat
  open Displayed Cᴰ

  ∫ : Precat (ℓOb ⊔ ℓObᴰ) (ℓHom ⊔ ℓHomᴰ)
  ∫ .Ob = Σ (C .Ob) Ob[_]
  ∫ .Hom (a , aᴰ) (b , bᴰ) = Σ[ f ∈ _ ] Hom[ f ] aᴰ bᴰ
  ∫ .id = (C .id) , idᴰ
  ∫ ._⋆_ (f , fᴰ) (g , gᴰ) = (C ._⋆_ f g) , (fᴰ ⋆ᴰ gᴰ)
  ∫ .⋆-id-l {f = (f , fᴰ)} i = (C .⋆-id-l {f = f} i) , (⋆ᴰ-idᴰ-l {fᴰ = fᴰ} i)
  ∫ .⋆-id-r {f = (f , fᴰ)} i = (C .⋆-id-r {f = f} i) , (⋆ᴰ-idᴰ-r {fᴰ = fᴰ} i)
  ∫ .⋆-assoc (f , fᴰ) (g , gᴰ) (h , hᴰ) i = (C .⋆-assoc f g h i) , (⋆ᴰ-assoc fᴰ gᴰ hᴰ i)


-- module _
--   {C : Precat ℓOb ℓHom}
--   (D : Displayed C ℓObᴰ ℓHomᴰ)
--   (D' : Displayed C ℓObᴰ' ℓHomᴰ')
--   where
--   open Notation
--   open Displayed

--   _×ᴰ_ : Displayed C (ℓObᴰ ⊔ ℓObᴰ') (ℓHomᴰ ⊔ ℓHomᴰ')
--   _×ᴰ_ .Ob[_] = D .Ob[_] × D' .Ob[_]
--   _×ᴰ_ .Hom[_] f (a , a') (b , b') = D .Hom[_] f a b × D' .Hom[_] f a' b'
--   _×ᴰ_ .idᴰ = D .idᴰ , D' .idᴰ
--   _×ᴰ_ .seqᴰ (f , f') (g , g') = D .seqᴰ f g , D' .seqᴰ f' g'
--   _×ᴰ_ .idᴰ-seqᴰ {fᴰ = (fᴰ , fᴰ')} i = (D .idᴰ-seqᴰ {fᴰ = fᴰ} i) , (D' .idᴰ-seqᴰ {fᴰ = fᴰ'} i)
--   _×ᴰ_ .seqᴰ-idᴰ {fᴰ = (fᴰ , fᴰ')} i = (D .seqᴰ-idᴰ {fᴰ = fᴰ} i) , (D' .seqᴰ-idᴰ {fᴰ = fᴰ'} i)
--   _×ᴰ_ .seqᴰ-assoc (f , f') (g , g') (h , h') i = (D .seqᴰ-assoc f g h i) , (D' .seqᴰ-assoc f' g' h' i)

