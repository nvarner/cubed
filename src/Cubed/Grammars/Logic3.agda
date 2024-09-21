module Cubed.Grammars.Logic3 where

open import Cubed.Core.Prelude
open import Cubed.Data.Fin.Base using (Fin ; zero ; suc)
open import Cubed.Data.Nat.Base using (Nat ; zero ; suc)

module _ (Σ₀ : Type lzero) where

  data L-type ℓ : Type (lsuc ℓ)
  infix 3 _⊢_
  data _⊢_ {ℓ} : L-type ℓ → L-type ℓ → Type (lsuc ℓ)

  data L-type ℓ where
    ε ⊤ ⊥ : L-type ℓ
    _⊗_ _⊕_ _&'_ : L-type ℓ → L-type ℓ → L-type ℓ
    Lit : Σ₀ → L-type ℓ
    LinΣ LinΠ : (A : Type ℓ) → (A → L-type ℓ) → L-type ℓ
    --μ : (L-type → Strictly-positive) → L-type
    W : (Shape : Type ℓ) → (Arity : Shape → Nat) → L-type ℓ

  multi :
    ∀ {ℓ'} {A : Type ℓ'} (op : A → A → A) (unit : A) →
    (n : Nat) → (Fin n → A) → A
  multi op unit zero f = unit
  multi op unit (suc n) f = op (f zero) (multi op unit n (f ∘ suc))

  multi-⊗-type = multi _⊗_ ε

  private variable
    Δ Δ' Δ'₁ Δ'₂ : L-type _
    A B C : L-type _

  infixl 6 _⊕_
  infixl 5 _⊗_

  data _⊢_ {ℓ} where
    id :
      A ⊢ A
    _⊗_ :
      Δ ⊢ A →
      Δ' ⊢ B →
      Δ ⊗ Δ' ⊢ A ⊗ B
    t :
      Δ ⊢ ⊤
    _&'_ :
      Δ ⊢ A →
      Δ ⊢ B →
      Δ ⊢ A &' B
    π₁ :
      Δ ⊢ A &' B →
      Δ ⊢ A
    π₂ :
      Δ ⊢ A &' B →
      Δ ⊢ B
    -- cons : ∀ Shape Arity →
    --   (s : Shape) →
    --   (Δ : Fin (Arity s) → L-type ℓ) →
    --   ((k : Fin (Arity s)) → Δ k ⊢ W Shape Arity) →
    --   multi-⊗-type (Arity s) Δ ⊢ W Shape Arity
    -- fold : ∀ Shape Arity →
    --   (x : Δ ⊢ W' Shape Arity) →
    --   ∀ B → ((s : Shape) (A : Fin (Arity s) → L-type) → multi-⊗-type (Arity s) A ⊢ B) →
    --   Δ ⊢ B

  private module _ (c : Σ₀) where
    private variable
      ℓ : Level

    char : L-type lzero
    char = LinΣ Σ₀ Lit

    data KL*-label {ℓ} : Type ℓ where
      nil cons : KL*-label

    KL* : ∀ {ℓ} → L-type (lsuc ℓ)
    KL* {ℓ} = LinΠ (L-type ℓ) {!!} -- W KL*-label (λ { nil → 0 ; cons → 1 })

    string : L-type ℓ
    string = Lit c ⊗ Lit c

    grammar : L-type ℓ
    grammar = Lit c ⊗ (Lit c &' Lit c)

    parser : string ⊢ grammar
    parser = id ⊗ (id &' id)

