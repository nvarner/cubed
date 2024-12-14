{-# OPTIONS --lossy-unification #-}

open import Cubed.Level

open import Cubed.Data.Nat.Base as Nat using (Nat; zero; suc; elim; _+_; _//_; _%_; _<_; s≤s; z<s; Is-nonzero)
open import Cubed.Data.Sum.Base using (_⊎_; inl; inr)

open import Cubed.Id.Base using (Id-sys; _≡ₛ_; reflₛ; congₛ; _∙ₛ_; ≡ₛ→≡; ≡→≡ₛ)

open import Cubed.Fun.Base using (id; _∘'_; it)

open import Cubed.Path.Base using (PathP; _≡_; refl; _∙_; sym; cong; subst)
--open import Cubed.Path.HLevel.Base using (Is-set; hlevelₛ)

open import Cubed.Relation.Nullary.Neg.Base using (¬_)


module Cubed.Data.Nat.Properties where

private variable
  n : Nat

instance id-sys : Id-sys Nat
id-sys = record
  { _≡ₛ_ = Nat._≡'_
  ; reflₛ = Nat.refl'
  ; ≡ₛ→≡ = ≡'→≡
  ; path-to-reflₛ = path-to-refl'
  }
  where opaque
    unfolding Nat.refl'

    ≡'→≡ : {x y : Nat} → x Nat.≡' y → x ≡ y
    ≡'→≡ {zero} {zero} eq = refl
    ≡'→≡ {suc x} {suc y} (Nat.s≡'s eq) = cong suc (≡'→≡ eq)

    path-to-refl' : {x y : Nat} (eq : x Nat.≡' y) → PathP (λ i → ≡'→≡ eq i Nat.≡' y) eq Nat.refl'
    path-to-refl' {zero} {zero} Nat.z≡'z = refl
    path-to-refl' {suc x} {suc y} (Nat.s≡'s eq) = cong Nat.s≡'s (path-to-refl' eq)

-- instance is-set : Is-set Nat
-- is-set = hlevelₛ (λ where m n s → {!s!})

znotsₛ : ¬ zero ≡ₛ suc n
znotsₛ ()

znots : ¬ zero ≡ suc n
znots {n} = znotsₛ {n} ∘' ≡→≡ₛ

+-id-lₛ : (n : Nat) → zero + n ≡ₛ n
+-id-lₛ n = reflₛ {x = n}

+-id-l : (n : Nat) → zero + n ≡ n
+-id-l n = refl

+-id-rₛ : (n : Nat) → n + zero ≡ₛ n
+-id-rₛ = elim reflₛ (λ n → Nat.s≡'s)

+-id-r : (n : Nat) → n + zero ≡ n
+-id-r = elim refl (λ n → cong suc)

+-assocₛ : (x y z : Nat) → (x + y) + z ≡ₛ x + (y + z)
+-assocₛ = elim (λ y z → reflₛ) (λ x ih y z → Nat.s≡'s (ih y z))

+-assoc : (x y z : Nat) → (x + y) + z ≡ x + (y + z)
+-assoc = elim (λ y z → refl) (λ x ih y z → cong suc (ih y z))

+-sucₛ : (m n : Nat) → m + suc n ≡ₛ suc m + n
+-sucₛ = elim (λ n → reflₛ) (λ m ih n → Nat.s≡'s (ih n))

+-suc : (m n : Nat) → m + suc n ≡ suc m + n
+-suc = elim (λ n → refl) (λ m ih n → cong suc (ih n))

+-commₛ : (m n : Nat) → m + n ≡ₛ n + m
+-commₛ m = elim (+-id-rₛ _) (λ y ih → +-sucₛ _ _ ∙ₛ Nat.s≡'s ih)

+-comm : (m n : Nat) → m + n ≡ n + m
+-comm m = elim (+-id-r _) (λ y ih → +-suc _ _ ∙ cong suc ih)

mod-zero : (m : Nat) → 0 % m ≡ 0
mod-zero zero = refl
mod-zero (suc zero) = refl
mod-zero (suc (suc m)) = mod-zero (suc m)

-- mod-suc : (a m : Nat) → suc a % m ≡ 0 ⊎ suc a % m ≡ suc (a % m)
-- mod-suc a m = {!!}

-- mod<modulus : (a m : Nat) → Is-nonzero m → a % m < m
-- mod<modulus zero (suc m) m-nonzero = subst (_< suc m) (sym (mod-zero _)) z<s
-- mod<modulus (suc a) (suc m) m-nonzero = s≤s {!!}

