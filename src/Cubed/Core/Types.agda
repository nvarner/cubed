module Cubed.Core.Types where

open import Cubed.Core.Primitives

import Cubed.Core.Notation as Notation

private
  variable
    ℓ ℓ' : Level
    A A' A'' : Type ℓ
    B : A → Type ℓ
    C : (a : A) → B a → Type ℓ

module Types where

  level : Type ℓ → Level
  level {ℓ} A = ℓ

  open import Agda.Builtin.Unit
    using (⊤ ; tt)
    public

  data ⊥ : Type lzero where

  ¬_ : Type ℓ → Type ℓ
  ¬ A = A → ⊥

  infix 3 ¬_

  open import Agda.Builtin.Sigma public

  infix 2 Σ-syntax
  Σ-syntax : ∀ {ℓ ℓ'} (A : Type ℓ) (B : A → Type ℓ') → Type (ℓ ⊔ ℓ')
  Σ-syntax = Σ

  syntax Σ-syntax A (λ x → B) = Σ[ x ∈ A ] B

  _×_ : Type ℓ → Type ℓ' → Type (ℓ ⊔ ℓ')
  A × A' = Σ A (λ _ → A')
  infixr 5 _×_

  record Lift (A : Type ℓ) : Type (ℓ ⊔ ℓ') where
    constructor lift
    field
      lower : A

  open Lift public

  _∘_ : ({a : A} → (b : B a) → C a b) → (f : (a : A) → B a) → (a : A) → C a (f a)
  (g ∘ f) a = g (f a)
  {-# INLINE _∘_ #-}

  _∘S_ : (A' → A'') → (A → A') → A → A''
  (g ∘S f) a = g (f a)
  {-# INLINE _∘S_ #-}

  infixr 9 _∘_

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

  instance
    inst-⊤ : Notation.⊤-notation (Type lzero)
    inst-⊤ = Notation.mk ⊤

    inst-⊥ : Notation.⊥-notation (Type lzero)
    inst-⊥ = Notation.mk ⊥

    inst-Types-× : Notation.×-notation (Type ℓ) (Type ℓ') (Type (ℓ ⊔ ℓ'))
    inst-Types-× = Notation.mk _×_

    inst-fn-× : Notation.×-notation (A → Type ℓ) (A → Type ℓ') (A → Type (ℓ ⊔ ℓ'))
    inst-fn-× = Notation.mk (λ f g a → f a × g a)

open Types
  using (level ; tt ; ¬_ ; Σ ; Σ-syntax ; _,_ ; fst ; snd ; Lift ; lift ; lower ; _∘_ ; _∘S_ ; _$_ ; _&_ ; idfun ; flip ; const)
  public

