open import Cubed.Level

open import Cubed.Data.Bool.Base using (Bool; true; false; T)
open import Cubed.Data.Dec.Base as Dec using (Dec; yes; no)
open import Cubed.Data.Empty.Base using (Empty)
open import Cubed.Data.Unit.Base using (Unit; tt)

open import Cubed.Fun.Base using (it; _∘₂_; _|>_)


module Cubed.Data.Nat.Base where

open import Agda.Builtin.Nat public
  using (Nat; zero; suc; _+_; _-_; _*_)
  renaming (_==_ to _≡ᵇ_; _<_ to _<ᵇ_)

private variable
  ℓ : Level
  A B : Type _
  m n : Nat

open import Agda.Builtin.String public
  renaming (primShowNat to show)


-- instance
--   inst-from-nat : Has-from-nat Nat
--   inst-from-nat .Has-from-nat.Constraint n = Types.⊤
--   inst-from-nat .Has-from-nat.fromNat n = n

--   inst-+-notation : Notation.+-notation Nat Nat Nat
--   inst-+-notation = Notation.mk _+_

--   inst-·-notation : Notation.·-notation Nat Nat Nat
--   inst-·-notation = Notation.mk _·_

elim :
  {B : Nat → Type ℓ} →
  B zero →
  (∀ n → B n → B (suc n)) →
  ∀ n → B n
elim B-zero B-suc zero = B-zero
elim B-zero B-suc (suc n) = B-suc n (elim B-zero B-suc n)

rec : {B : Type ℓ} → B → (Nat → B → B) → Nat → B
rec = elim

case : A → A → Nat → A
case z s zero = z
case z s (suc n) = s

is-zeroᵇ : Nat → Bool
is-zeroᵇ = case true false

infix 4 _≡'_
data _≡'_ : Nat → Nat → Type lzero where
  instance z≡'z : zero ≡' zero
  s≡'s : m ≡' n → suc m ≡' suc n

{-# OVERLAPPING z≡'z #-}

instance inst-s≡'s : {{m ≡' n}} → suc m ≡' suc n
inst-s≡'s = s≡'s it
{-# INCOHERENT inst-s≡'s #-}

opaque
  instance ≡ᵇ→≡' : {T (m ≡ᵇ n)} → m ≡' n
  ≡ᵇ→≡' {zero} {zero} {eq} = z≡'z
  ≡ᵇ→≡' {suc m} {suc n} {eq} = s≡'s (≡ᵇ→≡' {m} {n} {eq})
  {-# OVERLAPPABLE ≡ᵇ→≡' #-}

opaque
  instance refl' : n ≡' n
  refl' {n = zero} = z≡'z
  refl' {n = suc n} = s≡'s refl'
  {-# OVERLAPS refl' #-}

_≤ᵇ_ : Nat → Nat → Bool
zero ≤ᵇ y = true
suc x ≤ᵇ y = x <ᵇ y

data _≤_ : Nat → Nat → Type lzero where
  z≤ : zero ≤ n
  s≤s : m ≤ n → suc m ≤ suc n

s≤s⁻¹ : suc m ≤ suc n → m ≤ n
s≤s⁻¹ (s≤s m≤n) = m≤n

_≤?_ : (x y : Nat) → Dec (x ≤ y)
zero ≤? y = yes z≤
suc x ≤? zero = no λ ()
suc x ≤? suc y =
  x ≤? y
  |> Dec.map s≤s (λ ¬x≤y sx≤sy → ¬x≤y (s≤s⁻¹ sx≤sy))

data _<_ : Nat → Nat → Type lzero where
  z<s : zero < suc n
  suc : m < n → suc m < suc n

instance
  inst-z<s : zero < suc n
  inst-z<s = z<s

  inst-<-suc : {{m < n}} → suc m < suc n
  inst-<-suc {{m<n}} = suc m<n

_>_ : Nat → Nat → Type lzero
m > n = n < m

-- instance
--   inst-<-notation : Notation.<-notation Nat
--   inst-<-notation = Notation.strict-ord-from-<.< _ _<_

--   inst->-notation : Notation.>-notation Nat
--   inst->-notation = Notation.strict-ord-from-<.> _ _<_

max : Nat → Nat → Nat
max zero n = n
max m zero = m
max (suc m) (suc n) = suc (max m n)

safe-pred : Nat → Nat
safe-pred zero = zero
safe-pred (suc n) = n

data Is-zero : Nat → Type lzero where
  zero : Is-zero zero

