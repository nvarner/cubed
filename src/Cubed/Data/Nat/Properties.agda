open import Cubed.Core.Prelude
open import Cubed.Data.Nat.Base

open import Cubed.Algebra.Monoid.Base using (Is-monoid ; Monoid-on ; Monoid ; known-monoid!)
open import Cubed.Algebra.Op.Base using (Is-unital ; Is-assoc ; Is-comm)

open import Cubed.Data.Dec.Base as Dec
  using (Is-discrete ; yes ; no)


module Cubed.Data.Nat.Properties where

private variable
  m n : Nat

znots : ¬ zero ≡ suc n
znots p = subst is-zero p tt

instance
  Nat-is-discrete : Is-discrete Nat
  Nat-is-discrete {zero} {zero} = yes refl
  Nat-is-discrete {zero} {suc n} = no znots
  Nat-is-discrete {suc m} {zero} = no (znots ∘ sym)
  Nat-is-discrete {suc m} {suc n} = Nat-is-discrete & Dec.map (cong suc) (_∘ cong safe-pred)

open Is-unital
open Is-assoc
open Is-comm

opaque
  +-id-l : ∀ n → zero + n ≡ n
  +-id-l n = refl

opaque
  +-id-r : ∀ n → n + zero ≡ n
  +-id-r = elim refl (λ n → cong suc)

opaque
  +-assoc : ∀ x y z → (x + y) + z ≡ x + (y + z)
  +-assoc = elim (λ y z → refl) (λ x ih y z → cong suc (ih y z))

opaque
  +-suc : ∀ m n → m + suc n ≡ suc m + n
  +-suc = elim (λ n → refl) (λ m ih n → cong suc (ih n))

opaque
  +-comm : ∀ m n → m + n ≡ n + m
  +-comm m = elim (+-id-r _) (λ y ih → +-suc _ _ ∙ cong suc ih)

instance
  +-is-unital : Is-unital _+_
  +-is-unital .e = zero
  +-is-unital .id-l = +-id-l
  +-is-unital .id-r = +-id-r

  +-is-assoc : Is-assoc _+_
  +-is-assoc .assoc = +-assoc

  +-is-comm : Is-comm _+_
  +-is-comm .comm = +-comm

+-is-monoid : Is-monoid _ _+_
+-is-monoid = known!

+-monoid : Monoid lzero
+-monoid = known-monoid! _ _+_

