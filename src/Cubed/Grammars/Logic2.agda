module Cubed.Grammars.Logic2 where

open import Cubed.Prelude

open import Cubed.Data.Fin as Fin using (Fin ; zero ; suc)

private variable
  ℓ : Level

module _ (Σ₀ : Type ℓ) where

  U-level : Type lzero
  U-ctxt : Type ℓ
  data U-term : Type ℓ
  data U-lookup : U-ctxt → U-term → Type ℓ

  U-lookup-index : ∀ {Γ A} → U-lookup Γ A → Nat

  data U-ok : U-ctxt → Type ℓ
  data U-is-type : U-ctxt → U-term → Type ℓ
  data U-typing : U-ctxt → U-term → U-term → Type ℓ

  U-level = Nat
  U-ctxt = List U-term

  data U-term where
    Var : (idx : Nat) → U-term
    U : U-level → U-term
    ⊤ ⊥ : U-term
    Π' Σ' : U-term → U-term → U-term
    * : U-term
    --μ : U-term → U-term
    -- in `fun A B x`, the body of the function in `Π' A B` is `x`
    fun : U-term → U-term → U-term → U-term
    ap : U-term → U-term → U-term
    -- in `pair A B x y`, we get the pair (`x` , `y`) with type `Σ' A B`
    pair : U-term → U-term → U-term → U-term → U-term
    π₁ π₂ : U-term → U-term

  data U-lookup where
    zero : ∀ {Γ A} → U-lookup (A ∷ Γ) A
    suc : ∀ {Γ A B} → U-lookup Γ A → U-lookup (B ∷ Γ) A

  U-ext : (Nat → U-term) → Nat → U-term
  U-ext σ zero = Var zero
  U-ext σ (suc n) = σ n

  U-sub' : U-term → (Nat → U-term) → U-term
  U-sub' (Var idx) σ = σ idx
  U-sub' (U lev) σ = U lev
  U-sub' ⊤ σ = ⊤
  U-sub' ⊥ σ = ⊥
  U-sub' (Π' A B) σ = Π' (U-sub' A σ) (U-sub' B (U-ext σ))
  U-sub' (Σ' A B) σ = Σ' (U-sub' A σ) (U-sub' B (U-ext σ))
  U-sub' * σ = *
  U-sub' (fun A B x) σ = fun (U-sub' A σ) (U-sub' B (U-ext σ)) (U-sub' x (U-ext σ))
  U-sub' (ap f x) σ = ap (U-sub' f σ) (U-sub' x σ)
  U-sub' (pair A B x y) σ = pair (U-sub' A σ) (U-sub' B σ) (U-sub' x σ) (U-sub' y σ)
  U-sub' (π₁ A) σ = π₁ (U-sub' A σ)
  U-sub' (π₂ A) σ = π₂ (U-sub' A σ)

  U-sub : U-term → U-term → U-term
  U-sub x y = U-sub' x σ
    where
    σ : Nat → U-term
    σ zero = y
    σ (suc n) = Var n

  U-lookup-index zero = zero
  U-lookup-index (suc lookup) = suc (U-lookup-index lookup)

  data U-ok where
    ok-[] : U-ok []
    ok-∷ : ∀ {Γ A} → U-ok Γ → U-is-type Γ A → U-ok (A ∷ Γ)

  data U-is-type where
    typing-U : ∀ {Γ A} (n : Nat) → U-typing Γ A (U n) → U-is-type Γ A

  data U-typing where
    Var : ∀ {Γ A} →
      (lookup : U-lookup Γ A) →
      U-typing Γ (Var (U-lookup-index lookup)) A
    U : ∀ {Γ n} →
      U-typing Γ (U n) (U (suc n))
    ⊤ : ∀ {Γ} →
      U-typing Γ ⊤ (U zero)
    ⊥ : ∀ {Γ} →
      U-typing Γ ⊥ (U zero)
    Π' : ∀ {Γ A B} m n →
      U-typing Γ A (U m) →
      U-typing (A ∷ Γ) B (U n) →
      U-typing Γ (Π' A B) (U (Nat.max m n))
    Σ' : ∀ {Γ A B} m n →
      U-typing Γ A (U m) →
      U-typing (A ∷ Γ) B (U n) →
      U-typing Γ (Σ' A B) (U (Nat.max m n))
    * : ∀ {Γ} →
      U-typing Γ * ⊤
    Π-intro : ∀ {Γ A B x} →
      U-is-type Γ A →
      U-is-type (A ∷ Γ) B →
      U-typing (A ∷ Γ) x B →
      U-typing Γ (fun A B x) (Π' A B)
    Π-elim : ∀ {Γ A B f x} →
      U-typing Γ f (Π' A B) →
      U-typing Γ x A →
      U-typing Γ (ap f x) (U-sub B x)
    Σ-intro : ∀ {Γ A B x y} →
      U-typing Γ x A →
      U-typing Γ y (U-sub B x) →
      U-typing Γ (pair A B x y) (Σ' A B)
    Σ-elim-l : ∀ {Γ A B x} →
      U-typing Γ x (Σ' A B) →
      U-typing Γ (π₁ x) A
    Σ-elim-r : ∀ {Γ A B x} →
      U-typing Γ x (Σ' A B) →
      U-typing Γ (π₂ x) (U-sub B (π₁ x))


  private module _ where

    term typ : U-term
    term = pair (U zero) (Var zero) ⊤ *
    typ = Σ' (U zero) (Var zero)

    term-typ : U-typing [] term typ
    term-typ = Σ-intro ⊤ *

