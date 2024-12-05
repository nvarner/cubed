open import Cubed.Level

open import Cubed.Data.Nat.Base using (Nat; zero; Is-zero)
open import Cubed.Data.Vec.Base using (Vec; []; Is-empty)


module Cubed.Data.Vec.Properties where

private variable
  ℓ : Level
  A : Type _
  n : Nat

Is-empty→Is-zero : {as : Vec A n} → Is-empty as → Is-zero n
Is-empty→Is-zero [] = zero

Is-zero→Is-empty : Is-zero n → {as : Vec A n} → Is-empty as
Is-zero→Is-empty zero {as = []} = []

