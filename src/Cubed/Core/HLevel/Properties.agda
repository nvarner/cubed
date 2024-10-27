open import Cubed.Core.Primitives
open import Cubed.Core.Types.Base
open import Cubed.Core.Path
open import Cubed.Core.HLevel.Base
open import Cubed.Core.Equiv.Base
open import Cubed.Core.Fun.Base as Fun

import Cubed.Core.Builtin as Builtin

module Cubed.Core.HLevel.Properties where

open Is-contr
open Builtin.Nat

private variable
  A B : Type _
  P : A → Type _
  n : Nat

Π-is-hlevel :
  (is-hlevel : (a : A) → Is-hlevel n (P a)) →
  Is-hlevel n ((a : A) → P a)
Π-is-hlevel {n = zero} is-contr = mk-is-contr
  (λ a → Is-contr.center (is-contr a))
  (λ f → Fun.ext (λ a → Is-contr.≡center (is-contr a) (f a)))
Π-is-hlevel {n = suc zero} is-prop =
  mk-is-prop (λ f g → Fun.ext (λ a → Is-prop.path (is-prop a)))
Π-is-hlevel {n = suc (suc zero)} is-hlevel =
  mk-is-set (λ f g p q → {!!})
Π-is-hlevel {n = suc (suc (suc n))} is-hlevel = {!!}


-- ≃-pres-is-hlevel : (e : A ≃ B) (A-is-hlevel : Is-hlevel n A) → Is-hlevel n B
-- ≃-pres-is-hlevel {n = zero} e A-is-contr .center = fun e (A-is-contr .center)
-- ≃-pres-is-hlevel {n = zero} e A-is-contr .≡center b =
--   sym (inv-r e b) ∙ cong (fun e) (A-is-contr .≡center (inv e b))
-- ≃-pres-is-hlevel {n = suc zero} e A-is-prop x y =
--   sym (inv-r e x) ∙ cong (fun e) (A-is-prop (inv e x) (inv e y)) ∙ inv-r e y
-- ≃-pres-is-hlevel {n = suc (suc n)} e A-is-hlevel x y =
--   ≃-pres-is-hlevel {!!} (A-is-hlevel (inv e x) (inv e y))

