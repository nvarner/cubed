open import Cubed.Core.Primitives
open import Cubed.Core.Path
open import Cubed.Core.Types.Base
open import Cubed.Core.Fun.Base as Fun using (_∘_)
open import Cubed.Core.Cube.Base as Cube using (int; ∂ᵇ₀; ∂ᵇ₁; ∂ᵇ₀₁; const)

open import Cubed.Core.Builtin using (module Nat)
open Nat

module Cubed.Core.Cube.Subtypes where

private variable
  ℓ : Level
  A : Type _
  n : Nat


-- Cubes with a pair of specified constant opposite faces
-- These are essentially n-globes, so we call them "globular cubes"
module Glob where
  Bound₀₁ : (A : Type ℓ) (n : Nat) (a₀ a₁ : A) → Type ℓ
  Bound₀₁ A n a₀ a₁ = Cube.Bound₀₁ A n (const a₀) (const a₁)

  Int : (A : Type ℓ) (n : Nat) {a₀ a₁ : A} (∂₀₁ : Bound₀₁ A n a₀ a₁) → Type ℓ
  Int A n {a₀} {a₁} ∂₀₁ = Cube.Int A (suc n) (Cube.Bound-suc (const a₀) (const a₁) ∂₀₁)

  record Glob (A : Type ℓ) (n : Nat) : Type ℓ where
    field
      ₀ ₁ : A
      ∂₀₁ : Bound₀₁ A n ₀ ₁
      int : Int A n ∂₀₁


  -- These are equivalent to cubes of paths

  module _ {A : Type ℓ} {a₀ a₁ : A} where

    Bound₀₁→Cube-Bound : (∂₀₁ : Bound₀₁ A n a₀ a₁) → Cube.Bound (a₀ ≡ a₁) n
    Int→Cube-Int :
      {∂₀₁ : Bound₀₁ A n a₀ a₁} (int : Int A n ∂₀₁) →
      Cube.Int (a₀ ≡ a₁) n (Bound₀₁→Cube-Bound ∂₀₁)

    Bound₀₁→Cube-Bound {n = zero} ∂₀₁ = Cube.Bound-zero
    Bound₀₁→Cube-Bound {n = suc n} ∂₀₁ = Cube.Bound-suc
      (Cube.Int→Cube (Int→Cube-Int (λ i → (int ∘ ∂ᵇ₀) (∂₀₁ i))))
      (Cube.Int→Cube (Int→Cube-Int (λ i → (int ∘ ∂ᵇ₁) (∂₀₁ i))))
      (λ i → Bound₀₁→Cube-Bound (λ j → ∂ᵇ₀₁ (∂₀₁ j) i))

    Int→Cube-Int {n = zero} int = int
    Int→Cube-Int {n = suc n} int i = Int→Cube-Int (λ j → int j i)


    Cube-Bound→Bound₀₁ : (∂ : Cube.Bound (a₀ ≡ a₁) n) → Bound₀₁ A n a₀ a₁
    Cube-Int→Int :
      {∂ : Cube.Bound (a₀ ≡ a₁) n} (int : Cube.Int (a₀ ≡ a₁) n ∂) →
      Int A n (Cube-Bound→Bound₀₁ ∂)

    Cube-Bound→Bound₀₁ {n = zero} ∂ = refl
    Cube-Bound→Bound₀₁ {n = suc n} ∂ i = Cube.Bound-suc
      (Cube.Int→Cube (Cube-Int→Int (int (∂ᵇ₀ ∂)) i))
      (Cube.Int→Cube (Cube-Int→Int (int (∂ᵇ₁ ∂)) i))
      (λ j → Cube-Bound→Bound₀₁ (∂ᵇ₀₁ ∂ j) i)

    Cube-Int→Int {n = zero} int = int
    Cube-Int→Int {n = suc n} int i j = Cube-Int→Int (int j) i


    Bound₀₁→Cube-Bound→Bound₀₁ :
      (∂₀₁ : Bound₀₁ A n a₀ a₁) →
      (Cube-Bound→Bound₀₁ ∘ Bound₀₁→Cube-Bound) ∂₀₁ ≡ ∂₀₁
    Int→Cube-Int→Int :
      {∂₀₁ : Bound₀₁ A n a₀ a₁} (int : Int A n ∂₀₁) →
      (λ i → Int A n (Bound₀₁→Cube-Bound→Bound₀₁ ∂₀₁ i)) [ (Cube-Int→Int ∘ Int→Cube-Int) int ≡ int ]

    Bound₀₁→Cube-Bound→Bound₀₁ {n = zero} = J (λ {zero p → _}) refl
    Bound₀₁→Cube-Bound→Bound₀₁ {n = suc n} = J (λ x ∂₀₁ → {!!} ≡ ∂₀₁) {!!}

-- interleaved mutual

