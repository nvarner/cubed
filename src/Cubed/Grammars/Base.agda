open import Cubed.Level

open import Cubed.Data.Unit.Base using (Unit; tt)

open import Cubed.Fun.Base as Fun using (const)

open import Cubed.Path.Base using (_≡_)


module Cubed.Grammars.Base {ℓ} (Alph : Type ℓ) where

data Lin : Type (lsuc ℓ)
data Functor (A : Type ℓ) : Type (lsuc ℓ)

infixr 5 _⊗_
infixr 2 _⊸_
infixl 2 _⟜_

data Lin where
  ε ⊤ ⊥ : Lin
  Lit : Alph → Lin
  &ᴰ ⊕ᴰ : (A : Type ℓ) → (A → Lin) → Lin
  _⊗_ _⊸_ _⟜_ : Lin → Lin → Lin
  μ : {A : Type ℓ} (F : A → Functor A) → A → Lin

syntax &ᴰ A (λ a → G) = &[ a ∈ A ] G
syntax ⊕ᴰ A (λ a → G) = ⊕[ a ∈ A ] G

data Functor A where
  k : Lin → Functor A
  Var : A → Functor A
  &e ⊕e : (B : Type ℓ) → (B → Functor A) → Functor A
  ⊗e : Functor A → Functor A → Functor A

F⟦_⟧ : {A : Type ℓ} → Functor A → (A → Lin) → Lin
F⟦ k h ⟧ g = h
F⟦ Var a ⟧ g = g a
F⟦ &e B F ⟧ g = &ᴰ B (λ b → F⟦ F b ⟧ g)
F⟦ ⊕e B F ⟧ g = ⊕ᴰ B (λ b → F⟦ F b ⟧ g)
F⟦ ⊗e F F' ⟧ g = F⟦ F ⟧ g ⊗ F⟦ F' ⟧ g

