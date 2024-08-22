module Cubed.Prelude.Data.Bot.Base where

open import Cubed.Core.Prelude

private
  variable
    ℓ : Level
    A : Type ℓ


module ⊥ where

  open Types using (⊥) public

  rec : Types.⊥ → A
  rec ()

