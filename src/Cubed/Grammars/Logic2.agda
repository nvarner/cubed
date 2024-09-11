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

  data U-lookup where
    zero : ∀ {Γ A} → U-lookup (A ∷ Γ) A
    suc : ∀ {Γ A B} → U-lookup Γ A → U-lookup (B ∷ Γ) A

  U-ext' : (Nat → U-term) → Nat → U-term
  U-ext' σ zero = Var zero
  U-ext' σ (suc n) = σ n

  U-sub' : U-term → (Nat → U-term) → U-term
  U-sub' (Var idx) σ = σ idx
  U-sub' (U lev) σ = U lev
  U-sub' ⊤ σ = ⊤
  U-sub' ⊥ σ = ⊥
  U-sub' (Π' A B) σ = Π' (U-sub' A σ) (U-sub' B (U-ext' σ))
  U-sub' (Σ' A B) σ = Σ' (U-sub' A σ) (U-sub' B (U-ext' σ))
  U-sub' * σ = *
  U-sub' (fun A B x) σ = fun (U-sub' A σ) (U-sub' B (U-ext' σ)) (U-sub' x (U-ext' σ))
  U-sub' (ap f x) σ = ap (U-sub' f σ) (U-sub' x σ)
  U-sub' (pair A B x y) σ = pair (U-sub' A σ) (U-sub' B σ) (U-sub' x σ) (U-sub' y σ)

  U-sub-one : U-term → U-term → U-term
  U-sub-one x y = U-sub' x σ
    where
    σ : Nat → U-term
    σ zero = y
    σ (suc n) = Var n

  U-lookup-index zero = zero
  U-lookup-index (suc lookup) = suc (U-lookup-index lookup)

  U-ext :
    ∀ {Γ Δ} →
    (∀ {A} → U-lookup Γ A → U-lookup Δ A) →
    (∀ {A B} → U-lookup (B ∷ Γ) A → U-lookup (B ∷ Δ) A)
  U-rename :
    ∀ {Γ Δ} →
    (∀ {A} → U-lookup Γ A → U-lookup Δ A) →
    (x : U-term) {Typ : U-term} → U-typing Γ x Typ → U-term
  U-rename-pres-typing :
    ∀ {Γ Δ} →
    (ρ : ∀ {A} → U-lookup Γ A → U-lookup Δ A) →
    (x : U-term) {Typ : U-term} (x-typing : U-typing Γ x Typ) {n : U-level} (Typ-typing : U-typing Γ Typ (U n)) →
    U-typing Δ (U-rename ρ x x-typing) (U-rename ρ Typ Typ-typing)

  U-exts :
    ∀ {Γ Δ B} →
    (∀ {A} → U-lookup Γ A → Σ[ x ∈ U-term ] U-typing Δ x A) →
    (∀ {A} → U-lookup (B ∷ Γ) A → Σ[ x ∈ U-term ] U-typing (B ∷ Δ) x A)
  U-subst :
    ∀ {Γ Δ} →
    (∀ {A} → U-lookup Γ A → Σ[ x ∈ U-term ] U-typing Δ x A) →
    (x : U-term) {Typ : U-term} → U-typing Γ x Typ → U-term
  U-subst-one :
    ∀ {Γ A B} →
    (x : U-term) → U-typing (B ∷ Γ) x A →
    (y : U-term) → U-typing Γ y B →
    U-term

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
    fun : ∀ {Γ A B x} →
      U-is-type Γ A →
      U-is-type (A ∷ Γ) B →
      U-typing (A ∷ Γ) x B →
      U-typing Γ (fun A B x) (Π' A B)
    ap : ∀ {Γ A B f x} →
      U-typing Γ f (Π' A B) →
      {n : Nat} (B-typing : U-typing (A ∷ Γ) B (U n)) →
      (x-typing : U-typing Γ x A) →
      U-typing Γ (ap f x) (U-sub-one B x)
    pair : ∀ {Γ A B x y} →
      U-typing Γ x A →
      U-typing (A ∷ Γ) y B → -- or subst?
      U-typing Γ (pair A B x y) (Σ' A B)

  U-ext ρ zero = zero
  U-ext ρ (suc idx) = suc (ρ idx)

  U-rename ρ (Var .(U-lookup-index lookup)) (Var lookup) = Var (U-lookup-index (ρ lookup))
  U-rename ρ (U lev) typing = U lev
  U-rename ρ ⊤ typing = ⊤
  U-rename ρ ⊥ typing = ⊥
  U-rename ρ (Π' A B) (Π' m n A-typing B-typing) =
    Π' (U-rename ρ A A-typing) (U-rename (U-ext ρ) B B-typing)
  U-rename ρ (Σ' A B) (Σ' m n A-typing B-typing) =
    Σ' (U-rename ρ A A-typing) (U-rename (U-ext ρ) B B-typing)
  U-rename ρ * typing = *
  U-rename ρ (fun A B x) (fun (typing-U m A-typing) (typing-U n B-typing) x-typing) =
    fun (U-rename ρ A A-typing) (U-rename (U-ext ρ) B B-typing) (U-rename (U-ext ρ) x x-typing)
  U-rename ρ (ap f x) typing = {!!}
  U-rename ρ (pair A B x y) typing = {!!}

  U-rename-pres-typing ρ x x-typing Typ-typing = {!!}

  U-exts σ zero = (Var zero) , (Var zero)
  U-exts {Γ} {Δ} {B} σ {A} (suc idx) =
    let (x , x-has-type-A) = σ idx in
    (U-rename suc x x-has-type-A) , {!U-rename-pres-typing suc x x-has-type-A ?!}

  U-subst σ (Var .(U-lookup-index lookup)) (Var lookup) = σ lookup .fst
  U-subst σ (U x) typing = {!!}
  U-subst σ ⊤ typing = ⊤
  U-subst σ ⊥ typing = ⊥
  U-subst σ (Π' A B) (Π' m n A-typing B-typing) =
    --Π' (U-subst σ A A-typing) (U-subst (U-exts σ) B B-typing)
    Π' (U-subst σ A A-typing) (U-subst (λ {A} idx → {!!}) B B-typing)
  U-subst σ (Σ' A B) (Σ' m n A-typing B-typing) =
    Σ' (U-subst σ A A-typing) (U-subst (U-exts σ) B B-typing)
  U-subst σ * typing = *
  U-subst σ (fun A B x) (fun (typing-U m A-typing) (typing-U n B-typing) x-typing) =
    fun (U-subst σ A A-typing) (U-subst (U-exts σ) B B-typing) (U-subst (U-exts σ) x x-typing)
  U-subst σ (ap x x₁) typing = {!!}
  U-subst σ (pair x x₁ x₂ x₃) typing = {!!}

  U-subst-one {Γ} {A} {B} x x-typing y y-typing = U-subst σ x x-typing
    where
    σ : ∀ {A} → U-lookup (B ∷ Γ) A → Σ[ z ∈ U-term ] U-typing Γ z A
    σ zero = y , y-typing
    σ (suc idx) = Var _ , Var idx

