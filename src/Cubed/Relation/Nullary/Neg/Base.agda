open import Cubed.Level

open import Cubed.Data.Empty.Base using (Empty)


module Cubed.Relation.Nullary.Neg.Base where

private variable
  ℓ : Level

infix 3 ¬_
¬_ : (A : Type ℓ) → Type ℓ
¬ A = A → Empty

