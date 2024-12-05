module Cubed.Core.Cube.Base where

open import Cubed.Core.Primitives
open import Cubed.Core.Path
open import Cubed.Core.Types.Base
open import Cubed.Core.Fun.Base as Fun using (_∘_)

open import Cubed.Core.Builtin using (module Nat)
open Nat

private variable
  ℓ ℓ' : Level
  A : Type _
  n : Nat


-- opaque
--   Cube       : (n : Nat) (A : Type ℓ) → Type ℓ
--   Boundary₀₁ : (n : Nat) (A : Type ℓ) (a₀ a₁ : Cube n A) → Type ℓ
--   Boundary   : (n : Nat) (A : Type ℓ) → Type ℓ
--   Int        : (n : Nat) (A : Type ℓ) → Boundary n A → Type ℓ

--   Cube zero A = A
--   Cube (suc n) A = Σ[ ∂ ∈ Boundary (suc n) A ] Int (suc n) A ∂

--   Boundary₀₁ zero A _ _ = Lift Unit
--   Boundary₀₁ (suc n) A a₀ a₁ = a₀ .fst ≡ a₁ .fst

--   Boundary zero A = Lift Unit
--   Boundary (suc zero) A = A × A
--   Boundary (suc (suc n)) A = Σ[ a₀ ∈ Cube (suc n) A ] Σ[ a₁ ∈ Cube (suc n) A ] Boundary₀₁ (suc n) A a₀ a₁

--   Int zero A _ = A
--   Int (suc zero) A ∂ = ∂ .fst ≡ ∂ .snd
--   Int (suc (suc n)) A (a₀ , a₁ , ∂₋) = (λ i → Int (suc n) A (∂₋ i)) [ a₀ .snd ≡ a₁ .snd ]


record Cube (A : Type ℓ) (n : Nat) : Type ℓ
Bound₀₁ : (A : Type ℓ) (n : Nat) (a₀ a₁ : Cube A n) → Type ℓ
Bound : (A : Type ℓ) (n : Nat) → Type ℓ
Int : (A : Type ℓ) (n : Nat) (∂ : Bound A n) → Type ℓ

record Cube A n where
  constructor mk
  inductive
  field
    ∂ : Bound A n
    int : Int A n ∂

open Cube public

Bound₀₁ A n a₀ a₁ = ∂ a₀ ≡ ∂ a₁

Bound A zero = Lift ⊤
Bound A (suc n) = Σ[ a₀ ∈ Cube A n ] Σ[ a₁ ∈ Cube A n ] Bound₀₁ A n a₀ a₁

∂ᵇ₀ : (∂ : Bound A (suc n)) → Cube A n
∂ᵇ₀ (a₀ , a₁ , a₀₁) = a₀

∂ᵇ₁ : (∂ : Bound A (suc n)) → Cube A n
∂ᵇ₁ (a₀ , a₁ , a₀₁) = a₁

∂ᵇ₀₁ : (∂ : Bound A (suc n)) → Cube.∂ (∂ᵇ₀ ∂) ≡ Cube.∂ (∂ᵇ₁ ∂)
∂ᵇ₀₁ (a₀ , a₁ , a₀₁) = a₀₁

Int A zero ∂ = A
Int A (suc n) ∂ = (λ i → Int A n (∂ᵇ₀₁ ∂ i)) [ int (∂ᵇ₀ ∂) ≡ int (∂ᵇ₁ ∂) ]


-- Some basic operations

-- ∂₀ : {n : ℕ}{A : Type ℓ} → Cube (suc n) A → Cube n A
-- ∂₀ {n = 0} (_ , p) = p i0
-- ∂₀ {n = suc n} (_ , p) = _ , p i0

-- ∂₁ : {n : ℕ}{A : Type ℓ} → Cube (suc n) A → Cube n A
-- ∂₁ {n = 0} (_ , p) = p i1
-- ∂₁ {n = suc n} (_ , p) = _ , p i1


-- mk-bound:
--   {∂₀ ∂₁ : Bound A n} →
--   ∂₀ ≡ ∂₁ → Int n A ∂₀ → Int n A ∂₁ → Boundary (suc n) A
-- mk-bound{n = zero} _ a b = a , b
-- mk-bound{n = suc n} ∂₋ a₀ a₁ = (_ , a₀) , (_ , a₁) , ∂₋

Bound-zero : Bound A zero
Bound-zero = lift tt

Bound-suc : (a₀ a₁ : Cube A n) (a₀₁ : Bound₀₁ A n a₀ a₁) → Bound A (suc n)
Bound-suc a₀ a₁ a₀₁ = a₀ , a₁ , a₀₁

Bound₀₁→Bound : {a₀ a₁ : Cube A n} (∂₀₁ : Bound₀₁ A n a₀ a₁) → Bound A (suc n)
Bound₀₁→Bound {a₀ = a₀} {a₁} a₀₁ = Bound-suc a₀ a₁ a₀₁

Int→Cube : {∂ : Bound A n} (int : Int A n ∂) → Cube A n
Int→Cube int = mk _ int

