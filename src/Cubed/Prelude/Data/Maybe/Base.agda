module Cubed.Prelude.Data.Maybe.Base where

open import Cubed.Core.Prelude

private
  variable
    ℓ : Level
    A B : Type ℓ


module Maybe where

  open import Agda.Builtin.Maybe
    using (Maybe ; just ; nothing)
    public

  rec : B → (A → B) → Maybe A → B
  rec b f (just a) = f a
  rec b f nothing = b

open Maybe
  using (Maybe ; just ; nothing)
  hiding (module Maybe)
  public

