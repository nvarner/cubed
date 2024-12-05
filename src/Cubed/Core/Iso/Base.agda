open import Cubed.Core.Primitives
open import Cubed.Core.Types.Base
open import Cubed.Core.Fun.Base as Fun
open import Cubed.Core.Path as Path using (refl; Square)
import Cubed.Core.Square as Square
open import Cubed.Core.Equiv.Base as Equiv using (_≃_; Is-equiv; equiv-proof)
open import Cubed.Core.HLevel.Base

open import Cubed.Core.Canonical

module Cubed.Core.Iso.Base where

private variable
  ℓ ℓ' : Level
  A B C : Type _
  f : A → B


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


module _ where
  open Is-iso

  inv-is-iso : (f-is-iso : Is-iso f) → Is-iso (inv f-is-iso)
  inv-is-iso {f = f} f-is-iso .inv = f
  inv-is-iso f-is-iso .inv-r = f-is-iso .inv-l
  inv-is-iso f-is-iso .inv-l = f-is-iso .inv-r

  module _ {g : B → C} {f : A → B} where
    _∘-is-iso_ : Is-iso g → Is-iso f → Is-iso (g ∘ f)
    (f-iso ∘-is-iso g-iso) .inv = g-iso .inv ∘ f-iso .inv
    (f-iso ∘-is-iso g-iso) .inv-r c = Path.cong g (g-iso .inv-r (f-iso .inv c)) Path.∙ f-iso .inv-r c
    (f-iso ∘-is-iso g-iso) .inv-l a = Path.cong (g-iso .inv) (f-iso .inv-l (f a)) Path.∙ g-iso .inv-l a


  sym : (f : A ≅ B) → B ≅ A
  sym f = f .snd .inv , inv-is-iso (f .snd)

  _∘-iso_ : (g : B ≅ C) (f : A ≅ B) → A ≅ C
  g ∘-iso f = (g .fst ∘ f .fst) , (g .snd ∘-is-iso f .snd)

  _∙_ : (f : A ≅ B) (g : B ≅ C) → A ≅ C
  _∙_ = Fun.flip _∘-iso_


module _
  {f : A → B}
  (f-is-iso : Is-iso f)
  where

  open Is-iso f-is-iso

  private module _ (y : B) (x0 x1 : A) (p0 : f x0 ≡ y) (p1 : f x1 ≡ y) where
    opaque
      unfolding Path.cong

      q0 : inv y ≡ x0
      q0 = Path.cong inv (Path.sym p0) Path.∙ inv-l x0

      fill0 : Square refl (inv-l x0) (Path.cong inv (Path.sym p0)) q0
      fill0 = Square.flip (Path.∙.filler (Path.cong inv (Path.sym p0)) (inv-l x0))

      q1 : inv y ≡ x1
      q1 = Path.cong inv (Path.sym p1) Path.∙ inv-l x1

      fill1 : Square refl (inv-l x1) (Path.cong inv (Path.sym p1)) q1
      fill1 = Square.flip (Path.∙.filler (Path.cong inv (Path.sym p1)) (inv-l x1))

      q : x0 ≡ x1
      q i = hcomp
        (λ k → λ where
          (i = i0) → q0 k
          (i = i1) → q1 k)
        (inv y)

      fill2 : Square q0 q1 refl q
      fill2 i j = hfill
        (λ k → λ where
          (i = i0) → q0 k
          (i = i1) → q1 k)
        (inS (inv y))
        j

      sq : Square (Path.cong inv (Path.sym p0)) (Path.cong inv (Path.sym p1)) refl (Path.cong (inv ∘ f) q)
      sq i j = hcomp
        (λ k → λ where
          (i = i0) → fill0 j (~ k)
          (i = i1) → fill1 j (~ k)
          (j = i0) → inv y
          (j = i1) → Path.cong inv-l q i (~ k))
        (fill2 i j)

      sq1 : Square (Path.sym p0) (Path.sym p1) refl (Path.cong f q)
      sq1 i j = hcomp
        (λ k → λ where
          (i = i0) → Path.cong inv-r (Path.sym p0) j k
          (i = i1) → Path.cong inv-r (Path.sym p1) j k
          (j = i0) → inv-r y k
          (j = i1) → Path.cong (inv-r ∘ f) q i k)
        (Square.cong f sq i j)

      lemma : (x0 , p0) ≡ (x1 , p1)
      lemma = Σ≡ q (Square.flip-v sq1)

  Is-iso→Is-equiv : Is-equiv f
  Is-iso→Is-equiv .equiv-proof y = mk-is-contr
    (inv y , inv-r y)
    (λ (x , x∈fiber) → lemma y x (inv y) x∈fiber (inv-r y))

instance
  inst-Is-iso→Is-equiv : {f : A → B} {{f-is-iso : Is-iso f}} → Is-equiv f
  inst-Is-iso→Is-equiv {{f-is-iso}} = Is-iso→Is-equiv f-is-iso

≅→≃ : (f : A ≅ B) → A ≃ B
≅→≃ f = (f .fst) , Is-iso→Is-equiv (f .snd)

open Is-iso

Is-equiv→Is-iso : (f-is-equiv : Is-equiv f) → Is-iso f
Is-equiv→Is-iso f-is-equiv .inv = Equiv.inv (_ , f-is-equiv)
Is-equiv→Is-iso f-is-equiv .inv-r = Equiv.inv-r (_ , f-is-equiv)
Is-equiv→Is-iso f-is-equiv .inv-l = Equiv.inv-l (_ , f-is-equiv)

instance
  inst-Is-equiv→Is-iso : {{f-is-equiv : Is-equiv f}} → Is-iso f
  inst-Is-equiv→Is-iso {{f-is-equiv}} = Is-equiv→Is-iso f-is-equiv

≃→≅ : (f : A ≃ B) → A ≅ B
≃→≅ f = (f .fst) , Is-equiv→Is-iso (f .snd)

