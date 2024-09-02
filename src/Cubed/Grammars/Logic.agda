module Cubed.Grammars.Logic where

open import Cubed.Prelude

open Notation using (_<>_ ; _<_ ; _>_)

private
  variable
    ℓ : Level
    n : Nat


module _ (Σ₀ : Type ℓ) where

  infix 1 _⊢_⦂_

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

  data Term where
    U : Nat → Term
    L : Term → Term
    UVar LVar : Nat → Term

    -- Nonlinear types
    ⊤ ⊥ : Term
    ΠU ΣU : Term → Term → Term
    _+_ : Term → Term → Term

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
  sub (UVar n) k x with n <> k
  ...                    | lt n<k = UVar n
  ...                    | eq n≡k = x
  sub (UVar (suc n)) k x | gt n>k = UVar n
  sub (LVar n) k x = LVar n
  sub ⊤ k x = ⊤
  sub ⊥ k x = ⊥
  sub (ΠU A B) k x = ΠU (sub A k x) (sub B (suc k) x)
  sub (ΣU A B) k x = ΣU (sub A k x) (sub B (suc k) x)
  sub (A + B) k x = (sub A k x) + (sub B k x)
  sub tt k x = tt
  sub (a , b) k x = (sub a k x) , (sub b k x)
  sub (πl a) k x = πl (sub a k x)
  sub (πr a) k x = πr (sub a k x)
  sub (inl⟨·⟩⟨ B ⟩ a) k x = inl⟨·⟩⟨ sub B k x ⟩ sub a k x
  sub (inr⟨ A ⟩⟨·⟩ b) k x = inr⟨ sub A k x ⟩⟨·⟩ sub b k x
  sub (fun⟨ A ⟩⟨ B ⟩ f) k x = fun⟨ sub A k x ⟩⟨ sub B (suc k) x ⟩ sub f (suc k) x
  sub (a ap b) k x = (sub a k x) ap (sub b k x)

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
        Γ ⊢ ⊤ ⦂ U n
      ⊥-is-U :
        {{_ : ok-U Γ}}
        →
        Γ ⊢ ⊥ ⦂ U n
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
        Γ ⊢ A + B ⦂ U n

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
        Γ ⊢ tt ⦂ ⊤
      Σ-intro :
        {{_ : ok-U (A ∷ Γ)}}
        {{_ : Γ ⊢ a ⦂ A}}
        {{_ : Γ ⊢ b ⦂ sub B zero a}}
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
        Γ ⊢ πr a ⦂ sub B zero (πl a)
      Π-intro :
        {{_ : ok-U (A ∷ Γ)}}
        {{_ : A ∷ Γ ⊢ B ⦂ U n}}
        {{_ : A ∷ Γ ⊢ b ⦂ B}}
        →
        Γ ⊢ fun⟨ A ⟩⟨ B ⟩ b ⦂ ΠU A B
      Π-elim :
        {{_ : ok-U Γ}}
        {{_ : Γ ⊢ f ⦂ ΠU A B}}
        {{_ : Γ ⊢ a ⦂ A}}
        →
        Γ ⊢ f ap a ⦂ sub a zero B
      +-intro-l :
        {{_ : ok-U Γ}}
        {{_ : Γ ⊢ a ⦂ A}}
        {{_ : Γ ⊢ B ⦂ U n}}
        →
        Γ ⊢ inl⟨·⟩⟨ B ⟩ a ⦂ A + B
      +-intro-r :
        {{_ : ok-U Γ}}
        {{_ : Γ ⊢ b ⦂ B}}
        {{_ : Γ ⊢ A ⦂ U n}}
        →
        Γ ⊢ inr⟨ A ⟩⟨·⟩ b ⦂ A + B

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

