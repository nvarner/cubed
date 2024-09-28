open import Cubed.Core.Primitives
open import Cubed.Core.Types
open import Cubed.Core.Path

import Cubed.Core.Builtin as Builtin
import Cubed.Core.Notation as Notation

open Builtin.Sigma

module Cubed.Core.Functions where


module _ where
  private variable
    A : Type _
    B : (a : A) → Type _
    C : (a : A) (b : B a) → Type _

  infixr 9 _∘_
  _∘_ :
    (g : {a : A} (b : B a) → C a b)
    (f : (a : A) → B a) →
    (a : A) → C a (f a)
  (g ∘ f) a = g (f a)
  {-# INLINE _∘_ #-}

  infixr -2 _$_
  _$_ : (f : (a : A) → B a) (a : A) → B a
  f $ a = f a
  {-# INLINE _$_ #-}

  infixl -1 _&_
  _&_ : (a : A) → ((a : A) → B a) → B a
  a & f = f a
  {-# INLINE _&_ #-}


private variable
  ℓ ℓ' : Level
  A A' A'' B C : Type _

infixr 9 _∘S_
_∘S_ : (g : B → C) (f : A → B) → A → C
(g ∘S f) a = g (f a)
{-# INLINE _∘S_ #-}

id : A → A
id a = a
{-# INLINE id #-}

flip :
  {C : (a : A) (b : B) → Type ℓ} →
  (f : (a : A) (b : B) → C a b) →
  ((b : B) (a : A) → C a b)
flip f b a = f a b
{-# INLINE flip #-}

const : A → B → A
const a b = a
{-# INLINE const #-}

ext :
  {B : A → I → Type ℓ}
  {f : (a : A) → B a i0}
  {g : (a : A) → B a i1}
  (p : (a : A) → B a [ f a ≡ g a ]) →
  (λ i → (a : A) → B a i) [ f ≡ g ]
ext p i a = p a i

Fiber : (f : A → B) (y : B) → Type (level A ⊔ level B)
Fiber f y = Σ[ x ∈ _ ] f x ≡ y

Is-left-inv : (f : A → B) (g : B → A) → Type (level A)
Is-left-inv f g = ∀ a → (g ∘ f) a ≡ a

Is-right-inv : (f : A → B) (g : B → A) → Type (level B)
Is-right-inv f g = ∀ b → (f ∘ g) b ≡ b

instance
  inst-× : Notation.×-notation (A → Type ℓ) (A → Type ℓ') (A → Type (ℓ ⊔ ℓ'))
  inst-× = Notation.mk (λ f g a → Σ (f a) (const (g a)))

