open import Cubed.Level


module Cubed.Data.Maybe.Base where

private variable
  A B : Type _

open import Agda.Builtin.Maybe public using (Maybe; just; nothing)

rec : B → (A → B) → Maybe A → B
rec n j (just a) = j a
rec n j nothing = n

map : (A → B) → Maybe A → Maybe B
map f (just a) = just (f a)
map f nothing = nothing

from-maybe : A → Maybe A → A
from-maybe a (just a') = a'
from-maybe a nothing = a

bind : Maybe A → (A → Maybe B) → Maybe B
bind (just a) f = f a
bind nothing f = nothing

seq : Maybe (A → B) → Maybe A → Maybe B
seq (just f) (just a) = just (f a)
seq _ _ = nothing

