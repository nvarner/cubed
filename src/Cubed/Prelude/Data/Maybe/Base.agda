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

  elim : {B : Maybe A → Type ℓ} →
    B nothing →
    ((a : A) → B (just a)) →
    (a : Maybe A) → B a
  elim b f (just a) = f a
  elim b f nothing = b

  rec : B → (A → B) → Maybe A → B
  rec = elim

open Maybe
  using (Maybe ; just ; nothing)
  hiding (module Maybe)
  public

