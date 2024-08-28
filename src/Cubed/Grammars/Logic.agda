module Cubed.Grammars.Logic where

open import Cubed.Prelude

private
  variable
    ℓ : Level
    n : Nat


module _ (Σ₀ : Type ℓ) where

  infix 1 _⊢_⦂_
  infixl 4 _,,_

  data Term : Type ℓ
  Ctxt : Type ℓ
  Ctxt = List Term

  data ok-U : Ctxt → Type ℓ
  data _⊢is-U_ : Ctxt → Term → Type ℓ

  data _⊢ok-L_ : Ctxt → Ctxt → Type ℓ
  data _⊢is-L_ : Ctxt → Term → Type ℓ

  data _⊢_⦂_ : Ctxt → Term → Term → Type ℓ

  private variable
    Γ Δ : Ctxt
    A B a b f : Term

  -- data SortU where
  --   U : SortU n
  --   L : Term → SortU
  --   ⊤U ⊥U : SortU
  --   _⟶U_ _+U_ : SortU → SortU → SortU
  --   ΠU ΣU : SortU → ? → SortU

  data Term where
    U : Nat → Term
    L : Term → Term
    UVar LVar : Nat → Term

    -- Nonlinear types
    ⊤U ⊥U : Term
    ΠU ΣU : Term → Term → Term
    _+U_ : Term → Term → Term
    _×_ : Term → Term → Term

    -- Nonlinear values
    tt : Term
    _,_ : Term → Term → Term
    πl πr : Term → Term
    inl⟨·⟩⟨_⟩_ inr⟨_⟩⟨·⟩_ : Term → Term → Term
    fun⟨_⟩⟨_⟩_ : Term → Term → Term → Term
    _ap_ : Term → Term → Term

  sub : Term → Nat → Term → Term
  sub (U n) k x = U n
  sub (L A) k x = L (sub A k x)
  sub (UVar n) k x = n ≟ k & Dec.rec {!!} {!!}
  sub (LVar n) k x = {!!}
  sub ⊤U k x = {!!}
  sub ⊥U k x = {!!}
  sub (ΠU A B) k x = {!!}
  sub (ΣU A B) k x = {!!}
  sub (A +U B) k x = {!!}
  sub tt k x = {!!}
  sub (a , b) k x = {!!}
  sub (πl a) k x = {!!}
  sub (πr a) k x = {!!}
  sub (inl⟨·⟩⟨ B ⟩ a) k x = {!!}
  sub (inr⟨ A ⟩⟨·⟩ b) k x = {!!}
  sub (fun⟨ A ⟩⟨ B ⟩ f) k x = {!!}
  sub (a ap b) k x = {!!}

  data ok-U where
    instance
      nil-ok :
        ok-U []
      cons-ok :
        {{_ : ok-U Γ}}
        {{_ : Γ ⊢is-U A}}
        →
        ok-U (A ∷ Γ)

  data _⊢is-U_ where
    instance
      is-u :
        {n : Nat}
        {{_ : Γ ⊢ A ⦂ U n}}
        →
        Γ ⊢is-U A

  data _⊢ok-L_ where
    instance
      nil-ok :
        Γ ⊢ok-L []
      cons-ok :
        {{_ : Γ ⊢ok-L Δ}}
        {{_ : Γ ⊢is-L A}}
        →
        Γ ⊢ok-L (A ∷ Δ)

  data _⊢is-L_ where
    instance
      is-l :
        {B : Term}
        {{_ : Γ ⊢ A ⦂ L B}}
        →
        Γ ⊢is-L A

  data _⊢_⦂_ where
    instance
      -- Nonlinear type well-formedness
      U-is-U :
        {{_ : ok-U Γ}}
        →
        Γ ⊢ U n ⦂ U (suc n)
      L-is-U :
        {{_ : ok-U Γ}}
        {{_ : Γ ⊢ A ⦂ U n}}
        →
        Γ ⊢ L A ⦂ U (suc n)
      ⊤-is-U :
        {{_ : ok-U Γ}}
        →
        Γ ⊢ ⊤U ⦂ U n
      ⊥-is-U :
        {{_ : ok-U Γ}}
        →
        Γ ⊢ ⊥U ⦂ U n
      Π-is-U :
        {{_ : ok-U Γ}}
        {{_ : Γ ⊢ A ⦂ U n}}
        {{_ : A ∷ Γ ⊢ B ⦂ U n}}
        →
        Γ ⊢ ΠU A B ⦂ U n
      Σ-is-U :
        {{_ : ok-U Γ}}
        {{_ : Γ ⊢ A ⦂ U n}}
        {{_ : A ∷ Γ ⊢ B ⦂ U n}}
        →
        Γ ⊢ ΣU A B ⦂ U n
      +-is-U :
        {{_ : ok-U Γ}}
        {{_ : Γ ⊢ A ⦂ U n}}
        {{_ : Γ ⊢ B ⦂ U n}}
        →
        Γ ⊢ A +U B ⦂ U n

      -- Nonlinear typing
      UVar-zero :
        {{_ : ok-U (A ∷ Γ)}}
        →
        A ∷ Γ ⊢ UVar zero ⦂ A
      UVar-suc :
        {{_ : ok-U (B ∷ Γ)}}
        {{_ : Γ ⊢ UVar n ⦂ A}}
        →
        B ∷ Γ ⊢ UVar (suc n) ⦂ A
      ⊤-intro :
        {{_ : ok-U Γ}}
        →
        Γ ⊢ tt ⦂ ⊤U
      Σ-intro :
        {{_ : ok-U (A ∷ Γ)}}
        {{_ : Γ ⊢ a ⦂ A}}
        {{_ : A ∷ Γ ⊢ b ⦂ B}}
        →
        Γ ⊢ a , b ⦂ ΣU A B
      Σ-elim-l :
        {{_ : ok-U Γ}}
        {{_ : Γ ⊢ a ⦂ ΣU A B}}
        →
        Γ ⊢ πl a ⦂ A
      Σ-elim-r :
        {{_ : ok-U Γ}}
        {{_ : Γ ⊢ a ⦂ ΣU A B}}
        →
        Γ ⊢ πr a ⦂ {!!}
      fun-is-Π :
        {{_ : ok-U (A ∷ Γ)}}
        {{_ : A ∷ Γ ⊢ B ⦂ U n}}
        {{_ : A ∷ Γ ⊢ b ⦂ B}}
        →
        Γ ⊢ fun⟨ A ⟩⟨ B ⟩ b ⦂ ΠU A B

  --   data _⊢_⦂_ where
  --     instance
  --       Var-zero :
  --         Γ ,, A ⊢ Var zero ⦂ A
  --       Var-suc :
  --         {{_ : Γ ⊢ Var n ⦂ A}}
  --         →
  --         Γ ,, B ⊢ Var (suc n) ⦂ A
  --       U-is-U :
  --         Γ ⊢ U n ⦂ U (suc n)
  --       Char-is-U :
  --         Γ ⊢ Char ⦂ U zero
  --       ⊤-is-U :
  --         Γ ⊢ ⊤U ⦂ U zero
  --       ⊥-is-U :
  --         Γ ⊢ ⊥Term ⦂ U zero
  --       ×-is-U :
  --         {{_ : Γ ⊢ A ⦂ U n}}
  --         {{_ : Γ ⊢ B ⦂ U n}}
  --         →
  --         Γ ⊢ A ×Term B ⦂ U n
  --       +-is-U :
  --         {{_ : Γ ⊢ A ⦂ U n}}
  --         {{_ : Γ ⊢ B ⦂ U n}}
  --         →
  --         Γ ⊢ A +Term B ⦂ U n
  --       ⟶-is-U :
  --         {{_ : Γ ⊢ A ⦂ U n}}
  --         {{_ : Γ ⊢ B ⦂ U n}}
  --         →
  --         Γ ⊢ A ⟶Term B ⦂ U n
  --       tt-is-⊤ :
  --         Γ ⊢ tt ⦂ ⊤Term
  --       ,-is-× :
  --         {{_ : Γ ⊢ a ⦂ A}}
  --         {{_ : Γ ⊢ b ⦂ B}}
  --         →
  --         Γ ⊢ a , b ⦂ A ×Term B
  --       inl-is-+ :
  --         {{_ : Γ ⊢ a ⦂ A}}
  --         →
  --         Γ ⊢ inl⟨·⟩⟨ B ⟩ a ⦂ A +Term B
  --       inr-is-+ :
  --         {{_ : Γ ⊢ b ⦂ B}}
  --         →
  --         Γ ⊢ inr⟨ A ⟩⟨·⟩ b ⦂ A +Term B
  --       ƛ-is-⟶ :
  --         {{_ : Γ ,, A ⊢ b ⦂ B}}
  --         →
  --         Γ ⊢ ƛ⟨ A ⟩ b ⦂ A ⟶Term B
  --       ap-is-ret :
  --         {{_ : Γ ⊢ f ⦂ A ⟶Term B}}
  --         {{_ : Γ ⊢ a ⦂ A}}
  --         →
  --         Γ ⊢ f ap a ⦂ B


  -- module Lin where
  --   infix 1 _∣_⊢_⦂_
  --   infixl 4 _,,_

  --   infixl 10 _⊗_
  --   infixl 9 _⊕_

  --   data Term : Type ℓ
  --   data Ctxt : Type ℓ
  --   data _∣_⊢_⦂_ : U.Ctxt → Ctxt → Term → Term → Type ℓ

  --   private variable
  --     Γ : U.Ctxt
  --     A B : U.Term
  --     Δ Δ' : Ctxt
  --     e e' G H : Term
  --     c : Σ₀

  --   data Term where
  --     Lin : U.Term → Term
  --     Lit : Σ₀ → Term
  --     _⊗_ _⊕_ : Term → Term → Term
  --     lit : Σ₀ → Term

  --   data Ctxt where
  --     · : Ctxt
  --     [_] : Term → Ctxt
  --     _,,_ : Ctxt → Ctxt → Ctxt

  --   data _∣_⊢_⦂_ where
  --     instance
  --       Lit-is-Lin :
  --         {c : Σ₀}
  --         →
  --         Γ ∣ Δ ⊢ Lit c ⦂ Lin U.Char
  --       ⊗-is-Lin :
  --         {{_ : Γ ∣ Δ ⊢ G ⦂ Lin A}}
  --         {{_ : Γ ∣ Δ' ⊢ H ⦂ Lin B}}
  --         →
  --         Γ ∣ Δ ⊢ G ⊗ H ⦂ Lin (A U.×Term B)
  --       ⊕-is-Lin :
  --         {{_ : Γ ∣ Δ ⊢ G ⦂ Lin A}}
  --         {{_ : Γ ∣ Δ ⊢ H ⦂ Lin B}}
  --         →
  --         Γ ∣ Δ ⊢ G ⊕ H ⦂ Lin (A U.+Term B)
  --       lit-is-Lit :
  --         Γ ∣ [ lit c ] ⊢ lit c ⦂ Lit c
  --       ⊗-is-⊗ :
  --         {{_ : Γ ∣ Δ ⊢ e ⦂ G}}
  --         {{_ : Γ ∣ Δ' ⊢ e' ⦂ H}}
  --         →
  --         Γ ∣ Δ ,, Δ' ⊢ e ⊗ e' ⦂ G ⊗ H

