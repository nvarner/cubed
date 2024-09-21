open import Cubed.Core.Prelude

open import Cubed.Algebra.Op.Base


module Cubed.Algebra.Monoid.Base where

private variable
  ℓ : Level

record Is-monoid (M : Type ℓ) (_*_ : Op-on M) : Type (level M) where
  constructor mk-is-monoid
  field
    is-unital : Is-unital _*_
    is-assoc : Is-assoc _*_

instance
  inst-mk-is-monoid :
    {M : Type ℓ} {_*_ : Op-on M} →
    {{Is-unital _*_}} → {{Is-assoc _*_}} → Is-monoid M _*_
  inst-mk-is-monoid = mk-is-monoid known! known!


record Monoid-on (M : Type ℓ) : Type (level M) where
  constructor mk-monoid-on
  field
    _*_ : Op-on M
    has-is-monoid : Is-monoid M _*_

  open Is-monoid has-is-monoid public


record Monoid (ℓ : Level) : Type (lsuc ℓ) where
  constructor mk-monoid
  field
    Carrier : Type ℓ
    has-monoid-on : Monoid-on Carrier

  open Monoid-on has-monoid-on public

known-monoid! :
  (M : Type ℓ) (_*_ : Op-on M) →
  {{Is-monoid M _*_}} → Monoid ℓ
known-monoid! M _*_ {{is-monoid}} = mk-monoid M (mk-monoid-on _*_ is-monoid)


instance
  Monoid→Type-canonical : Canonical.Map (Monoid ℓ) (Type ℓ)
  Monoid→Type-canonical = Canonical.mk Monoid.Carrier

