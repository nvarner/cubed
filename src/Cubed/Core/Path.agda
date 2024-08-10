module Cubed.Core.Path where

open import Cubed.Core.Primitives

private
  variable
    ℓ ℓ' ℓ'' : Level
    A : Type ℓ
    B : A → Type ℓ
    x y z w : A

refl : x ≡ x
refl {x = x} _ = x
{-# INLINE refl #-}

symP : {A : I → Type ℓ} → {x : A i1} → {y : A i0} →
      (p : PathP (λ i → A (~ i)) x y) → PathP A y x
symP p j = p (~ j)
{-# INLINE symP #-}

sym : x ≡ y → y ≡ x
sym = symP
{-# INLINE sym #-}

congP : {A : I → Type ℓ} {B : (i : I) → A i → Type ℓ'}
  (f : (i : I) → (a : A i) → B i a) {x : A i0} {y : A i1}
  (p : PathP A x y) → PathP (λ i → B i (p i)) (f i0 x) (f i1 y)
congP f p i = f i (p i)
{-# INLINE congP #-}

cong : (f : (a : A) → B a) (p : x ≡ y) →
      PathP (λ i → B (p i)) (f x) (f y)
cong f = congP (λ _ → f)
{-# INLINE cong #-}


module ∙ {x y z : A} where
  opaque

    faces : (q : y ≡ z) (i j : I) → Partial (i ∨ ~ i) A
    faces q i j (i = i0) = x
    faces q i j (i = i1) = q j

    _∙_ : x ≡ y → y ≡ z → x ≡ z
    (p ∙ q) i = hcomp (faces q i) (p i)

    infixr 30 _∙_

    filler : (p : x ≡ y) (q : y ≡ z) → PathP (λ j → x ≡ q j) p (p ∙ q)
    filler p q j i = hfill (faces q i) (inS (p i)) j

open ∙ using (_∙_) public

module transport where
  opaque

    transport : {A B : Type ℓ} → A ≡ B → A → B
    transport p = transp (λ i → p i) i0

    along-refl : (a : A) → transport refl a ≡ a
    along-refl {A = A} a i = transp (λ _ → A) i a

    filler : {A B : Type ℓ} (p : A ≡ B) (a : A) →
      PathP (λ i → p i) a (transport p a)
    filler p a i = transp (λ j → p (i ∧ j)) (~ i) a

open transport using (transport) public
{-# REWRITE transport.along-refl #-}

module subst (B : A → Type ℓ) {x y : A} (p : x ≡ y) where
  opaque

    subst : B x → B y
    subst = transport (cong B p)

    filler : (b : B x) → PathP (λ i → (cong B p) i) b (subst b)
    filler = transport.filler (cong B p)

open subst using (subst) public

funext : {B : A → I → Type ℓ'}
  {f : (a : A) → B a i0} {g : (a : A) → B a i1} →
  ((a : A) → PathP (B a) (f a) (g a)) →
  PathP (λ i → (a : A) → B a i) f g
funext p i a = p a i

module J
  (P : ∀ y → x ≡ y → Type ℓ')
  (d : P x refl)
  where

  J : (p : x ≡ y) → P y p
  J p = transport (λ i → P (p i) (λ j → p (i ∧ j))) d

open J using (J) public

