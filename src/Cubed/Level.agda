import Agda.Primitive as Prim


module Cubed.Level where

open Prim public
  using (Level; lzero; lsuc; _⊔_)
  renaming
    ( Set to Type
    ; Setω to Typeω
    ; SSet to SType
    ; SSetω to STypeω
    )

level : {ℓ : Level} (A : Type ℓ) → Level
level {ℓ} A = ℓ

record Lift {ℓ' ℓ : Level} (A : Type ℓ') : Type (ℓ ⊔ ℓ') where
  constructor liftℓ
  field
    lowerℓ : A

open Lift public

