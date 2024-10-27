open import Cubed.Core.Primitives
open import Cubed.Core.InstanceSearch
open import Cubed.Core.Types.Base

open import Cubed.Core.Builtin
  using (module Nat)
open Nat

open import Cubed.Core.HLevel.Base

module Cubed.Core.HLevel.InstanceSearch where

private variable
  A : Type _
  n : Nat

hlevel-known! : (n : Nat) → {{Is-hlevel n A}} → Is-hlevel n A
hlevel-known! n {{hlevel}} = hlevel

instance
  inst-hlevel-suc : {{Is-hlevel n A}} → Is-hlevel (suc n) A
  inst-hlevel-suc {{hlevel}} = is-hlevel-suc hlevel

