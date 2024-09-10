module Cubed.Grammars.Logic2 where

open import Cubed.Prelude

open import Cubed.Data.Fin as Fin using (Fin ; zero ; suc)

private variable
  ℓ : Level

module _ (Σ₀ : Type ℓ) where
  interleaved mutual

    U-level = Nat

    data U-preterm : Type ℓ

    data U-ctxt : Type ℓ

    data U-is-type : U-ctxt → U-preterm → Type ℓ

    U-type : U-ctxt → Type ℓ
    U-type Γ = Σ U-preterm (U-is-type Γ)

    data _⊢_⦂_ : (Γ : U-ctxt) → U-preterm → U-type Γ → Type ℓ
    infix 5 _⊢_⦂_

    private variable
      Γ : U-ctxt
      n : Nat

    data U-preterm where
      Var : (Typ : U-preterm) (idx : Nat) → U-preterm
      U : U-level → U-preterm
      ⊤ ⊥ : U-preterm
      _+_ : U-preterm → U-preterm → U-preterm
      ΣU ΠU : U-preterm → U-preterm → U-preterm
      μ : U-preterm → U-preterm
      * : U-preterm
      -- [_] holds the type of the other side, for purposes of type inference
      inl[_] inr[_] : U-preterm → U-preterm → U-preterm

    -- If the preterm is a type, gives the level of the universe it lives in
    -- i.e. `Γ ⊢ A ⦂ U n` implies `n ≡ U-infer-prelevel`
    U-infer-prelevel : U-preterm → U-level
    U-infer-prelevel (Var A idx) = Nat.safe-pred (U-infer-prelevel A)
    U-infer-prelevel (U lev) = suc lev
    U-infer-prelevel ⊤ = zero
    U-infer-prelevel ⊥ = zero
    U-infer-prelevel (A + B) = Nat.max (U-infer-prelevel A) (U-infer-prelevel B)
    U-infer-prelevel (ΣU A B) = Nat.max (U-infer-prelevel A) (U-infer-prelevel B)
    U-infer-prelevel (ΠU A B) = Nat.max (U-infer-prelevel A) (U-infer-prelevel B)
    U-infer-prelevel (μ A) = U-infer-prelevel A
    U-infer-prelevel * = zero
    U-infer-prelevel (inl[ A ] B) = zero
    U-infer-prelevel (inr[ A ] B) = zero

    -- If the preterm is a term, gives the type of the term
    -- i.e. `Γ ⊢ A ⦂ B` implies `B ≡ U-infer-pretype A` (and that `U-infer-pretype A` really is a type)
    U-infer-pretype : U-preterm → U-preterm
    U-infer-pretype (Var Typ idx) = Typ
    U-infer-pretype A@(U lev) = U (U-infer-prelevel A)
    U-infer-pretype A@⊤ = U (U-infer-prelevel A)
    U-infer-pretype A@⊥ = U (U-infer-prelevel A)
    U-infer-pretype A@(B + C) = U (U-infer-prelevel A)
    U-infer-pretype A@(ΣU B C) = U (U-infer-prelevel A)
    U-infer-pretype A@(ΠU B C) = U (U-infer-prelevel A)
    U-infer-pretype A@(μ B) = U (U-infer-prelevel A)
    U-infer-pretype * = ⊤
    U-infer-pretype (inl[ A ] B) = U-infer-pretype B + A
    U-infer-pretype (inr[ A ] B) = A + U-infer-pretype B

    U-is-term : U-ctxt → U-preterm → Type ℓ
    U-is-term Γ A = Σ[ A-has-type ∈ U-is-type Γ (U-infer-pretype A) ] Γ ⊢ A ⦂ (_ , A-has-type)

    data U-ctxt where
      · : U-ctxt
      _⨟_ : (Γ : U-ctxt) → U-type Γ → U-ctxt

    data U-is-type where
      U : {Γ : U-ctxt} {lev : U-level} →
        U-is-type Γ (U lev)
      ⦂U : {Γ : U-ctxt} (A : U-preterm) →
        Γ ⊢ A ⦂ (U (U-infer-prelevel A) , U) →
        U-is-type Γ A

    U-ext-is-type : (Γ : U-ctxt) (Ext : U-type Γ) (A : U-preterm) →
      U-is-type Γ A → U-is-type (Γ ⨟ Ext) A

    U-ext : (A : U-type Γ) {B : U-type Γ} → U-type (Γ ⨟ B)
    U-ext (Var A-preterm idx , ⦂U .(Var A-preterm idx) pf) = (Var A-preterm (suc idx)) , {!!}
    U-ext (U x , A-is-type) = U x , U
    U-ext (⊤ , A-is-type) = U zero , U
    U-ext (⊥ , A-is-type) = U zero , U
    U-ext ((A-preterm + A-preterm₁) , A-is-type) = U zero , U
    U-ext (ΣU A-preterm A-preterm₁ , A-is-type) = U zero , U
    U-ext (ΠU A-preterm A-preterm₁ , A-is-type) = U zero , U
    U-ext (μ A-preterm , A-is-type) = U zero , U
    U-ext (* , A-is-type) = U zero , U
    U-ext (inl[ A-preterm ] A-preterm₁ , A-is-type) = U zero , U
    U-ext (inr[ A-preterm ] A-preterm₁ , A-is-type) = U zero , U

    data _⊢_⦂_ where
      U : Γ ⊢ U n ⦂ (U (suc n) , U)
      Var-zero :
        {A : U-type Γ} →
        Γ ⨟ A ⊢ Var (A .fst) zero ⦂ (U zero , U)
      Var-suc :
        {A B : U-type Γ} →
        Γ ⊢ Var (A .fst) n ⦂ A →
        Γ ⨟ B ⊢ Var (A .fst) (suc n) ⦂ (U n , U)
      ⊤ : Γ ⊢ ⊤ ⦂ (U zero , U)
      ⊥ : Γ ⊢ ⊥ ⦂ (U zero , U)
      _+_ :
        {Γ : U-ctxt} {A B : U-preterm} →
        (A-is-type : U-is-type Γ A) →
        (B-is-type : U-is-type Γ B) →
        Γ ⊢ A + B ⦂ (U-infer-pretype (A + B) , U)
      ΣU :
        {Γ : U-ctxt} {A B : U-preterm} →
        (A-is-type : U-is-type Γ A) →
        (B-is-type : U-is-type (Γ ⨟ (A , A-is-type)) B) →
        Γ ⊢ ΣU A B ⦂ (U-infer-pretype (ΣU A B) , U)
      ΠU :
        {Γ : U-ctxt} {A B : U-preterm} →
        (A-is-type : U-is-type Γ A) →
        (B-is-type : U-is-type (Γ ⨟ (A , A-is-type)) B) →
        Γ ⊢ ΠU A B ⦂ (U-infer-pretype (ΠU A B) , U)
      --μ : ?
      * :
        {Γ : U-ctxt} →
        Γ ⊢ * ⦂ (⊤ , ⦂U ⊤ ⊤)
      inl :
        {Γ : U-ctxt} {A B : U-preterm} →
        (A-is-type : U-is-type Γ A) →
        (B-is-term : U-is-term Γ B) →
        Γ ⊢ inl[ A ] B ⦂ (U-infer-pretype (inl[ A ] B) , ⦂U (U-infer-pretype (inl[ A ] B)) (B-is-term .fst + A-is-type))
      inr :
        {Γ : U-ctxt} {A B : U-preterm} →
        (A-is-type : U-is-type Γ A) →
        (B-is-term : U-is-term Γ B) →
        Γ ⊢ inr[ A ] B ⦂ (U-infer-pretype (inr[ A ] B) , ⦂U (U-infer-pretype (inr[ A ] B)) (A-is-type + B-is-term .fst))

