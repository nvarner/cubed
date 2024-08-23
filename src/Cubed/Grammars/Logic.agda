module Cubed.Grammars.Logic where

open import Cubed.Prelude

private
  variable
    ℓ : Level
    n : Nat


module _ (Σ₀ : Type ℓ) where

  infix 4 _⦂_
  infix 3 _∋U_
  infix 4 _,_

  infix 3 _∣_
  infix 2 _⊢_

  data Term : Type ℓ
  data _⦂_ : Term → Term → Type ℓ

  private variable
    A B : Term

  data Term where
    U : Nat → Term
    Char : Term
    _×Term_ _+Term_ :
      (A B : Term)
      {{_ : A ⦂ U n}}
      {{_ : B ⦂ U n}} →
      Term
    Lin :
      (A : Term)
      {{_ : A ⦂ U n}} →
      Term
    Lit : Σ₀ → Term
    lit : Σ₀ → Term
    _⊗_ _⊕_ :
      (G H : Term)
      {{_ : A ⦂ U n}}
      {{_ : B ⦂ U n}}
      {{_ : G ⦂ Lin A}}
      {{_ : H ⦂ Lin B}} →
      Term

  -- private variable
  --   c : Σ₀
  --   g h G H : Term

  -- data _⦂_ where
  --   instance
  --     U-is-U :
  --       U n ⦂ U (suc n)
  --     Char-is-U :
  --       Char ⦂ U zero
  --     ×-is-U :
  --       {{_ : A ⦂ U n}}
  --       {{_ : B ⦂ U n}} →
  --       A ×Term B ⦂ U n
  --     +-is-U :
  --       {{_ : A ⦂ U n}}
  --       {{_ : B ⦂ U n}} →
  --       A +Term B ⦂ U n
  --     Lin-is-U :
  --       {{_ : A ⦂ U n}} →
  --       Lin A ⦂ U (suc n)
  --     Lit-is-Lin :
  --       Lit c ⦂ Lin Char
  --     ⊗-is-Lin :
  --       {{_ : A ⦂ U n}}
  --       {{_ : B ⦂ U n}}
  --       {{_ : G ⦂ Lin A}}
  --       {{_ : H ⦂ Lin B}} →
  --       G ⊗ H ⦂ Lin (A ×Term B)
  --     ⊕-is-Lin :
  --       {{_ : A ⦂ U n}}
  --       {{_ : B ⦂ U n}}
  --       {{_ : G ⦂ Lin A}}
  --       {{_ : H ⦂ Lin B}} →
  --       G ⊕ H ⦂ Lin (A +Term B)
  --     lit-is-Lit :
  --       lit c ⦂ Lit c

  -- UTerm : Nat → Type ℓ
  -- UTerm n = Σ[ A ∈ Term ] A ⦂ U n

  -- _⦂U_ : (A : Term) (n : Nat) {{_ : A ⦂ U n}} → UTerm n
  -- _⦂U_ A n {{A⦂Un}} = A , A⦂Un

  -- LinTerm : UTerm n → Type ℓ
  -- LinTerm A = Σ[ G ∈ Term ] G ⦂ (Lin (A .fst) {{A .snd}})

  -- _⦂Lin_ : (G : Term) (A : UTerm n) {{_ : G ⦂ Lin (A .fst) {{A .snd}}}} → LinTerm A
  -- _⦂Lin_ G A {{G⦂LinA}} = G , G⦂LinA

  -- data UCtxt : Type ℓ where
  --   · : UCtxt
  --   _,_ : UTerm n → UCtxt → UCtxt

  -- data LinCtxt : Type ℓ where
  --   · : LinCtxt
  --   _,_ : {A : UTerm n} → LinTerm A → LinCtxt → LinCtxt

  -- data Ctxt : Type ℓ where
  --   _∣_ : UCtxt → LinCtxt → Ctxt

  -- private variable
  --   Γ : UCtxt

  -- data _∋U_ {n : Nat} : UCtxt → UTerm n → Type ℓ where
  --   Z :
  --     {A : UTerm n} →
  --     A , Γ ∋U A

  --   S_ :
  --     {A : UTerm n} {m : Nat} {B : UTerm m} →
  --     Γ ∋U A →
  --     B , Γ ∋U A

