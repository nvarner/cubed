open import Cubed.Level

open import Cubed.Data.Unit.Base using (Unit)
open import Cubed.Data.Empty.Base as Empty using (Empty)

open import Cubed.Fun.Base as Fun using (_|>_)

open import Cubed.Path.Base as Path using (_≡_; refl)

open import Cubed.Relation.Nullary.Neg.Base using (¬_)


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

flip : (b : Bool) → ¬ b ≡ true → b ≡ false
flip false ¬b≡true = refl
flip true ¬b≡true = ¬b≡true refl |> Empty.rec

