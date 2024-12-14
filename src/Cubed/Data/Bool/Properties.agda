open import Cubed.Level

open import Cubed.Data.Bool.Base using (Bool; true; false; T)
open import Cubed.Data.Dec.Base as Dec using (Dec; yes; no; Is-discrete)

open import Cubed.Fun.Base as Fun using (_∘_)

open import Cubed.Path.Base as Path using (_≡_; refl; sym; subst)

open import Cubed.Relation.Nullary.Neg.Base using (¬_)


module Cubed.Data.Bool.Properties where

¬true≡false : ¬ true ≡ false
¬true≡false p = subst T p _

instance is-discrete : Is-discrete Bool
is-discrete {false} {false} = yes refl
is-discrete {false} {true} = no (¬true≡false ∘ sym)
is-discrete {true} {false} = no ¬true≡false
is-discrete {true} {true} = yes refl

