open import Cubed.Level

open import Agda.Builtin.Cubical.Sub using (Sub)


module Cubed.Path.Base where

private variable
  ℓ ℓ' ℓ'' : Level
  A : Type ℓ
  B : A → Type ℓ
  x y z w : A

open import Agda.Primitive.Cubical public
  using (I; i0; i1; Partial; PartialP; PathP)
  renaming
    ( primIMin to _∧_
    ; primIMax to _∨_
    ; primINeg to ~_
    ; isOneEmpty to is-one-empty
    ; primComp to comp
    ; primHComp to hcomp
    ; primTransp to transp
    ; itIsOne to 1=1
    )

open import Agda.Builtin.Cubical.Sub public
  using (inS)
  renaming (primSubOut to outS)

Path : (A : Type ℓ) (x y : A) → Type ℓ
Path A x y = PathP (λ i → A) x y

infix 4 _≡_
_≡_ : (x y : A) → Type (level A)
_≡_ = Path _
{-# BUILTIN PATH _≡_ #-}
{-# BUILTIN REWRITE _≡_ #-}
{-# DISPLAY Path _ x y = _≡_ #-}

infix 4 _[_↦_]
_[_↦_] : (A : Type ℓ) (φ : I) (u : Partial φ A) → SType ℓ
A [ φ ↦ u ] = Sub A φ u
{-# DISPLAY Sub A φ u = A [ φ ↦ u ] #-}

hfill :
  {φ : I} (u : ∀ i → Partial φ A) (u0 : A [ φ ↦ u i0 ])
  (i : I) → A
hfill {φ = φ} u u0 i = hcomp
  (λ j → λ where
    (φ = i1) → u (i ∧ j) 1=1
    (i = i0) → outS u0)
  (outS u0)

fill :
  {ℓ' : I → Level} (A : ∀ i → Type (ℓ' i))
  {φ : I} (u : ∀ i → Partial φ (A i)) (u0 : A i0 [ φ ↦ u i0 ])
  (i : I) → A i
fill A {φ = φ} u u0 i = comp
  (λ j → A (i ∧ j))
  (λ j → λ where
    (φ = i1) → u (i ∧ j) 1=1
    (i = i0) → outS u0)
  (outS u0)

refl : x ≡ x
refl {x = x} i = x

sym :
  {A : I → Type ℓ} {x : A i0} {y : A i1} →
  PathP A x y → PathP (λ i → A (~ i)) y x
sym p i = p (~ i)

module _ {x y z : A} where opaque
  private
    faces : (q : y ≡ z) (i j : I) → Partial (i ∨ ~ i) A
    faces q i j (i = i0) = x
    faces q i j (i = i1) = q j

  infixr 30 _∙_
  _∙_ : x ≡ y → y ≡ z → x ≡ z
  (p ∙ q) i = hcomp (faces q i) (p i)


cong :
  {A : I → Type ℓ} {B : {i : I} → A i → Type ℓ'}
  (f : {i : I} (a : A i) → B a) {x : A i0} {y : A i1}  →
  (p : PathP A x y) → PathP (λ i → B (p i)) (f x) (f y)
cong f p i = f (p i)

transport : {A B : Type ℓ} → A ≡ B → A → B
transport p = transp (λ i → p i) i0

subst : (B : A → Type ℓ) {x y : A} (p : x ≡ y) → B x → B y
subst B p = transport (cong B p)

module _
  (P : ∀ y → x ≡ y → Type ℓ)
  (d : P x refl)
  where

  opaque
    J : (p : x ≡ y) → P y p
    J p = transport (λ i → P (p i) (λ j → p (i ∧ j))) d

path-to-refl : {x y : A} (p : x ≡ y) → PathP (λ i → p i ≡ y) p refl
path-to-refl = J (λ y p → PathP (λ i → p i ≡ y) p refl) refl

