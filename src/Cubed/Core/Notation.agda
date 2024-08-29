module Cubed.Core.Notation where

open import Cubed.Core.Primitives

private
  variable
    ℓ ℓ' : Level


module _
  (op : Level → Level)
  (A : (ℓ : Level) → Type (op ℓ))
  where

  record ⊤-notation : Typeω where
    field
      ⊤ : A ℓ

  open ⊤-notation {{...}} public


  record ⊥-notation : Typeω where
    field
      ⊥ : A ℓ

  open ⊥-notation {{...}} public


  record ×-notation : Typeω where
    field
      op2 : Level → Level → Level
      _×_ : A ℓ → A ℓ' → A (op2 ℓ ℓ')
    infixr 5 _×_

  open ×-notation {{...}} public hiding (op2)


module _ (A : Type ℓ) where

  record <>-notation : Typeω where
    field
      ℓout : Level
      Out : A → A → Type ℓout
      _<>_ : (a b : A) → Out a b

  open <>-notation {{...}} public hiding (ℓout ; Out)


  record <-notation : Typeω where
    field
      ℓout : Level
      _<_ : A → A → Type ℓout
    infix 4 _<_

  open <-notation {{...}} public hiding (ℓout)


  record ≤-notation : Typeω where
    field
      ℓout : Level
      _≤_ : A → A → Type ℓout
    infix 4 _≤_

  open ≤-notation {{...}} public hiding (ℓout)


  record >-notation : Typeω where
    field
      ℓout : Level
      _>_ : A → A → Type ℓout
    infix 4 _>_

  open >-notation {{...}} public hiding (ℓout)


  record ≥-notation : Typeω where
    field
      ℓout : Level
      _≥_ : A → A → Type ℓout
    infix 4 _≥_

  open ≥-notation {{...}} public hiding (ℓout)


  module strict-ord-from-<
    {ℓout : Level}
    (lt : A → A → Type ℓout)
    where

    < : <-notation
    < = record { ℓout = ℓout ; _<_ = lt }

    > : >-notation
    > = record { ℓout = ℓout ; _>_ = (λ a b → lt b a) }


  module incl-ord-from-≤
    {ℓout : Level}
    (lte : A → A → Type ℓout)
    where

    ≤ : ≤-notation
    ≤ = record { ℓout = ℓout ; _≤_ = lte }

    ≥ : ≥-notation
    ≥ = record { ℓout = ℓout ; _≥_ = (λ a b → lte b a) }


{-# DISPLAY <-notation._<_ A a b = a < b #-}
{-# DISPLAY ≤-notation._≤_ A a b = a ≤ b #-}
{-# DISPLAY >-notation._>_ A a b = a > b #-}
{-# DISPLAY ≥-notation._≥_ A a b = a ≥ b #-}


record ⟦⟧-notation (A : Type ℓ) : Typeω where
  field
    ⟦⟧-ℓ : Level
    ⟦A⟧ : Type ⟦⟧-ℓ
    ⟦_⟧ : A → ⟦A⟧

open ⟦⟧-notation {{...}} public using (⟦_⟧)