Path→Cube : {a₀ a₁ : Cube A n} → a₀ ≡ a₁ → Cube A (suc n)
Path→Cube {a₀ = a₀} {a₁} a₀₁ .∂ = Bound₀₁→Bound {a₀ = a₀} {a₁} (λ i → ∂ (a₀₁ i))
Path→Cube a₀₁ .int i = int (a₀₁ i)

-- -- A cube is just a path of cubes of one-lower-dimension.
-- -- pathCube : (n : Nat) (p : I → Cube n A) → Cube (suc n) A
-- -- pathCube zero p = _ , (λ i → p i)
-- -- pathCube (suc n) p = _ , λ i → p i .snd


-- -- -- Composition of internal cubes, with specified boundary

-- -- hcomp∂ :
-- --   {n : ℕ} {A : Type ℓ}
-- --   {∂₀ ∂₁ : ∂Cube n A} (∂₋ : ∂₀ ≡ ∂₁)
-- --   (a₀ : CubeRel n A ∂₀)
-- --   → CubeRel n A ∂₁
-- -- hcomp∂ ∂₋ = transport (λ i → CubeRel _ _ (∂₋ i))

-- -- hfill∂ :
-- --   {n : ℕ} {A : Type ℓ}
-- --   {∂₀ ∂₁ : ∂Cube n A} (∂₋ : ∂₀ ≡ ∂₁)
-- --   (a₀ : CubeRel n A ∂₀)
-- --   → CubeRel (suc n) A (make∂ ∂₋ a₀ (hcomp∂ ∂₋ a₀))
-- -- hfill∂ {n = 0} ∂₋ a₀ i = transportRefl a₀ (~ i)
-- -- hfill∂ {n = suc n} ∂₋  = transport-filler (λ i → CubeRel _ _ (∂₋ i))

const-suc : (cube : Cube A n) → Cube A (suc n)
const-suc cube = Path→Cube (refl {x = cube})

-- -- retConst : {n : ℕ}{A : Type ℓ} → (cube : Cube n A) → ∂₀ (constCube {n = n} cube) ≡ cube
-- -- retConst {n = 0} _ = refl
-- -- retConst {n = suc n} _ = refl

-- -- secConst : {n : ℕ}{A : Type ℓ} → (cube : Cube (suc n) A) → constCube (∂₀ cube) ≡ cube
-- -- secConst {n = 0} (_ , p) i = _ , λ j → p (i ∧ j)
-- -- secConst {n = suc n} (_ , p) i  = _ , λ j → p (i ∧ j)

-- -- isEquivConstCube : {n : ℕ}{A : Type ℓ} → isEquiv (constCube {n = n} {A = A})
-- -- isEquivConstCube {n = n} = isoToEquiv (iso constCube ∂₀ secConst (retConst {n = n})) .snd


-- Constant cubes

const : (a : A) → Cube A n
const {n = zero} = mk (lift tt)
const {n = suc n} = const-suc ∘ const

-- -- isEquivConst : {n : ℕ}{A : Type ℓ} → isEquiv (const n {A = A})
-- -- isEquivConst {n = 0} = idIsEquiv _
-- -- isEquivConst {n = suc n} = compEquiv (_ , isEquivConst) (_ , isEquivConstCube) .snd

-- -- cubeEquiv : {n : ℕ}{A : Type ℓ} → A ≃ Cube n A
-- -- cubeEquiv = _ , isEquivConst

-- -- makeConst : {n : ℕ}{A : Type ℓ} → (cube : Cube n A) → Σ[ a ∈ A ] cube ≡ const n a
-- -- makeConst {n = n} cube = invEq cubeEquiv cube , sym (secEq (cubeEquiv {n = n}) cube)

-- -- makeConstUniq : {n : ℕ}{A : Type ℓ} → (a : A) → makeConst (const n a) ≡ (a , refl)
-- -- makeConstUniq {n = n} a i .fst   = isEquivConst .equiv-proof (const n a) .snd (a , refl) i .fst
-- -- makeConstUniq {n = n} a i .snd j = isEquivConst .equiv-proof (const n a) .snd (a , refl) i .snd (~ j)


-- -- -- Cube with constant boundary

-- -- const∂ : (n : ℕ){A : Type ℓ} → A → ∂Cube n A
-- -- const∂ n a = ∂ (const n a)


-- -- -- J-rule for n-cubes,
-- -- -- in some sense a generalization of the usual (symmetric form of) J-rule,
-- -- -- which is equivalent to the case n=1.

-- -- module _ {n : ℕ} {A : Type ℓ}
-- --   (P : Cube n A → Type ℓ') (d : (a : A) → P (const _ a)) where

-- --   JCube : (a₋ : Cube n A) → P a₋
-- --   JCube a₋ =
-- --     let c-path = makeConst {n = n} a₋ in
-- --     transport (λ i → P (c-path .snd (~ i))) (d (c-path .fst))

-- --   JCubeβ : (a : A) → JCube (const _ a) ≡ d a
-- --   JCubeβ a i =
-- --     let c-square = makeConstUniq {n = n} a in
-- --     let c-path = transport-filler (λ i → P (c-square i0 .snd (~ i))) (d (c-square i0 .fst)) in
-- --     comp (λ j → P (c-square j .snd i))
-- --     (λ j → λ
-- --       { (i = i0) → c-path i1
-- --       ; (i = i1) → d _ })
-- --     (c-path (~ i))
