module Cubed.Grammars.Logic where

open import Cubed.Prelude

private
  variable
    ℓ : Level
    n : Nat


module _ (Σ₀ : Type ℓ) where

  module U where
    infix 1 _⊢_⦂_
    infixl 4 _,,_

    data Term : Type ℓ
    data Ctxt : Type ℓ
    data _⊢_⦂_ : Ctxt → Term → Term → Type ℓ

    private
      variable
        Γ : Ctxt
        A B a b f : Term

    data Term where
      U : Nat → Term
      Var : Nat → Term
      Char ⊤Term ⊥Term : Term
      _×Term_ _+Term_ _⟶Term_ : Term → Term → Term
      tt : Term
      _,_ : Term → Term → Term
      inl⟨·⟩⟨_⟩_ inr⟨_⟩⟨·⟩_ : Term → Term → Term
      ƛ⟨_⟩_ _ap_ : Term → Term → Term

    data Ctxt where
      · : Ctxt
      _,,_ : Ctxt → Term → Ctxt

    data _⊢_⦂_ where
      instance
        Var-zero :
          Γ ,, A ⊢ Var zero ⦂ A
        Var-suc :
          {{_ : Γ ⊢ Var n ⦂ A}}
          →
          Γ ,, B ⊢ Var (suc n) ⦂ A
        U-is-U :
          Γ ⊢ U n ⦂ U (suc n)
        Char-is-U :
          Γ ⊢ Char ⦂ U zero
        ⊤-is-U :
          Γ ⊢ ⊤Term ⦂ U zero
        ⊥-is-U :
          Γ ⊢ ⊥Term ⦂ U zero
        ×-is-U :
          {{_ : Γ ⊢ A ⦂ U n}}
          {{_ : Γ ⊢ B ⦂ U n}}
          →
          Γ ⊢ A ×Term B ⦂ U n
        +-is-U :
          {{_ : Γ ⊢ A ⦂ U n}}
          {{_ : Γ ⊢ B ⦂ U n}}
          →
          Γ ⊢ A +Term B ⦂ U n
        ⟶-is-U :
          {{_ : Γ ⊢ A ⦂ U n}}
          {{_ : Γ ⊢ B ⦂ U n}}
          →
          Γ ⊢ A ⟶Term B ⦂ U n
        tt-is-⊤ :
          Γ ⊢ tt ⦂ ⊤Term
        ,-is-× :
          {{_ : Γ ⊢ a ⦂ A}}
          {{_ : Γ ⊢ b ⦂ B}}
          →
          Γ ⊢ a , b ⦂ A ×Term B
        inl-is-+ :
          {{_ : Γ ⊢ a ⦂ A}}
          →
          Γ ⊢ inl⟨·⟩⟨ B ⟩ a ⦂ A +Term B
        inr-is-+ :
          {{_ : Γ ⊢ b ⦂ B}}
          →
          Γ ⊢ inr⟨ A ⟩⟨·⟩ b ⦂ A +Term B
        ƛ-is-⟶ :
          {{_ : Γ ,, A ⊢ b ⦂ B}}
          →
          Γ ⊢ ƛ⟨ A ⟩ b ⦂ A ⟶Term B
        ap-is-ret :
          {{_ : Γ ⊢ f ⦂ A ⟶Term B}}
          {{_ : Γ ⊢ a ⦂ A}}
          →
          Γ ⊢ f ap a ⦂ B


  module Lin where
    infix 1 _∣_⊢_⦂_
    infixl 4 _,,_

    infixl 10 _⊗_
    infixl 9 _⊕_

    data Term : Type ℓ
    data Ctxt : Type ℓ
    data _∣_⊢_⦂_ : U.Ctxt → Ctxt → Term → Term → Type ℓ

    private variable
      Γ : U.Ctxt
      A B : U.Term
      Δ Δ' : Ctxt
      e e' G H : Term
      c : Σ₀

    data Term where
      Lin : U.Term → Term
      Lit : Σ₀ → Term
      _⊗_ _⊕_ : Term → Term → Term
      lit : Σ₀ → Term

    data Ctxt where
      · : Ctxt
      [_] : Term → Ctxt
      _,,_ : Ctxt → Ctxt → Ctxt

    data _∣_⊢_⦂_ where
      instance
        Lit-is-Lin :
          {c : Σ₀}
          →
          Γ ∣ Δ ⊢ Lit c ⦂ Lin U.Char
        ⊗-is-Lin :
          {{_ : Γ ∣ Δ ⊢ G ⦂ Lin A}}
          {{_ : Γ ∣ Δ' ⊢ H ⦂ Lin B}}
          →
          Γ ∣ Δ ⊢ G ⊗ H ⦂ Lin (A U.×Term B)
        ⊕-is-Lin :
          {{_ : Γ ∣ Δ ⊢ G ⦂ Lin A}}
          {{_ : Γ ∣ Δ ⊢ H ⦂ Lin B}}
          →
          Γ ∣ Δ ⊢ G ⊕ H ⦂ Lin (A U.+Term B)
        lit-is-Lit :
          Γ ∣ [ lit c ] ⊢ lit c ⦂ Lit c
        ⊗-is-⊗ :
          {{_ : Γ ∣ Δ ⊢ e ⦂ G}}
          {{_ : Γ ∣ Δ' ⊢ e' ⦂ H}}
          →
          Γ ∣ Δ ,, Δ' ⊢ e ⊗ e' ⦂ G ⊗ H

    test : (a b c : Σ₀) → Term
    test a b c = (lit a ⊗ lit b ⊗ lit c) ⊕ (lit c ⊗ lit b ⊗ lit a)