--   ∂CubeConst₀₁→Path→Const₀₁ :
--     {n : ℕ}{A : Type ℓ}{a₀ a₁ : A}
--     (∂₀₁ : ∂CubeConst₀₁ n A a₀ a₁)
--     → ∂CubePath→Const₀₁ (∂CubeConst₀₁→Path ∂₀₁) ≡ ∂₀₁

--   CubeRelConst₀₁→Path→Const₀₁ :
--     {n : ℕ}{A : Type ℓ}{a₀ a₁ : A}{∂₀₁ : ∂CubeConst₀₁ n A a₀ a₁}
--     (a₋ : CubeRelConst₀₁ n A ∂₀₁)
--     → PathP (λ i → CubeRelConst₀₁ n A (∂CubeConst₀₁→Path→Const₀₁ ∂₀₁ i))
--       (CubeRelPath→Const₀₁ {n = n} (CubeRelConst₀₁→Path a₋)) a₋

--   ∂CubeConst₀₁→Path→Const₀₁ {n = 0} _ = refl
--   ∂CubeConst₀₁→Path→Const₀₁ {n = 1} _ = refl
--   ∂CubeConst₀₁→Path→Const₀₁ {n = suc (suc n)} ∂₀₁ i j =
--     (_ , CubeRelConst₀₁→Path→Const₀₁ {n = suc n} (λ i → ∂₀₁ i .fst .snd) i j) ,
--     (_ , CubeRelConst₀₁→Path→Const₀₁ {n = suc n} (λ i → ∂₀₁ i .snd .fst .snd) i j) ,
--     λ t → ∂CubeConst₀₁→Path→Const₀₁ {n = suc n} (λ j → ∂₀₁ j .snd .snd t) i j

--   CubeRelConst₀₁→Path→Const₀₁ {n = 0} _ = refl
--   CubeRelConst₀₁→Path→Const₀₁ {n = 1} _ = refl
--   CubeRelConst₀₁→Path→Const₀₁ {n = suc (suc n)} a₋ i j k =
--     CubeRelConst₀₁→Path→Const₀₁ {n = suc n} (λ j → a₋ j k) i j


-- interleaved mutual

--   ∂CubePath→Const₀₁→Path :
--     {n : ℕ}{A : Type ℓ}{a₀ a₁ : A}
--     (∂ : ∂Cube n (a₀ ≡ a₁))
--     → ∂CubeConst₀₁→Path (∂CubePath→Const₀₁ ∂) ≡ ∂

--   CubeRelPath→Const₀₁→Path :
--     {n : ℕ}{A : Type ℓ}{a₀ a₁ : A}{∂ : ∂Cube n (a₀ ≡ a₁)}
--     (a₋ : CubeRel n (a₀ ≡ a₁) ∂)
--     → PathP (λ i → CubeRel n (a₀ ≡ a₁) (∂CubePath→Const₀₁→Path ∂ i))
--       (CubeRelConst₀₁→Path {n = n} (CubeRelPath→Const₀₁ a₋)) a₋

--   ∂CubePath→Const₀₁→Path {n = 0} _ = refl
--   ∂CubePath→Const₀₁→Path {n = 1} _ = refl
--   ∂CubePath→Const₀₁→Path {n = suc (suc n)} (a₀ , a₁ , ∂₋) i =
--     (_ , CubeRelPath→Const₀₁→Path (a₀ .snd) i) ,
--     (_ , CubeRelPath→Const₀₁→Path (a₁ .snd) i) ,
--     λ t → ∂CubePath→Const₀₁→Path {n = suc n} (∂₋ t) i

--   CubeRelPath→Const₀₁→Path {n = 0} _ = refl
--   CubeRelPath→Const₀₁→Path {n = 1} _ = refl
--   CubeRelPath→Const₀₁→Path {n = suc (suc n)} a₋ i j =
--     CubeRelPath→Const₀₁→Path {n = suc n} (a₋ j) i


-- open isHAEquiv

-- Iso-∂CubeConst₀₁-Path : {n : ℕ}{A : Type ℓ}{a₀ a₁ : A} → Iso (∂CubeConst₀₁ n A a₀ a₁) (∂Cube n (a₀ ≡ a₁))
-- Iso-∂CubeConst₀₁-Path =
--   iso ∂CubeConst₀₁→Path ∂CubePath→Const₀₁ ∂CubePath→Const₀₁→Path ∂CubeConst₀₁→Path→Const₀₁

-- -- The iso defined above seems automatically half-adjoint,
-- -- but I don't want to write more crazy paths...

-- HAEquiv-∂CubeConst₀₁-Path : {n : ℕ}{A : Type ℓ}{a₀ a₁ : A} → HAEquiv (∂CubeConst₀₁ n A a₀ a₁) (∂Cube n (a₀ ≡ a₁))
-- HAEquiv-∂CubeConst₀₁-Path = iso→HAEquiv Iso-∂CubeConst₀₁-Path

