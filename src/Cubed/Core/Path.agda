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


module ∙ where

  module _ {x y z : A} where
    opaque

      faces : (q : y ≡ z) (i j : I) → Partial (i ∨ ~ i) A
      faces q i j (i = i0) = x
      faces q i j (i = i1) = q j

      _∙_ : x ≡ y → y ≡ z → x ≡ z
      (p ∙ q) i = hcomp (faces q i) (p i)

      infixr 30 _∙_

      filler : (p : x ≡ y) (q : y ≡ z) → PathP (λ j → x ≡ q j) p (p ∙ q)
      filler p q j i = hfill (faces q i) (inS (p i)) j

      filler' : (p : x ≡ y) (q : y ≡ z) → PathP (λ j → p (~ j) ≡ z) q (p ∙ q)
      filler' p q i j =
        hcomp (λ k → λ { (j = i0) → p (~ i)
                       ; (j = i1) → q k
                       ; (i = i0) → q (j ∧ k)
                       })
              (p (~ i ∨ j))

  opaque
    id-l : (p : x ≡ y) → refl ∙ p ≡ p
    id-l p = sym (filler' refl p)

    id-r : (p : x ≡ y) → p ∙ refl ≡ p
    id-r p = sym (filler p refl)

    assoc : (p : x ≡ y) (q : y ≡ z) (r : z ≡ w) →
      (p ∙ q) ∙ r ≡ p ∙ q ∙ r
    assoc p q r i = filler p q (~ i) ∙ filler' q r i

open ∙ using (_∙_) public


module congP where
  opaque

    congP : {A : I → Type ℓ} {B : (i : I) → A i → Type ℓ'}
      (f : (i : I) → (a : A i) → B i a) {x : A i0} {y : A i1}
      (p : PathP A x y) → PathP (λ i → B i (p i)) (f i0 x) (f i1 y)
    congP f p i = f i (p i)
    {-# INLINE congP #-}

    along-refl : {f : (a : A) → B a} {a : A} →
      congP (λ _ → f) {a} {a} (refl {x = a}) ≡ refl
    along-refl = refl

    by-id : {A : I → Type ℓ} {x : A i0} {y : A i1} {p : PathP A x y} →
      congP (λ _ a → a) p ≡ p
    by-id = refl

open congP using (congP) public
{-# REWRITE congP.along-refl #-}
{-# REWRITE congP.by-id #-}


module cong where
  opaque

    cong : (f : (a : A) → B a) (p : x ≡ y) →
          PathP (λ i → B (p i)) (f x) (f y)
    cong f = congP (λ _ → f)
    {-# INLINE cong #-}

    along-refl : {f : (a : A) → B a} {a : A} → cong f (refl {x = a}) ≡ refl
    along-refl {f = f} {a} = congP.along-refl {f = f} {a}

    opaque
      unfolding congP
      unfolding _∙_

      along-∙ : {B : Type ℓ} (f : A → B) {p : x ≡ y} {q : y ≡ z} →
        cong f (p ∙ q) ≡ cong f p ∙ cong f q
      along-∙ {x = x} f {p} {q} i j =
        hfill (λ k → λ { (j = i0) → f x
                       ; (j = i1) → cong f q k
                       ; (i = i0) → cong f (∙.filler p q k) j
                       })
        (inS (cong f p j)) i1

    by-id : {p : x ≡ y} → cong (λ a → a) p ≡ p
    by-id = refl

    opaque
      unfolding congP

      by-∘ : {B : Type ℓ} {C : Type ℓ'}
        (g : B → C) (f : A → B) {p : x ≡ y} →
        cong (λ a → g (f a)) p ≡ cong g (cong f p)
      by-∘ g f = refl

open cong using (cong) public
{-# REWRITE cong.along-refl #-}
{-# REWRITE cong.by-id #-}


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

module _ {B : I → Type ℓ} {b0 : B i0} {b1 : B i1} where
  opaque
    unfolding transport

    Path→PathP : transport (λ i → B i) b0 ≡ b1 → PathP B b0 b1
    Path→PathP p i = hcomp
      (λ j → λ { (i = i0) → b0
               ; (i = i1) → p j
               })
      (transp (λ j → B (i ∧ j)) (~ i) b0)

    PathP→Path : PathP B b0 b1 → transport (λ i → B i) b0 ≡ b1
    PathP→Path p i = transp (λ j → B (i ∨ j)) i (p i)

