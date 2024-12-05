open import Cubed.Level

open import Cubed.Data.Prod.Base using (_×_; _,_)


module Cubed.Fun.Base where

private variable
  ℓ : Level
  A B C : Type _
  B₁ : (a : A) → Type _
  C₂ : (a : A) (b : B₁ a) → Type _
  D₃ : (a : A) (b : B₁ a) (c : C₂ a b) → Type _

id : A → A
id a = a

const : A → B → A
const a b = a

flip :
  {C : A → B → Type ℓ}
  (f : (a : A) (b : B) → C a b) →
  (b : B) (a : A) → C a b
flip f b a = f a b
{-# INLINE flip #-}

curry' : (A × B → C) → (A → B → C)
curry' f a b = f (a , b)
{-# INLINE curry' #-}

uncurry' : (A → B → C) → (A × B → C)
uncurry' f (a , b) = f a b
{-# INLINE uncurry' #-}

infixr 9 _∘_
_∘_ :
  (g : {a : A} (b : B₁ a) → C₂ a b)
  (f : (a : A) → B₁ a) →
  (a : A) → C₂ a (f a)
(g ∘ f) a = g (f a)
{-# INLINE _∘_ #-}

infixr 9 _∘'_
_∘'_ : (B → C) → (A → B) → (A → C)
(g ∘' f) a = g (f a)

infixr 9 _∘₂_
_∘₂_ :
  (g : {a : A} {b : B₁ a} (c : C₂ a b) → D₃ a b c)
  (f : (a : A) (b : B₁ a) → C₂ a b) →
  (a : A) (b : B₁ a) → D₃ a b (f a b)
(g ∘₂ f) a b = g (f a b)
{-# INLINE _∘₂_ #-}

infixr -2 _$_
_$_ : (f : (a : A) → B₁ a) (a : A) → B₁ a
f $ a = f a
{-# INLINE _$_ #-}

infixl -1 _|>_
_|>_ : (a : A) (f : (a : A) → B₁ a) → B₁ a
a |> f = f a
{-# INLINE _|>_ #-}

_$- : (f : (a : A) → B₁ a) → ({a : A} → B₁ a)
f $- = f _
{-# INLINE _$- #-}

λ- : (f : {a : A} → B₁ a) → ((a : A) → B₁ a)
λ- f a = f
{-# INLINE λ- #-}

it : {{A}} → A
it {{A}} = A

