module Cubed.Grammars.Logic2 where

open import Cubed.Prelude

open import Cubed.Data.Fin as Fin using (Fin ; zero ; suc)

private variable
  ℓ : Level

module _ (Σ₀ : Type ℓ) where
  interleaved mutual

    U-level = Nat

    data U-preterm : Type ℓ
    data U-pretype : Type ℓ

    data U-ctxt : Type ℓ

    data Is-U-type : U-ctxt → U-preterm → Type ℓ
    Is-U-type→U-level : {Γ : U-ctxt} {A : U-preterm} → Is-U-type Γ A → U-level

    U-type : U-ctxt → Type ℓ
    U-type Γ = Σ U-preterm (Is-U-type Γ)
    U-type→U-level : {Γ : U-ctxt} → U-type Γ → U-level
    U-type→U-level (_ , is-type) = Is-U-type→U-level is-type

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

    data U-ctxt where
      · : U-ctxt
      _⨟_ : (Γ : U-ctxt) → U-type Γ → U-ctxt

    data Is-U-type where
      U : {Γ : U-ctxt} {lev : U-level} →
        Is-U-type Γ (U lev)
      ⦂U : {Γ : U-ctxt} (A : U-preterm) →
        Γ ⊢ A ⦂ (U (U-infer-prelevel A) , U) →
        Is-U-type Γ A

    Is-U-type→U-level (U {lev = lev}) = lev
    Is-U-type→U-level (⦂U A pf) = U-infer-prelevel A

    U-ext-is-type : (Γ : U-ctxt) (Ext : U-type Γ) (A : U-preterm) →
      Is-U-type Γ A → Is-U-type (Γ ⨟ Ext) A

    U-ext-type : (A : U-type Γ) {B : U-type Γ} → U-type (Γ ⨟ B)
    U-ext-type (A-preterm , A-is-type) = A-preterm , U-ext-is-type _ _ A-preterm A-is-type

    data _⊢_⦂_ where
      U : Γ ⊢ U n ⦂ (U (suc n) , U)
      Var-zero :
        {A : U-type Γ} →
        Γ ⨟ A ⊢ Var (A .fst) zero ⦂ U-ext-type A
      Var-suc :
        {A B : U-type Γ} →
        Γ ⊢ Var (A .fst) n ⦂ A →
        Γ ⨟ B ⊢ Var (A .fst) n ⦂ U-ext-type A
      ⊤ : Γ ⊢ ⊤ ⦂ (U zero , U)
      ⊥ : Γ ⊢ ⊥ ⦂ (U zero , U)
      ΣU :
        {Γ : U-ctxt} {A B : U-preterm} →
        (A-is-type : Is-U-type Γ A) →
        (B-is-type : Is-U-type (Γ ⨟ (A , A-is-type)) B) →
        Γ ⊢ ΣU A B ⦂ (U (Nat.max (Is-U-type→U-level A-is-type) (Is-U-type→U-level B-is-type)) , U)

    U-ext-is-type Γ Ext (U lev) is-type = U
    U-ext-is-type Γ Ext (Var Typ idx) (⦂U .(Var Typ idx) pf) = ⦂U (Var Typ idx) {!Var-suc ?!}
    U-ext-is-type Γ Ext ⊤ (⦂U .⊤ ⊤) = ⦂U ⊤ ⊤
    U-ext-is-type Γ Ext ⊥ (⦂U .⊥ ⊥) = ⦂U ⊥ ⊥
    U-ext-is-type Γ Ext (ΣU A B) (⦂U .(ΣU A B) pf) = {!!}
    U-ext-is-type Γ Ext (ΠU A A₁) is-type = {!!}
    U-ext-is-type Γ Ext (A + A₁) is-type = {!!}
    U-ext-is-type Γ Ext (μ A) is-type = {!!}
    U-ext-is-type Γ Ext (inl[ A ] B) is-type = {!!}
    U-ext-is-type Γ Ext (inr[ A ] B) is-type = {!!}
    U-ext-is-type Γ Ext * is-type = {!!}

  -- data Ctxt : Type ℓ
  -- -- `UTerm Γ lev` is a well-formed term in context `Γ` and has type with level `lev`
  -- data UTerm : Ctxt → (lev : Nat) → Type ℓ
  -- data Is-UType : (Γ : Ctxt) {lev : Nat} → UTerm Γ lev → Type ℓ
  -- --Is-strictly-positive : ∀ {Γ} {lev} → UType Γ lev → Type ℓ

  -- UType : Ctxt → (lev : Nat) → Type ℓ
  -- UType Γ lev = Σ[ term ∈ UTerm Γ lev ] Is-UType term

  -- data Ctxt where
  --   · : Ctxt
  --   _⨟_,_ : (pred : Ctxt) {lev : Nat} → UTerm pred lev → Is-UType → Ctxt

  -- private variable
  --   lev lev' : Nat
  --   Γ : Ctxt






  -- data Ctxt : Type ℓ
  -- data UType : Ctxt → (lev : Nat) → Type ℓ
  -- Is-strictly-positive : ∀ {Γ} {lev} → UType Γ lev → Type ℓ

  -- data Ctxt where
  --   · : Ctxt
  --   _⨟_ : (pred : Ctxt) {lev : Nat} → UType pred lev → Ctxt

  -- private variable
  --   lev lev' : Nat
  --   Γ : Ctxt

  -- data UType where
  --   ⊤ : UType Γ zero
  --   ⊥ : UType Γ zero
  --   U : (lev : Nat) → UType Γ (suc lev)
  --   ΣU ΠU : (A : UType Γ lev) → UType (Γ ⨟ A) lev' → UType Γ (Nat.max lev lev')
  --   _+_ : UType Γ lev → UType Γ lev' → UType Γ (Nat.max lev lev')
  --   μ : (A : UType (Γ ⨟ U lev) lev) → Is-strictly-positive A → UType Γ lev

  -- data UTerm : (Γ : Ctxt) → {lev : Nat} → UType Γ lev → Type ℓ where
  --   * : UTerm Γ ⊤
