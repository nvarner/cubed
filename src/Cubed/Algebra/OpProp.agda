module Cubed.Algebra.OpProp where

open import Cubed.Core.Prelude

open import Cubed.Cat.Displayed

open Displayed
open Precat
open Notation using (_×_)


module test {ℓob ℓhom} (C : Precat ℓob ℓhom) where

  record Bin-op-on (a : ob C) : Type ℓob where
    constructor mk
    field


module _ (ℓ : Level) where

  record Bin-op-on (A : Type ℓ) : Type ℓ where
    constructor binop
    field
      binop : A → A → A

  Bin-opᴰ : Displayed (Types ℓ) ℓ ℓ
  Bin-opᴰ .ob[_] = Bin-op-on
  Bin-opᴰ .hom[_] ϕ (binop f) (binop g) = ∀ x y → ϕ (f x y) ≡ g (ϕ x) (ϕ y)
  Bin-opᴰ .idᴰ x y = refl
  Bin-opᴰ .seqᴰ {f = ϕ} {g = ψ} {f} {g} {h}
    ϕ-hom ψ-hom x y = cong ψ (ϕ-hom x y) ∙ ψ-hom (ϕ x) (ϕ y)
  Bin-opᴰ .idᴰ-seqᴰ = funext (λ x → funext (λ y → ∙.id-l _))
  Bin-opᴰ .seqᴰ-idᴰ = funext (λ x → funext (λ y → ∙.id-r _))
  Bin-opᴰ .seqᴰ-assoc {f = ϕ} {g = ψ} {h = γ} {f} {g} {h} {k}
    ϕ-hom ψ-hom γ-hom = funext (λ x → funext (λ y →
        cong (_∙ _) (cong.along-∙ γ ∙ cong (_∙ _) (sym (cong.by-∘ γ ψ)))
        ∙ ∙.assoc _ _ _
      ))

  module Bin-op (bin-op : ob (∫ Bin-opᴰ)) where
    private
      A = bin-op .fst
      op = bin-op .snd .Bin-op-on.binop

    Carrier = A

    module N where
      · : Notation.·-notation A A A
      · .Notation.·-notation._·_ = op

      + : Notation.+-notation A A A
      + .Notation.+-notation._+_ = op

  open Bin-op

  module _ where
    open Notation

    Is-assocᴰ = PropertyOver (∫ Bin-opᴰ) (λ A →
      let instance _ = N.· A in
      (x y z : Carrier A) → (x · y) · z ≡ x · (y · z))

    Is-commᴰ = PropertyOver (∫ Bin-opᴰ) (λ A →
      let instance _ = N.· A in
      (x y : Carrier A) → x · y ≡ y · x)

    record Has-id (A : ob (∫ Bin-opᴰ)) : Type ℓ where
      instance _ = N.· A
      field
        e : Carrier A
        id-l : (a : Carrier A) → e · a ≡ a
        id-r : (a : Carrier A) → a · e ≡ a

    open Has-id

    Has-idᴰ : Displayed (∫ Bin-opᴰ) ℓ ℓ
    Has-idᴰ .ob[_] = Has-id
    Has-idᴰ .hom[_] {a = A} {B}
      (ϕ , ϕ-hom) A-has-id B-has-id = ϕ id-A ≡ id-B
      where
        open Has-id A-has-id renaming (e to id-A)
        open Has-id B-has-id renaming (e to id-B)
    Has-idᴰ .idᴰ = refl
    Has-idᴰ .seqᴰ {f = (ϕ , ϕ-hom)} {g = (ψ , ψ-hom)}
      ϕ-pres-id ψ-pres-id = cong ψ ϕ-pres-id ∙ ψ-pres-id
    Has-idᴰ .idᴰ-seqᴰ = ∙.id-l _
    Has-idᴰ .seqᴰ-idᴰ = ∙.id-r _
    Has-idᴰ .seqᴰ-assoc {f = (ϕ , ϕ-hom)} {g = (ψ , ψ-hom)} {h = (γ , γ-hom)}
      ϕ-pres-id ψ-pres-id γ-pres-id =
        cong (_∙ _) (
          cong.along-∙ γ
          ∙ cong (_∙ _) (sym (cong.by-∘ γ ψ))
        )
        ∙ ∙.assoc _ _ _

  Has-invᴰ = PropertyOver (∫ Has-idᴰ) (λ A →
    {!!})


private module _ (ℓ : Level) where

  Comm-semigroupᴰ = Is-assocᴰ ℓ ×ᴰ Is-commᴰ ℓ
  Comm-semigroup = ∫ Comm-semigroupᴰ

  Comm-monoidᴰ = Comm-semigroupᴰ ×ᴰ Has-idᴰ ℓ
  Comm-monoid = ∫ Comm-monoidᴰ

