module Cubed.Core.Types.Base where

open import Cubed.Core.Primitives


ℓ-of : ∀ {ℓ} (A : Type ℓ) → Level
ℓ-of {ℓ} _ = ℓ

ℓ-of-type-of : ∀ {ℓ} {A : Type ℓ} (a : A) → Level
ℓ-of-type-of {ℓ} _ = ℓ


record Lift {ℓ} (A : Type ℓ) ℓ' : Type (ℓ ⊔ ℓ') where
  constructor ℓ↑
  field
    ℓ↓ : A

open Lift public


record Unit : Type ℓzero where
  instance constructor *

{-# BUILTIN UNIT Unit #-}


data Void : Type ℓzero where


¬_ : ∀ {ℓ} → Type ℓ → Type ℓ
¬ A = A → Void

infix 3 ¬_


open import Agda.Builtin.Sigma public

Σ-syntax : ∀ {ℓ ℓ'} (A : Type ℓ) (B : A → Type ℓ') → Type (ℓ ⊔ ℓ')
Σ-syntax = Σ

syntax Σ-syntax A (λ x → B) = Σ[ x ∈ A ] B
infix 2 Σ-syntax


Product : ∀ {ℓ ℓ'} → Type ℓ → Type ℓ' → Type (ℓ ⊔ ℓ')
Product A B = Σ A (λ _ → B)


private variable
  ℓ ℓ' : Level
  A A' A'' : Type _
  B : A → Type _
  C : (a : A) → B a → Type _

_∘_ : ({a : A} → (b : B a) → C a b) → (f : (a : A) → B a) → (a : A) → C a (f a)
(g ∘ f) a = g (f a)
{-# INLINE _∘_ #-}

infixr 9 _∘_

_∘S_ : (A' → A'') → (A → A') → A → A''
(g ∘S f) a = g (f a)
{-# INLINE _∘S_ #-}

infixr 9 _∘S_

_$_ : ((a : A) → B a) → (a : A) → B a
f $ a = f a
{-# INLINE _$_ #-}

infixr -2 _$_

_&_ : (a : A) → ((a : A) → B a) → B a
a & f = f a
{-# INLINE _&_ #-}

infixl -1 _&_

idfun : A → A
idfun a = a
{-# INLINE idfun #-}

flip :
  {B : Type ℓ} {C : (a : A) (b : B) → Type ℓ'} →
  ((a : A) (b : B) → C a b) →
  ((b : B) (a : A) → C a b)
flip f b a = f a b
{-# INLINE flip #-}

const : {B : Type ℓ} → A → B → A
const a b = a
{-# INLINE const #-}

