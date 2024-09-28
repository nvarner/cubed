open import Cubed.Core.Primitives
open import Cubed.Core.Types
open import Cubed.Core.Functions
open import Cubed.Core.Path
open import Cubed.Core.HLevel.Base

open import Cubed.Core.Canonical

module Cubed.Core.Iso.Base where

private variable
  ℓ ℓ' : Level
  A B C : Type _


record Is-iso (f : A → B) : Type (level A ⊔ level B) where
  constructor mk-iso
  no-eta-equality
  field
    inv : B → A
    inv-r : Is-right-inv f inv
    inv-l : Is-left-inv f inv

infixr 4 _≅_
_≅_ : Type ℓ → Type ℓ' → Type (ℓ ⊔ ℓ')
A ≅ B = Σ (A → B) Is-iso


module _
  {f : A → B}
  (f-is-iso : Is-iso f)
  where

  open Is-iso f-is-iso

  private module _ (y : B) (x0 x1 : A) (p0 : f x0 ≡ y) (p1 : f x1 ≡ y) where
    q0 : inv y ≡ x0
    q0 = cong inv (sym p0) ∙ inv-l x0

    q0-fill : Square (cong inv (sym p0)) q0 refl (inv-l x0)
    q0-fill = ∙.filler (cong inv (sym p0)) (inv-l x0)

    q1 : inv y ≡ x1
    q1 = cong inv (sym p1) ∙ inv-l x1

    q1-fill : Square (cong inv (sym p1)) q1 refl (inv-l x1)
    q1-fill = ∙.filler (cong inv (sym p1)) (inv-l x1)

    q : x0 ≡ x1
    q = sym q0 ∙ q1

    q-fill : Square q1 q q0 refl
    q-fill = ∙.filler' (sym q0) q1

    goal : Square p0 p1 (cong f q) refl
    goal = {!!}

    lem : (x0 , p0) ≡ (x1 , p1)
    lem = Σ≡ q ?

open Is-iso

module _ {f : A → B} {g : B → C} where
  _∘-is-iso_ : Is-iso g → Is-iso f → Is-iso (g ∘ f)
  (f-iso ∘-is-iso g-iso) .inv = g-iso .inv ∘ f-iso .inv
  (f-iso ∘-is-iso g-iso) .inv-r c = cong g (g-iso .inv-r (f-iso .inv c)) ∙ f-iso .inv-r c
  (f-iso ∘-is-iso g-iso) .inv-l a = cong (g-iso .inv) (f-iso .inv-l (f a)) ∙ g-iso .inv-l a

