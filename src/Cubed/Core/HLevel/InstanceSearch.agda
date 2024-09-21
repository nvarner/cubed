module Cubed.Core.HLevel.InstanceSearch where

open import Cubed.Core.Primitives
open import Cubed.Core.Types

open import Cubed.Core.Builtin
  using (module Nat)
open Nat

open import Cubed.Core.HLevel.Base

private variable
  A : Type _
  n : Nat

hlevel-known! : (n : Nat) → {{_ : Is-of-hlevel n A}} → Is-of-hlevel n A
hlevel-known! n {{hlevel}} = hlevel

instance
  inst-hlevel-upward-closed : {{_ : Is-of-hlevel n A}} → Is-of-hlevel (suc n) A
  inst-hlevel-upward-closed {{hlevel}} = upward-closed hlevel

