open import Cubed.Core.Primitives
open import Cubed.Core.Fun.Base
open import Cubed.Core.HLevel.Base

import Cubed.Core.Builtin as Builtin

module Cubed.Core.Fun.Properties where

open Builtin.Nat

private variable
  A B : Type _
  P : A → Type _

Π-is-hlevel : {n : Nat} (P-is-hlevel : (a : A) → Is-hlevel n (P a)) → Is-hlevel n ((a : A) → P a)
Π-is-hlevel {n = zero} P-is-contr = mk-is-contr
  (λ a → Is-contr.center (P-is-contr a))
  (λ f → ext (λ a → Is-contr.≡center (P-is-contr a) (f a)))
Π-is-hlevel {n = suc n} P-is-hlevel = mk-is-hlevel+ (λ f g → {!!})
-- Π-is-hlevel {n = suc zero} P-is-prop f g = ext (λ a → P-is-prop a (f a) (g a))
-- Π-is-hlevel {n = suc (suc n)} P-is-hlevel f g = {!!}

→-is-hlevel : {n : Nat} (B-is-hlevel : Is-hlevel n B) → Is-hlevel n (A → B)
→-is-hlevel {n = zero} B-is-contr = {!!} --.center a = B-is-contr .center
--→-is-hlevel {n = zero} B-is-contr .≡center f = ext (λ a → B-is-contr .≡center (f a))
→-is-hlevel {n = suc n} B-is-hlevel = {!!}

