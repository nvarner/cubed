module Cubed.Core.Notation where

open import Cubed.Core.Primitives

private
  variable
    ℓ ℓ' : Level


open import Agda.Builtin.FromNat public
  using (fromNat)
  renaming (Number to Has-from-nat)

open import Agda.Builtin.FromNeg public
  using (fromNeg)
  renaming (Negative to Has-from-neg)


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
  (B : {a : A} → Type ℓ')
  {ℓout : Level}
  (Out : Type ℓout)
  where


  record ×-notation : Type (ℓ ⊔ ℓ' ⊔ ℓout) where
    constructor mk
    field
      _×_ : (a : A) → B {a} → Out
    infixr 5 _×_

  open ×-notation {{...}} public using (_×_)


  record ·-notation : Type (ℓ ⊔ ℓ' ⊔ ℓout) where
    constructor mk
    field
      _·_ : (a : A) → B {a} → Out
    infixr 5 _·_

  open ·-notation {{...}} public using (_·_)


  record /-notation : Type (ℓ ⊔ ℓ' ⊔ ℓout) where
    constructor mk
    field
      _/_ : (a : A) → B {a} → Out
    infixr 5 _/_

  open /-notation {{...}} public using (_/_)


  record +-notation : Type (ℓ ⊔ ℓ' ⊔ ℓout) where
    constructor mk
    field
      _+_ : (a : A) → B {a} → Out
    infixr 5 _+_

  open +-notation {{...}} public using (_+_)


  record minus-notation : Type (ℓ ⊔ ℓ' ⊔ ℓout) where
    constructor mk
    field
      _-_ : (a : A) → B {a} → Out
    infixr 5 _-_

  open minus-notation {{...}} public using (_-_)


{-# DISPLAY ×-notation A B ._×_ a b = a × b #-}
{-# DISPLAY ×-notation._×_ X a b = a × b #-}
{-# DISPLAY ·-notation A B ._·_ a b = a · b #-}
{-# DISPLAY ·-notation._·_ X a b = a · b #-}
{-# DISPLAY /-notation A B ._/_ a b = a / b #-}
{-# DISPLAY /-notation._/_ X a b = a / b #-}
{-# DISPLAY +-notation A B ._+_ a b = a + b #-}
{-# DISPLAY +-notation._+_ X a b = a + b #-}
{-# DISPLAY minus-notation A B ._-_ a b = a - b #-}
{-# DISPLAY minus-notation._-_ X a b = a - b #-}


record neg-notation (A : Type ℓ) {ℓout} (Out : Type ℓout) : Typeω where
  constructor mk
  field
    -_ : A → Out

open neg-notation {{...}} public using (-_)


record ⁻¹-notation (A : Type ℓ) {ℓout} (Out : Type ℓout) : Typeω where
  constructor mk
  field
    _⁻¹ : A → Out

open ⁻¹-notation {{...}} public using (_⁻¹)


{-# DISPLAY neg-notation A B .-_ a = - a #-}
{-# DISPLAY ⁻¹-notation A B ._⁻¹ a = a ⁻¹ #-}


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

