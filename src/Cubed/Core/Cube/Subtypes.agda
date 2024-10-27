open import Cubed.Core.Primitives
open import Cubed.Core.Path
open import Cubed.Core.Types.Base
open import Cubed.Core.Fun.Base as Fun using (_∘_)
open import Cubed.Core.Cube.Base as Cube using (const)

open import Cubed.Core.Builtin using (module Nat)
open Nat

module Cubed.Core.Cube.Subtypes where

private variable
  ℓ : Level
  A : Type _


-- Cubes with a pair of specified constant opposite faces
module Opp-const where
  Boundary₀₁ : (n : Nat) (A : Type ℓ) (a₀ a₁ : A) → Type ℓ
  Boundary₀₁ n A a₀ a₁ = Cube.Boundary₀₁ n A (const _ a₀) (const _ a₁)

  Boundary : (n : Nat) (A : Type ℓ) → Type ℓ
  Boundary n A = Σ[ a₀ ∈ A ] Σ[ a₁ ∈ A ] Boundary₀₁ n A a₀ a₁

  Int : (n : Nat) (A : Type ℓ) (∂ : Boundary n A) → Type ℓ
  Int n A (_ , _ , ∂₀₁) = Cube.Int (suc n) A (Cube.Boundary₀₁→Boundary ∂₀₁)

  Cube : (n : Nat) (A : Type ℓ) → Type ℓ
  Cube n A = Σ[ ∂ ∈ Boundary n A ] Int n A ∂


  -- The equivalence of cubes with fixed constant opposite faces and cubes in the path type

  Boundary₀₁→Cube-Boundary :
    {n : Nat} {a₀ a₁ : A} →
    Boundary₀₁ n A a₀ a₁ → Cube.Boundary n (a₀ ≡ a₁)

  Int→Cube-Int :
    {n : Nat} {∂@(a₀ , a₁ , ∂₀₁) : Boundary n A} →
    Int n A ∂ → Cube.Int n (a₀ ≡ a₁) (Boundary₀₁→Cube-Boundary ∂₀₁)

  Boundary₀₁→Cube-Boundary {n = zero} ∂₀₁ = lift tt
  Boundary₀₁→Cube-Boundary {n = suc zero} ∂₀₁ = cong fst ∂₀₁ , cong snd ∂₀₁
  Boundary₀₁→Cube-Boundary {n = suc (suc n)} ∂₀₁ =
    Cube.make-boundary {!!} (Int→Cube-Int (cong {!!} ∂₀₁)) {!!}

  -- ∂Opp-const-cube₀₁→∂Cube {n = 0} _ = lift tt
  -- ∂Opp-const-cube₀₁→∂Cube {n = 1} p = cong fst p , cong snd p
  -- ∂Opp-const-cube₀₁→∂Cube {n = suc (suc n)} {A} {a₀} {a₁} ∂₀₁ =
  --   (_ , (CubeRelConst₀₁→Path (cong (snd ∘ fst) ∂₀₁))) ,
  --   (_ , (CubeRelConst₀₁→Path (cong (snd ∘ fst ∘ snd) ∂₀₁))) ,
  --   cong ∂CubeConst₀₁→Path {!λ j → ∂₀₁ j .snd .snd!}
  --   --λ i → ∂CubeConst₀₁→Path (λ j → ∂₀₁ j .snd .snd i)

  -- -- CubeRelConst₀₁→Path {n = 0} p = p
  -- -- CubeRelConst₀₁→Path {n = 1} a₋ i j = a₋ j i
  -- -- CubeRelConst₀₁→Path {n = suc (suc n)} {A} {a₀} {a₁} a₋ i =
  -- --   CubeRelConst₀₁→Path (λ j → a₋ j i)

  -- CubeRelConst₀₁→Path {n = 0} p = p
  -- CubeRelConst₀₁→Path {n = 1} a₋ = {!!}
  -- CubeRelConst₀₁→Path {n = suc (suc n)} {A} {a₀} {a₁} a₋ = {!!}


-- interleaved mutual

--   ∂CubePath→Const₀₁ :
--     {n : ℕ}{A : Type ℓ}{a₀ a₁ : A}
--     → ∂Cube n (a₀ ≡ a₁) → ∂CubeConst₀₁ n A a₀ a₁

--   CubeRelPath→Const₀₁ :
--     {n : ℕ}{A : Type ℓ}{a₀ a₁ : A}{∂ : ∂Cube n (a₀ ≡ a₁)}
--     → CubeRel n (a₀ ≡ a₁) ∂ → CubeRelConst₀₁ n A (∂CubePath→Const₀₁ ∂)

--   ∂CubePath→Const₀₁ {n = 0} _ = tt*
--   ∂CubePath→Const₀₁ {n = 1} (p , q) i = p i , q i
--   ∂CubePath→Const₀₁ {n = suc (suc n)} (a₀ , a₁ , ∂₋) i =
--     (_ , CubeRelPath→Const₀₁ (a₀ .snd) i) ,
--     (_ , CubeRelPath→Const₀₁ (a₁ .snd) i) ,
--     λ j → ∂CubePath→Const₀₁ (∂₋ j) i

--   CubeRelPath→Const₀₁ {n = 0} p = p
--   CubeRelPath→Const₀₁ {n = 1} a₋ i j = a₋ j i
--   CubeRelPath→Const₀₁ {n = suc (suc n)} a₋ i j = CubeRelPath→Const₀₁ (a₋ j) i


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
