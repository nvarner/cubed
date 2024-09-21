open import Cubed.Core.Prelude


module Cubed.Algebra.Op.Base where

private variable
  ℓ : Level
  A : Type _

Op-on : Type ℓ → Type ℓ
Op-on A = A → A → A

record Is-unital (_*_ : Op-on A) : Type (level A) where
  constructor mk-is-unital
  field
    e : A
    id-l : ∀ a → e * a ≡ a
    id-r : ∀ a → a * e ≡ a

record Is-assoc (_*_ : Op-on A) : Type (level A) where
  constructor mk-is-assoc
  field
    assoc : ∀ x y z → (x * y) * z ≡ x * (y * z)

record Is-inv (_*_ : Op-on A) (*-is-unital : Is-unital _*_) : Type (level A) where
  constructor mk-is-inv

  open Is-unital *-is-unital

  field
    inv : A → A
    inv-l : ∀ a → inv a * a ≡ e
    inv-r : ∀ a → a * inv a ≡ e

record Is-comm (_*_ : Op-on A) : Type (level A) where
  constructor mk-is-comm
  field
    comm : ∀ x y → x * y ≡ y * x