-- IsoOver-CubeRelConst₀₁-Path : {n : ℕ}{A : Type ℓ}{a₀ a₁ : A}
--   → IsoOver Iso-∂CubeConst₀₁-Path (CubeRelConst₀₁ n A) (CubeRel n (a₀ ≡ a₁))
-- IsoOver-CubeRelConst₀₁-Path {n = n} =
--   isoover (λ _ → CubeRelConst₀₁→Path) (λ _ → CubeRelPath→Const₀₁)
--     (λ _ → CubeRelPath→Const₀₁→Path) (λ _ → CubeRelConst₀₁→Path→Const₀₁ {n = n})

-- ∂CubeConst₀₁≡∂CubePath : {n : ℕ}{A : Type ℓ}{a₀ a₁ : A} → ∂CubeConst₀₁ n A a₀ a₁ ≡ ∂Cube n (a₀ ≡ a₁)
-- ∂CubeConst₀₁≡∂CubePath = ua (_ , isHAEquiv→isEquiv (HAEquiv-∂CubeConst₀₁-Path .snd))

-- CubeRelConst₀₁≡CubeRelPath : {n : ℕ}{A : Type ℓ}{a₀ a₁ : A}
--   → PathP (λ i → ∂CubeConst₀₁≡∂CubePath {n = n} {A} {a₀} {a₁} i → Type ℓ) (CubeRelConst₀₁ n A) (CubeRel n (a₀ ≡ a₁))
-- CubeRelConst₀₁≡CubeRelPath = isoToPathOver _ _ (IsoOverIso→IsoOverHAEquiv IsoOver-CubeRelConst₀₁-Path)


-- {-

--   All cubes can be deformed to cubes with fixed constant opposite faces

-- -}


-- -- Uncurry the previous definitions

-- Σ∂CubeConst₀₁ : (n : ℕ) (A : Type ℓ) → Type ℓ
-- Σ∂CubeConst₀₁ n A = Σ[ a₀ ∈ A ] Σ[ a₁ ∈ A ] ∂CubeConst₀₁ n A a₀ a₁

-- ΣCubeRelConst₀₁ : (n : ℕ) (A : Type ℓ) → Σ∂CubeConst₀₁ n A → Type ℓ
-- ΣCubeRelConst₀₁ n A ∂₀₁ = CubeRel (suc n) A (∂Cube₀₁→∂Cube (∂₀₁ .snd .snd))

-- ΣCubeConst₀₁ : (n : ℕ) (A : Type ℓ) → Type ℓ
-- ΣCubeConst₀₁ n A = Σ[ ∂₀₁ ∈ Σ∂CubeConst₀₁ n A ] (ΣCubeRelConst₀₁ n A ∂₀₁)


-- -- For simplicity, we begin at n=1, and that is all we need.

-- ∂CubeConst₀₁≃∂CubeSuc : {n : ℕ} {A : Type ℓ} → Σ∂CubeConst₀₁ (suc n) A ≃ ∂Cube (suc (suc n)) A
-- ∂CubeConst₀₁≃∂CubeSuc = Σ-cong-equiv (_ , isEquivConst) (λ a → Σ-cong-equiv-fst (_ , isEquivConst))

-- HAEquiv-∂CubeConst₀₁-∂CubeSuc : {n : ℕ}{A : Type ℓ} → HAEquiv (Σ∂CubeConst₀₁ (suc n) A) (∂Cube (suc (suc n)) A)
-- HAEquiv-∂CubeConst₀₁-∂CubeSuc = equiv→HAEquiv ∂CubeConst₀₁≃∂CubeSuc

-- IsoOver-CubeRelConst₀₁-CubeRelSuc : {n : ℕ} {A : Type ℓ}
--   → IsoOver (isHAEquiv→Iso (HAEquiv-∂CubeConst₀₁-∂CubeSuc .snd)) (ΣCubeRelConst₀₁ (suc n) A) (CubeRel (suc (suc n)) A)
-- IsoOver-CubeRelConst₀₁-CubeRelSuc = liftHAEToIsoOver _ _ (λ a → idIso)

-- ∂CubeConst₀₁≡∂CubeSuc : {n : ℕ} {A : Type ℓ} → Σ∂CubeConst₀₁ (suc n) A ≡ ∂Cube (suc (suc n)) A
-- ∂CubeConst₀₁≡∂CubeSuc = ua (_ , isHAEquiv→isEquiv (HAEquiv-∂CubeConst₀₁-∂CubeSuc .snd))

-- CubeRelConst₀₁≡CubeRelSuc : {n : ℕ}{A : Type ℓ}
--   → PathP (λ i → ∂CubeConst₀₁≡∂CubeSuc {n = n} {A} i → Type ℓ) (ΣCubeRelConst₀₁ (suc n) A) (CubeRel (suc (suc n)) A)
-- CubeRelConst₀₁≡CubeRelSuc = isoToPathOver _ _ IsoOver-CubeRelConst₀₁-CubeRelSuc
