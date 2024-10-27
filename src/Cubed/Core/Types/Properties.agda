open import Cubed.Core.Primitives
open import Cubed.Core.InstanceSearch
open import Cubed.Core.Path
open import Cubed.Core.Types.Base
open import Cubed.Core.HLevel.Base
import Cubed.Core.Fun.Base as Fun

module Cubed.Core.Types.Properties where

private variable
  A : Type _

Unit-is-contr : Is-contr Unit
Unit-is-contr = mk-is-contr tt (λ a → refl)

instance
  inst-Unit-is-contr : Wrap (Is-contr Unit)
  inst-Unit-is-contr = wrap Unit-is-contr

Empty-is-prop : Is-prop Empty
Empty-is-prop = mk-is-prop (λ ())

instance
  inst-Empty-is-prop : Wrap (Is-prop Empty)
  inst-Empty-is-prop = wrap Empty-is-prop

¬-is-prop : Is-prop (¬ A)
¬-is-prop = {!!}

