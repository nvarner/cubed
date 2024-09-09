module Cubed.Grammars.Logic2 where

open import Cubed.Prelude

open import Cubed.Data.Fin as Fin using (Fin ; zero ; suc)

private variable
  ℓ : Level

module _ (Σ₀ : Type ℓ) where
  interleaved mutual

    record U-level : Type lzero where
      eta-equality
      constructor mk
      field
        idx : Nat

    U-level-max : U-level → U-level → U-level
    U-level-max (mk m) (mk n) = mk (Nat.max m n)

    data U-preterm : Type ℓ

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

    data U-ctxt where
      · : U-ctxt
      _⨟_ : (Γ : U-ctxt) → U-type Γ → U-ctxt

    data U-preterm where
      Var : (idx : Nat) → U-preterm
      U : U-level → U-preterm
      ⊤ ⊥ : U-preterm
      _+_ : U-type Γ → U-type Γ → U-preterm
      ΣU ΠU : U-preterm → U-preterm → U-preterm
      μ : U-preterm → U-preterm

    data Is-U-type where
      U : {Γ : U-ctxt} (lev : U-level) →
        Is-U-type Γ (U lev)
      ⦂U : {Γ : U-ctxt} (A : U-preterm) (lev : U-level) →
        Γ ⊢ A ⦂ (U lev , U lev) →
        Is-U-type Γ A

    Is-U-type→U-level (U lev) = lev
    Is-U-type→U-level (⦂U A lev pf) = lev

    U-ext-is-type : (Γ : U-ctxt) (Ext : U-type Γ) (A : U-preterm) →
      Is-U-type Γ A → Is-U-type (Γ ⨟ Ext) A

    U-ext-type : (A : U-type Γ) {B : U-type Γ} → U-type (Γ ⨟ B)
    U-ext-type (A-preterm , A-is-type) = A-preterm , U-ext-is-type _ _ A-preterm A-is-type

    data _⊢_⦂_ where
      U : Γ ⊢ U (mk n) ⦂ (U (mk (suc n)) , U (mk (suc n)))
      Var-zero :
        {A : U-type Γ} →
        Γ ⨟ A ⊢ Var zero ⦂ U-ext-type A
      Var-suc :
        {A B : U-type Γ} →
        Γ ⊢ Var n ⦂ A →
        Γ ⨟ B ⊢ Var n ⦂ U-ext-type A
      ⊤ : Γ ⊢ ⊤ ⦂ (U (mk zero) , U (mk zero))
      ⊥ : Γ ⊢ ⊥ ⦂ (U (mk zero) , U (mk zero))
      ΣU :
        {Γ : U-ctxt} {A B : U-preterm} →
        (A-is-type : Is-U-type Γ A) →
        (B-is-type : Is-U-type (Γ ⨟ (A , A-is-type)) B) →
        Γ ⊢ ΣU A B ⦂ (U (U-level-max (Is-U-type→U-level A-is-type) (Is-U-type→U-level B-is-type)) , U _)

    U-ext-is-type Γ Ext (U lev) is-type = U lev
    U-ext-is-type Γ Ext (Var idx) (⦂U .(Var idx) lev pf) = ⦂U (Var idx) lev (Var-suc pf)
    U-ext-is-type Γ Ext ⊤ (⦂U .⊤ .(mk zero) ⊤) = ⦂U ⊤ (mk zero) ⊤
    U-ext-is-type Γ Ext ⊥ (⦂U .⊥ .(mk zero) ⊥) = ⦂U ⊥ (mk zero) ⊥
    U-ext-is-type Γ Ext (ΣU A B) (⦂U .(ΣU A B) lev (ΣU A-is-type B-is-type)) =
      ⦂U (ΣU A B) {!!} (ΣU (U-ext-is-type Γ Ext A A-is-type) {!!})
    U-ext-is-type Γ Ext (ΠU A A₁) is-type = {!!}
    U-ext-is-type Γ Ext (A + A₁) is-type = {!!}
    U-ext-is-type Γ Ext (μ A) is-type = {!!}

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
