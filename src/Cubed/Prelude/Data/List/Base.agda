module Cubed.Prelude.Data.List.Base where

open import Cubed.Core.Prelude

private
  variable
    ℓ : Level
    A B : Type ℓ


module List where

  open import Agda.Builtin.List
    using (List ; [] ; _∷_)
    public

  rec : B → (A → B → B) → List A → B
  rec b f [] = b
  rec b f (a ∷ as) = f a $ rec b f as

open List
  using (List ; [] ; _∷_)
  hiding (module List)
