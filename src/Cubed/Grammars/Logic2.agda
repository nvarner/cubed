module Cubed.Grammars.Logic2 where

open import Cubed.Prelude

open import Cubed.Data.Fin as Fin using (Fin ; zero ; suc)

open List using (_++_)

private variable
  ℓ : Level

module _ (Σ₀ : Type ℓ) (Σ₀-discrete : {a b : Σ₀} → Dec (a ≡ b)) where

  instance
    _ = Σ₀-discrete

  U-level : Type lzero
  U-ctxt : Type ℓ
  data U-term : Type ℓ

  data U-lookup : U-ctxt → U-term → Type ℓ
  data U-ctxt-valid : U-ctxt → Type ℓ
  data U-type-valid : U-ctxt → U-term → U-level → Type ℓ
  data U-is-type : U-ctxt → U-term → Type ℓ
  data U-typing : U-ctxt → U-term → U-term → Type ℓ

  L-ctxt : Type ℓ
  data L-term : Type ℓ

  data L-strictly-positive : L-term → Type ℓ
  data L-ctxt-valid : U-ctxt → L-ctxt → Type ℓ
  data L-type-valid : U-ctxt → L-term → U-term → Type ℓ
  data L-is-type : U-ctxt → L-term → Type ℓ
  data L-typing : U-ctxt → L-ctxt → L-term → L-term → Type ℓ

  data _⊢L-is-type_ : U-ctxt → L-term → Type ℓ where
    pf : (Γ : U-ctxt) (A : L-term) (x : U-term) → U-ctxt-valid Γ → U-is-type Γ x → L-type-valid Γ A x → Γ ⊢L-is-type A

  U-sub' : (Nat → U-term) → (Nat → L-term) → U-term → U-term
  L-sub' : (Nat → U-term) → (Nat → L-term) → L-term → L-term

  U-lookup-index : ∀ {Γ A} → U-lookup Γ A → Nat

  U-level = Nat
  U-ctxt = List U-term
  L-ctxt = List L-term

  data U-term where
    Var : (idx : Nat) → U-term
    U : U-level → U-term
    L : U-term → U-term
    G : L-term → U-term
    [_]L : L-term → U-term
    ⊤ ⊥ Char : U-term
    Π' Σ' _+_ : U-term → U-term → U-term
    * : U-term
    -- in `fun A B x`, the body of the function in `Π' A B` is `x`
    fun : U-term → U-term → U-term → U-term
    ap : U-term → U-term → U-term
    -- in `pair A B x y`, we get the pair (`x` , `y`) with type `Σ' A B`
    pair : U-term → U-term → U-term → U-term → U-term
    π₁ π₂ : U-term → U-term
    -- `case a x y` expects `a` to be some `A + B`, and creates a binding in `x` and `y`
    case : U-term → U-term → U-term → U-term
    -- `inl A x` is the left injection into `(type of x) + A`
    -- `inr A x` is the right injection into `A + (type of x)`
    inl inr : U-term → U-term → U-term

  data L-term where
    Var : (idx : Nat) → L-term
    Lit : Σ₀ → L-term
    _⊗_ _&'_ _⊕_ : L-term → L-term → L-term
    μ : L-term → L-term
    -- `let⊗= x in y` expects `x` to be some `A ⊗ B`, and creates two bindings in `y`
    let⊗=_in'_ : L-term → L-term → L-term
    -- `inl A x` is the left injection into `(type of x) ⊕ A`
    -- `inr A x` is the right injection into `A ⊕ (type of x)`
    inl inr : L-term → L-term → L-term
    π₁ π₂ : L-term → L-term
    -- `cons A x` has type `μ A`
    cons : L-term → L-term → L-term
    -- `fold B x y`
    fold : L-term → L-term → L-term → L-term

  data U-lookup where
    zero : ∀ {Γ A} → U-lookup (A ∷ Γ) A
    suc : ∀ {Γ A B} → U-lookup Γ A → U-lookup (B ∷ Γ) A

  U-ext : (Nat → U-term) → Nat → U-term
  U-ext σ zero = Var zero
  U-ext σ (suc n) = σ n

  U-sub' σ ρ (Var idx) = σ idx
  U-sub' σ ρ (U lev) = U lev
  U-sub' σ ρ (L u) = L (U-sub' σ ρ u)
  U-sub' σ ρ (G l) = G (L-sub' σ ρ l)
  U-sub' σ ρ ([ l ]L) = [ L-sub' σ ρ l ]L
  U-sub' σ ρ ⊤ = ⊤
  U-sub' σ ρ ⊥ = ⊥
  U-sub' σ ρ Char = Char
  U-sub' σ ρ (Π' A B) = Π' (U-sub' σ ρ A) (U-sub' (U-ext σ) ρ B)
  U-sub' σ ρ (Σ' A B) = Σ' (U-sub' σ ρ A) (U-sub' (U-ext σ) ρ B)
  U-sub' σ ρ (A + B) = U-sub' σ ρ A + U-sub' σ ρ B
  U-sub' σ ρ * = *
  U-sub' σ ρ (fun A B x) = fun (U-sub' σ ρ A) (U-sub' (U-ext σ) ρ B) (U-sub' (U-ext σ) ρ x)
  U-sub' σ ρ (ap f x) = ap (U-sub' σ ρ f) (U-sub' σ ρ x)
  U-sub' σ ρ (pair A B x y) = pair (U-sub' σ ρ A) (U-sub' σ ρ B) (U-sub' σ ρ x) (U-sub' σ ρ y)
  U-sub' σ ρ (π₁ A) = π₁ (U-sub' σ ρ A)
  U-sub' σ ρ (π₂ A) = π₂ (U-sub' σ ρ A)
  U-sub' σ ρ (case a x y) = case (U-sub' σ ρ a) (U-sub' (U-ext σ) ρ x) (U-sub' (U-ext σ) ρ y)
  U-sub' σ ρ (inl A x) = inl (U-sub' σ ρ A) (U-sub' σ ρ x)
  U-sub' σ ρ (inr A x) = inr (U-sub' σ ρ A) (U-sub' σ ρ x)

  L-ext : (Nat → L-term) → Nat → L-term
  L-ext ρ zero = Var zero
  L-ext ρ (suc n) = ρ n

  L-sub' σ ρ (Var idx) = ρ idx
  L-sub' σ ρ (Lit c) = Lit c
  L-sub' σ ρ (x ⊗ y) = L-sub' σ ρ x ⊗ L-sub' σ ρ y
  L-sub' σ ρ (x &' y) = L-sub' σ ρ x &' L-sub' σ ρ y
  L-sub' σ ρ (A ⊕ B) = L-sub' σ ρ A ⊕ L-sub' σ ρ B
  L-sub' σ ρ (let⊗= x in' y) = let⊗= L-sub' σ ρ x in' L-sub' σ (L-ext (L-ext ρ)) y
  L-sub' σ ρ (inl A x) = inl (L-sub' σ ρ A) (L-sub' σ ρ x)
  L-sub' σ ρ (inr A x) = inr (L-sub' σ ρ A) (L-sub' σ ρ x)
  L-sub' σ ρ (π₁ x) = π₁ (L-sub' σ ρ x)
  L-sub' σ ρ (π₂ x) = π₂ (L-sub' σ ρ x)
  L-sub' σ ρ (μ A) = μ (L-sub' σ (L-ext ρ) A)
  L-sub' σ ρ (cons A x) = cons (L-sub' σ (L-ext ρ) A) (L-sub' σ ρ x)
  L-sub' σ ρ (fold B x y) = fold (L-sub' σ ρ B) (L-sub' σ ρ x) (L-sub' σ (L-ext ρ) y)

  U-sub : U-term → U-term → U-term
  U-sub x y = U-sub' σ ρ x
    where
    σ : Nat → U-term
    σ zero = y
    σ (suc n) = Var n
    ρ : Nat → L-term
    ρ n = Var n

  L-sub : L-term → L-term → L-term
  L-sub x y = L-sub' σ ρ x
    where
    σ : Nat → U-term
    σ n = Var n
    ρ : Nat → L-term
    ρ zero = y
    ρ (suc n) = Var n

  L-sub-fix : L-term → L-term → L-term
  L-sub-fix x y = L-sub' σ ρ x
    where
    σ : Nat → U-term
    σ n = Var n
    ρ : Nat → L-term
    ρ zero = y
    ρ (suc n) = Var (suc n)

  -- "Push" a term past a binding
  -- i.e. increments the index of each variable
  U-push : U-term → U-term
  U-push x = U-sub' σ ρ x
    where
    σ : Nat → U-term
    σ n = Var (suc n)
    ρ : Nat → L-term
    ρ n = Var n

  U-lookup-index zero = zero
  U-lookup-index (suc lookup) = suc (U-lookup-index lookup)

  data U-ctxt-valid where
    []-valid : U-ctxt-valid []
    ∷-valid : ∀ {Γ A} → U-ctxt-valid Γ → U-is-type Γ A → U-ctxt-valid (A ∷ Γ)

  data U-type-valid where
    typing→type-valid : ∀ {Γ A lev} →
      U-typing Γ A (U lev) →
      U-type-valid Γ A lev
    U-valid : ∀ {Γ lev} →
      U-type-valid Γ (U lev) (suc lev)
    L-valid : ∀ {Γ A lev} →
      U-type-valid Γ A lev →
      U-type-valid Γ (L A) lev
    ⊤-valid : ∀ {Γ} →
      U-type-valid Γ ⊤ zero
    ⊥-valid : ∀ {Γ} →
      U-type-valid Γ ⊥ zero
    Π-valid : ∀ {Γ A B} lev lev' →
      U-type-valid Γ A lev →
      U-type-valid (A ∷ Γ) B lev' →
      U-type-valid Γ (Π' A B) (Nat.max lev lev')
    Σ-valid : ∀ {Γ A B} lev lev' →
      U-type-valid Γ A lev →
      U-type-valid (A ∷ Γ) B lev' →
      U-type-valid Γ (Σ' A B) (Nat.max lev lev')
    +-valid : ∀ {Γ A B} lev lev' →
      U-type-valid Γ A lev →
      U-type-valid Γ B lev' →
      U-type-valid Γ (A + B) (Nat.max lev lev')

  data U-is-type where
    is-valid-at : ∀ {Γ A} (lev : Nat) → U-type-valid Γ A lev → U-is-type Γ A

  data U-typing where
    U-type-valid→typing : ∀ {Γ A lev} →
      U-type-valid Γ A lev →
      U-typing Γ A (U lev)
    L-type-valid→typing : ∀ {Γ A x} lev →
      U-type-valid Γ x lev →
      L-type-valid Γ A x →
      U-typing Γ [ A ]L (L x)
    Var : ∀ {Γ A} →
      (lookup : U-lookup Γ A) →
      U-typing Γ (Var (U-lookup-index lookup)) A
    ⊤-intro : ∀ {Γ} →
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
    +-intro-l : ∀ {Γ A B x} →
      U-typing Γ x B →
      U-typing Γ (inl A x) (A + B)
    +-intro-r : ∀ {Γ A B x} →
      U-typing Γ x B →
      U-typing Γ (inr A x) (B + A)
    +-elim : ∀ {Γ A B C a x y} →
      U-typing Γ a (A + B) →
      U-typing (A ∷ Γ) x C →
      U-typing (B ∷ Γ) y C →
      U-typing Γ (case a x y) C

  -- todo
  data L-strictly-positive where
    is-pos : ∀ {A} → L-strictly-positive A

  data L-ctxt-valid where
    []-valid : ∀ {Γ} →
      L-ctxt-valid Γ []
    ∷-valid : ∀ {Γ Δ A} →
      L-is-type Γ A →
      L-ctxt-valid Γ Δ →
      L-ctxt-valid Γ (A ∷ Δ)

  data L-type-valid where
    U-typing→type-valid : ∀ Γ A x →
      U-typing Γ [ A ]L (L x) →
      L-type-valid Γ A x
    Lit-valid : ∀ Γ c →
      L-type-valid Γ (Lit c) Char
    ⊗-valid : ∀ Γ A B x y →
      L-type-valid Γ A x →
      L-type-valid Γ B y →
      L-type-valid Γ (A ⊗ B) (Σ' x (U-push y))
    &-valid : ∀ Γ A B x y →
      L-type-valid Γ A x →
      L-type-valid Γ B y →
      L-type-valid Γ (A &' B) (x + y)
    ⊕-valid : ∀ Γ A B x y →
      L-type-valid Γ A x →
      L-type-valid Γ B y →
      L-type-valid Γ (A ⊕ B) (x + y)
    μ-valid : ∀ Γ A x →
      L-type-valid (L x ∷ Γ) A x →
      L-strictly-positive A →
      L-type-valid Γ (μ A) x

  data L-is-type where
    typing-L : ∀ {Γ A} (x : U-term) → L-type-valid Γ A x → L-is-type Γ A

  data L-typing where
    Var : ∀ {Γ A} →
      L-typing Γ (A ∷ []) (Var zero) A
    ⊗-intro : ∀ {Γ Δ Δ' A B x y} →
      L-typing Γ Δ x A →
      L-typing Γ Δ' y B →
      L-typing Γ (Δ List.++ Δ') (x ⊗ y) (A ⊗ B)
    ⊗-elim : ∀ {Γ Δ Δ'₁ Δ'₂ x A B y C} →
      L-typing Γ Δ x (A ⊗ B) →
      L-typing Γ (Δ'₁ ++ (A ∷ B ∷ []) ++ Δ'₂) y C →
      L-typing Γ (Δ'₁ ++ Δ ++ Δ'₂) (let⊗= x in' y) C
    ⊕-intro-l : ∀ {Γ Δ A B x} →
      L-typing Γ Δ x A →
      L-typing Γ Δ (inl B x) (A ⊕ B)
    ⊕-intro-r : ∀ {Γ Δ A B x} →
      L-typing Γ Δ x A →
      L-typing Γ Δ (inr B x) (B ⊕ A)
    &-intro : ∀ {Γ Δ A x B y} →
      L-typing Γ Δ x A →
      L-typing Γ Δ y B →
      L-typing Γ Δ (x &' y) (A &' B)
    &-elim-l : ∀ {Γ Δ A B x} →
      L-typing Γ Δ x (A &' B) →
      L-typing Γ Δ (π₁ x) A
    &-elim-r : ∀ {Γ Δ A B x} →
      L-typing Γ Δ x (A &' B) →
      L-typing Γ Δ (π₂ x) B
    μ-intro : ∀ {Γ Δ A x} →
      L-typing Γ Δ x (L-sub-fix A (μ A)) →
      L-typing Γ Δ (cons A x) (μ A)
    μ-elim : ∀ {Γ Δ A B x y} →
      L-typing Γ Δ x (μ A) →
      L-typing Γ (L-sub A B ∷ []) y B →
      L-typing Γ Δ (fold B x y) B

  module Semantics where

    module Grammars where

      String : Type ℓ
      String = List Σ₀

      record Split (w : String) : Type ℓ where
        field
          l : String
          r : String
          is-split : w ≡ l ++ r

      Grammar : Type (lsuc ℓ)
      Grammar = String → Type ℓ

      Term : Grammar → Grammar → Type _
      Term g g' = ∀ {w} → g w → g' w

      ε-grammar : Grammar
      ε-grammar [] = Lift Types.⊤
      ε-grammar (c ∷ cs) = Lift Types.⊥

      lit-grammar : Σ₀ → Grammar
      lit-grammar a (c ∷ []) = a ≟ c & Dec.rec (const $ Lift Types.⊤) (const $ Lift Types.⊥)
      lit-grammar a _ = Lift Types.⊥

      concat-grammar : Grammar → Grammar → Grammar
      concat-grammar g g' w = Σ[ split ∈ Split w ] g (split .l) Types.× g' (split .r)
        where open Split

      ⟦_⟧-U-ctxt : U-ctxt →
        Type ℓ
      ⟦_⟧-L-ctxt : ∀ {Γ Δ} → U-ctxt-valid Γ Types.× L-ctxt-valid Γ Δ →
        ⟦ Γ ⟧-U-ctxt → Grammar
      ⟦_⟧-L-type : ∀ {Γ A} →
        Γ ⊢L-is-type A →
        ⟦ Γ ⟧-U-ctxt → Grammar
      -- ⟦_⟧-L-term : ∀ {Γ Δ a A} →
      --   ((Γ-valid , Δ-valid , A-is-type , typing) : U-ctxt-valid Γ Types.× L-ctxt-valid Γ Δ Types.× L-is-type Γ A Types.× L-typing Γ Δ a A) →
      --   (γ : ⟦ Γ ⟧-U-ctxt) (w : String) → ⟦ Γ-valid , Δ-valid ⟧-L-ctxt γ w → ⟦ pf Γ A x Γ-valid x-is-type A-is-type ⟧-L-type γ w

      ⟦ _ ⟧-U-ctxt = Lift Types.⊤

      ⟦ Γ-valid , []-valid ⟧-L-ctxt x = ε-grammar
      ⟦ Γ-valid , ∷-valid (typing-L x type-valid) ctxt-valid ⟧-L-ctxt γ =
        concat-grammar (⟦ pf _ _ x Γ-valid {!!} type-valid ⟧-L-type γ) (⟦ Γ-valid , ctxt-valid ⟧-L-ctxt γ)

      ⟦ pf Γ (Var idx) x Γ-valid x-is-U-type valid-L-type ⟧-L-type γ = {!!}
      ⟦ pf Γ (Lit x₁) x Γ-valid x-is-U-type valid-L-type ⟧-L-type γ = {!!}
      ⟦ pf Γ (A ⊗ B) x Γ-valid x-is-U-type (U-typing→type-valid .Γ .(A ⊗ B) .x x₁) ⟧-L-type γ = {!!}
      ⟦ pf Γ (A ⊗ B) .(Σ' x (U-push y)) Γ-valid (is-valid-at lev (typing→type-valid x₁)) (⊗-valid .Γ .A .B x y A-valid-L-type B-valid-L-type) ⟧-L-type γ = {!!}
      ⟦ pf Γ (A ⊗ B) .(Σ' x (U-push y)) Γ-valid (is-valid-at .(Nat.max lev lev') (Σ-valid lev lev' x-valid y-valid)) (⊗-valid .Γ .A .B x y A-valid-L-type B-valid-L-type) ⟧-L-type γ =
        concat-grammar (⟦ pf Γ A x Γ-valid (is-valid-at lev x-valid) A-valid-L-type ⟧-L-type γ) {!!}
      ⟦ pf Γ (A &' A₁) x Γ-valid x-is-U-type valid-L-type ⟧-L-type γ = {!!}
      ⟦ pf Γ (A ⊕ A₁) x Γ-valid x-is-U-type valid-L-type ⟧-L-type γ = {!!}
      ⟦ pf Γ (μ A) x Γ-valid x-is-U-type valid-L-type ⟧-L-type γ = {!!}
      ⟦ pf Γ (let⊗= A in' A₁) x Γ-valid x-is-U-type valid-L-type ⟧-L-type γ = {!!}
      ⟦ pf Γ (inl A A₁) x Γ-valid x-is-U-type valid-L-type ⟧-L-type γ = {!!}
      ⟦ pf Γ (inr A A₁) x Γ-valid x-is-U-type valid-L-type ⟧-L-type γ = {!!}
      ⟦ pf Γ (π₁ A) x Γ-valid x-is-U-type valid-L-type ⟧-L-type γ = {!!}
      ⟦ pf Γ (π₂ A) x Γ-valid x-is-U-type valid-L-type ⟧-L-type γ = {!!}
      ⟦ pf Γ (cons A A₁) x Γ-valid x-is-U-type valid-L-type ⟧-L-type γ = {!!}
      ⟦ pf Γ (fold A A₁ A₂) x Γ-valid x-is-U-type valid-L-type ⟧-L-type γ = {!!}

  private module _ (c : Σ₀) where

    term typ : U-term
    term = pair (U zero) (Var zero) ⊤ *
    typ = Σ' (U zero) (Var zero)

    term-typ : U-typing [] term typ
    term-typ = Σ-intro (U-type-valid→typing ⊤-valid) ⊤-intro

    repeat-ftor repeat-term repeat-type : L-term
    repeat-ftor = Lit c ⊕ (Lit c ⊗ Var zero)
    repeat-term = cons repeat-ftor {!Var 1 ⊕ !}
    repeat-type = μ repeat-ftor

    repeat-typing : L-typing [] (Lit c ∷ []) repeat-term repeat-type
    repeat-typing = μ-intro {!!}

