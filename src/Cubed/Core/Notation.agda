module Cubed.Core.Notation where

open import Cubed.Core.Primitives

private
  variable
    ℓ ℓ' : Level


record ⊤-notation (A : Type ℓ) : Type ℓ where
  constructor mk
  field
    ⊤ : A

open ⊤-notation {{...}} public
{-# DISPLAY ⊤-notation A .⊤ = ⊤ #-}


record ⊥-notation (A : Type ℓ) : Type ℓ where
  constructor mk
  field
    ⊥ : A

open ⊥-notation {{...}} public
{-# DISPLAY ⊥-notation A .⊥ = ⊥ #-}


module _
  (A : Type ℓ)
  (B : Type ℓ')
  {ℓout : Level}
  (Out : Type ℓout)
  where


  record ×-notation : Type (ℓ ⊔ ℓ' ⊔ ℓout) where
    constructor mk
    field
      _×_ : A → B → Out
    infixr 5 _×_

  open ×-notation {{...}} public using (_×_)


  record ·-notation : Type (ℓ ⊔ ℓ' ⊔ ℓout) where
    constructor mk
    field
      _·_ : A → B → Out
    infixr 5 _·_

  open ·-notation {{...}} public using (_·_)


  record +-notation : Type (ℓ ⊔ ℓ' ⊔ ℓout) where
    constructor mk
    field
      _+_ : A → B → Out
    infixr 5 _+_

  open +-notation {{...}} public using (_+_)


{-# DISPLAY ×-notation A B ._×_ a b = a × b #-}
{-# DISPLAY ·-notation A B ._·_ a b = a · b #-}
{-# DISPLAY +-notation A B ._+_ a b = a + b #-}


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

