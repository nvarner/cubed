open import Cubed.Level

open import Cubed.Data.Unit.Base using (Unit)
open import Cubed.Data.Empty.Base using (Empty)


module Cubed.Data.Bool.Base where

private variable
  A : Type _

open import Agda.Builtin.Bool public
  using (Bool; true; false)

not : Bool → Bool
not true = false
not false = true

T : Bool → Type lzero
T true = Unit
T false = Empty

infix 0 ifᵇ_then_else_
ifᵇ_then_else_ : Bool → A → A → A
ifᵇ true then x else y = x
ifᵇ false then x else y = y

