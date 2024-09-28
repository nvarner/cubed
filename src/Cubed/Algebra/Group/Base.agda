open import Cubed.Core.Prelude

open import Cubed.Algebra.Op.Base
open import Cubed.Algebra.Monoid.Base as Monoid using (Is-monoid ; Monoid-on ; Monoid)


module Cubed.Algebra.Group.Base where

private variable
  ℓ : Level
  A : Type ℓ

record Is-group (G : Type ℓ) (_*_ : Op-on G) : Type (level G) where
  constructor mk-is-group
  field
    is-unital : Is-unital _*_
    is-assoc : Is-assoc _*_
    is-inv : Is-inv _*_ is-unital

instance
  inst-mk-is-group :
    {G : Type ℓ} {_*_ : Op-on G} →
    {{*-is-unital : Is-unital _*_}} → {{Is-assoc _*_}} → {{Is-inv _*_ *-is-unital}} →
    Is-group G _*_
  inst-mk-is-group = mk-is-group known! known! known!


record Group-on (G : Type ℓ) : Type (level G) where
  constructor mk-group-on
  field
    _*_ : Op-on G
    has-is-group : Is-group G _*_

  open Is-group has-is-group public


record Group (ℓ : Level) : Type (lsuc ℓ) where
  constructor mk-group
  field
    Carrier : Type ℓ
    has-group-on : Group-on Carrier

  open Group-on has-group-on public

known-group! :
  (G : Type ℓ) (_*_ : Op-on G) →
  {{Is-group G _*_}} → Group ℓ
known-group! G _*_ {{is-group}} = mk-group G (mk-group-on _*_ is-group)


Is-group→Is-monoid : ∀ {_*_} → Is-group A _*_ → Is-monoid A _*_
Is-group→Is-monoid is-group .Is-monoid.is-unital = is-group .Is-group.is-unital
Is-group→Is-monoid is-group .Is-monoid.is-assoc = is-group .Is-group.is-assoc

Group-on→Monoid-on : Group-on A → Monoid-on A
Group-on→Monoid-on G .Monoid-on._*_ = G .Group-on._*_
Group-on→Monoid-on G .Monoid-on.has-is-monoid = Is-group→Is-monoid (G .Group-on.has-is-group)

Group→Monoid : Group ℓ → Monoid ℓ
Group→Monoid G .Monoid.Carrier = G .Group.Carrier
Group→Monoid G .Monoid.has-monoid-on = Group-on→Monoid-on (G .Group.has-group-on)


instance
  Group→Type-canonical : Canonical.Map (Group ℓ) (Type ℓ)
  Group→Type-canonical = Canonical.mk Group.Carrier

  Is-group→Is-monoid-canonical : ∀ {_*_} → Canonical.Map (Is-group A _*_) (Is-monoid A _*_)
  Is-group→Is-monoid-canonical = Canonical.mk Is-group→Is-monoid

  Group-on→Monoid-on-canonical : Canonical.Map (Group-on A) (Monoid-on A)
  Group-on→Monoid-on-canonical = Canonical.mk Group-on→Monoid-on

  Group→Monoid-canonical : Canonical.Map (Group ℓ) (Monoid ℓ)
  Group→Monoid-canonical = Canonical.mk Group→Monoid


private module example where

  _+_ : Types.⊤ → Types.⊤ → Types.⊤
  tt + tt = tt

  instance
    +-is-unital : Is-unital _+_
    +-is-unital = mk-is-unital tt (λ tt → refl) (λ tt → refl)

    +-is-assoc : Is-assoc _+_
    +-is-assoc = mk-is-assoc (λ tt tt tt → refl)

    +-is-inv : Is-inv _+_ +-is-unital
    +-is-inv = mk-is-inv idfun (λ tt → refl) (λ tt → refl)

  +-group : Group lzero
  +-group = known-group! _ _+_

  +-monoid : Monoid lzero
  +-monoid = ⟨ +-group ⟩

  g-elt : ⟨ +-group ⟩
  g-elt = {!!}

  m-elt : ⟨ +-monoid ⟩
  m-elt = {!!}