interleaved mutual
  private variable
    A B : Type ℓ
    G H K L : Lin
    Gᴰ Hᴰ : A → Lin

  data *-tag : Type ℓ where
    `nil `cons : *-tag

  *-functor : Lin → Lift {ℓ = ℓ} Unit → Functor (Lift Unit)
  *-functor G _ = ⊕e *-tag (λ where
    `nil → k ε
    `cons → ⊗e (k G) (Var _))

  _* : Lin → Lin
  G * = μ (*-functor G) _

  Char : Lin
  Char = ⊕ᴰ Alph Lit

  String : Lin
  String = Char *

  infix 1 _⊢_
  data _⊢_ : Lin → Lin → Type (lsuc ℓ)

  infixr 9 _⋆_
  data _ where
    id : G ⊢ G
    _⋆_ : G ⊢ H → H ⊢ K → G ⊢ K

  data _ where
    ⊤-in : G ⊢ ⊤
    ⊥-elim : ⊥ ⊢ G

  data _ where
    &ᴰ-in :
      ((a : A) → G ⊢ Hᴰ a) →
      G ⊢ &ᴰ A Hᴰ
    &ᴰ-π :
      (a : A) →
      &ᴰ A Hᴰ ⊢ Hᴰ a
    ⊕ᴰ-in :
      (a : A) →
      Hᴰ a ⊢ ⊕ᴰ A Hᴰ
    ⊕ᴰ-elim :
      ((a : A) → Hᴰ a ⊢ G) →
      ⊕ᴰ A Hᴰ ⊢ G

  infixr 4 _,⊗_
  data _ where
    _,⊗_ :
      G ⊢ H →
      K ⊢ L →
      G ⊗ K ⊢ H ⊗ L

    ⊗-unit-l : ε ⊗ G ⊢ G
    ⊗-unit-l⁻ : G ⊢ ε ⊗ G
    ⊗-unit-r : G ⊗ ε ⊢ G
    ⊗-unit-r⁻ : G ⊢ G ⊗ ε

    ⊗-assoc : G ⊗ (H ⊗ K) ⊢ (G ⊗ H) ⊗ K
    ⊗-assoc⁻ : (G ⊗ H) ⊗ K ⊢ G ⊗ (H ⊗ K)

    ⊕ᴰ-dist-l : (⊕[ a ∈ A ] Hᴰ a) ⊗ G ⊢ ⊕[ a ∈ A ] (Hᴰ a ⊗ G)
    ⊕ᴰ-dist-l⁻ : ⊕[ a ∈ A ] (Hᴰ a ⊗ G) ⊢ (⊕[ a ∈ A ] Hᴰ a) ⊗ G
    ⊕ᴰ-dist-r : (G ⊗ ⊕[ a ∈ A ] Hᴰ a) ⊢ ⊕[ a ∈ A ] (G ⊗ Hᴰ a)
    ⊕ᴰ-dist-r⁻ : ⊕[ a ∈ A ] (G ⊗ Hᴰ a) ⊢ G ⊗ (⊕[ a ∈ A ] Hᴰ a)

  ⊕ᴰ-map : (A → B) → ⊕ᴰ A (const G) ⊢ ⊕ᴰ B (const G)
  ⊕ᴰ-map f = ⊕ᴰ-elim (λ a → ⊕ᴰ-in (f a))

  ⊕ᴰ-map-g : ((a : A) → Gᴰ a ⊢ Hᴰ a) → ⊕ᴰ A Gᴰ ⊢ ⊕ᴰ A Hᴰ
  ⊕ᴰ-map-g f = ⊕ᴰ-elim (λ a → f a ⋆ ⊕ᴰ-in a)

  data _ where
    ⊸-in :
      G ⊗ H ⊢ K →
      H ⊢ G ⊸ K
    ⊸-app :
      G ⊗ (G ⊸ H) ⊢ H
    ⟜-in :
      G ⊗ H ⊢ K →
      G ⊢ K ⟜ H
    ⟜-app :
      (G ⟜ H) ⊗ H ⊢ G

  ⊸-in⁻ : G ⊢ H ⊸ K → H ⊗ G ⊢ K
  ⊸-in⁻ f = (id ,⊗ f) ⋆ ⊸-app

  ⟜-in⁻ : G ⊢ H ⟜ K → G ⊗ K ⊢ H
  ⟜-in⁻ f = (f ,⊗ id) ⋆ ⟜-app

  data _ where
    roll :
      {F : A → Functor A} {a : A} →
      F⟦ F a ⟧ (μ F) ⊢ μ F a
    rec :
      {F : A → Functor A} →
      ((a : A) → F⟦ F a ⟧ Hᴰ ⊢ Hᴰ a) →
      (a : A) → μ F a ⊢ Hᴰ a

  map : (F : Functor A) → ((a : A) → Gᴰ a ⊢ Hᴰ a) → F⟦ F ⟧ Gᴰ ⊢ F⟦ F ⟧ Hᴰ
  map (k G) f = id
  map (Var a) f = f a
  map (&e B F) f = &ᴰ-in (λ a → &ᴰ-π a ⋆ map (F a) f)
  map (⊕e B F) f = ⊕ᴰ-elim (λ a → map (F a) f ⋆ ⊕ᴰ-in a)
  map (⊗e F F') f = map F f ,⊗ map F' f

  unroll : {F : A → Functor A} → (a : A) → μ F a ⊢ F⟦ F a ⟧ (μ F)
  unroll {F = F} = rec (λ a → map (F a) (λ a' → roll))

  nil : ε ⊢ G *
  nil = ⊕ᴰ-in `nil ⋆ roll

  cons : G ⊗ G * ⊢ G *
  cons = ⊕ᴰ-in `cons ⋆ roll

  char-in : {c : Alph} → Lit c ⊢ Char
  char-in {c = c} = ⊕ᴰ-in c

  data _ where
    read : ⊤ ⊢ String

  string-in : G ⊢ String
  string-in = ⊤-in ⋆ read

