import Agda.Primitive as Prim
import Agda.Primitive.Cubical as CubePrim
import Agda.Builtin.Cubical.Sub as PrimSub

module Cubed.Core.Primitives where

open Prim public
  using (Level; lzero; lsuc; _⊔_)
  renaming
    ( Set to Type
    ; Setω to Typeω
    ; SSet to SType
    ; SSetω to STypeω
    )

level : {ℓ : Level} (A : Type ℓ) → Level
level {ℓ} A = ℓ

private variable
  ℓ : Level
  A : Type _

open CubePrim public
  using (I; i0; i1; Partial)
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

open PrimSub public
  using (inS)
  renaming (primSubOut to outS)


infix 4 _[_≡_]
_[_≡_] : (A : I → Type ℓ) → A i0 → A i1 → Type ℓ
_[_≡_] = CubePrim.PathP
{-# DISPLAY CubePrim.PathP A x y = A [ x ≡ y ] #-}

infix 4 _≡_
_≡_ : A → A → Type (level A)
_≡_ {A = A} = (λ i → A) [_≡_]
{-# BUILTIN PATH _≡_ #-}
{-# BUILTIN REWRITE _≡_ #-}


infix 4 _[_↦_]
_[_↦_] : (A : Type ℓ) (φ : I) (u : Partial φ A) → SType ℓ
A [ φ ↦ u ] = PrimSub.Sub A φ u
{-# DISPLAY PrimSub.Sub A φ u = A [ φ ↦ u ] #-}


hfill :
  {φ : I}
  (u : ∀ i → Partial φ A)
  (u0 : A [ φ ↦ u i0 ])
  (i : I) → A
hfill {φ = φ} u u0 i = hcomp
  (λ j → λ where
    (φ = i1) → u (i ∧ j) 1=1
    (i = i0) → outS u0)
  (outS u0)

fill :
  {ℓ' : I → Level}
  (A : ∀ i → Type (ℓ' i))
  {φ : I} (u : ∀ i → Partial φ (A i))
  (u0 : A i0 [ φ ↦ u i0 ])
  (i : I) → A i
fill A {φ = φ} u u0 i = comp
  (λ j → A (i ∧ j))
  (λ j → λ where
    (φ = i1) → u (i ∧ j) 1=1
    (i = i0) → outS u0)
  (outS u0)

