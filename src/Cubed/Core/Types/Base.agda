open import Cubed.Core.Primitives
open import Cubed.Core.Path
import Cubed.Core.Builtin as Builtin
import Cubed.Core.Notation as Notation

module Cubed.Core.Types.Base where

private
  variable
    ℓ ℓ' : Level
    A A' A'' : Type ℓ
    B B' : A → Type ℓ
    C : (a : A) → B a → Type ℓ

open Builtin.Unit public using (Unit ; tt)
⊤ : Type lzero
⊤ = Unit

data Empty : Type lzero where
⊥ : Type lzero
⊥ = Empty

infix 3 ¬_
¬_ : Type ℓ → Type ℓ
¬ A = A → ⊥

open Builtin.Sigma public

module _
  {A : I → Type ℓ}
  {B : (i : I) → A i → Type ℓ'}
  {x : Σ (A i0) (B i0)} {y : Σ (A i1) (B i1)}
  where

  Σ≡ :
    (p : A [ fst x ≡ fst y ]) →
    (λ i → B i (p i)) [ snd x ≡ snd y ] →
    (λ i → Σ (A i) (B i)) [ x ≡ y ]
  Σ≡ p q i = p i , q i

infixr 5 _×_
_×_ : Type ℓ → Type ℓ' → Type (ℓ ⊔ ℓ')
A × A' = Σ A (λ _ → A')

×≡ : {x : A × A'} {y : A × A'} → fst x ≡ fst y → snd x ≡ snd y → x ≡ y
×≡ = Σ≡

record Lift (A : Type ℓ) : Type (ℓ ⊔ ℓ') where
  constructor lift
  field
    lower : A

open Lift public

instance
  inst-⊤ : Notation.⊤-notation (Type lzero)
  inst-⊤ = Notation.mk ⊤

  inst-⊥ : Notation.⊥-notation (Type lzero)
  inst-⊥ = Notation.mk ⊥

  inst-× : Notation.×-notation (Type ℓ) (Type ℓ') (Type (ℓ ⊔ ℓ'))
  inst-× = Notation.mk _×_

