module Cubed.Prelude.Data.Nat.Trichotomy where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Data.Nat.Base

private variable
  ℓ : Level
  A : Type ℓ
  m n : Nat


module _ where
  open Notation

  data Trichotomy : Nat → Nat → Type lzero where
    lt : m < n → Trichotomy m n
    eq : m ≡ n → Trichotomy m n
    gt : m > n → Trichotomy m n

  rec :
    (m < n → A) →
    (m ≡ n → A) →
    (m > n → A) →
    Trichotomy m n → A
  rec f< f≡ f> (lt m<n) = f< m<n
  rec f< f≡ f> (eq m≡n) = f≡ m≡n
  rec f< f≡ f> (gt m>n) = f> m>n

suc<> : Trichotomy m n → Trichotomy (suc m) (suc n)
suc<> (lt m<n) = lt (suc m<n)
suc<> (eq m≡n) = eq (cong suc m≡n)
suc<> (gt m>n) = gt (suc m>n)

_<>_ : (m n : Nat) → Trichotomy m n
zero <> zero = eq refl
zero <> suc n = lt known!
suc m <> zero = gt known!
suc m <> suc n = suc<> $ m <> n

instance
  inst-<>-notation : Notation.<>-notation Nat
  inst-<>-notation .Notation.<>-notation.ℓout = lzero
  inst-<>-notation .Notation.<>-notation.Out = Trichotomy
  inst-<>-notation .Notation.<>-notation._<>_ = _<>_

