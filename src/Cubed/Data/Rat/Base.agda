module Cubed.Data.Rat.Base where

open import Cubed.Core.Prelude

open import Cubed.Data.Int.Base using (Int ; pos ; negsuc)
open import Cubed.Data.Nat.Base using (Nat)
open import Cubed.Data.Nat1.Base using (Nat1 ; 1+_ ; pred)
open import Cubed.Data.Quot.Base using ([_] ; eq)

module _ where
  open Notation

  _~_ : Int × Nat1 → Int × Nat1 → Type lzero
  (a , b) ~ (c , d) = a · (d to Int) ≡ c · (b to Int)

  Rat : Type lzero
  Rat = (Int × Nat1) / _~_

  instance
    inst-from-nat-lit : Has-from-nat Rat
    inst-from-nat-lit .Has-from-nat.Constraint n = Types.⊤
    inst-from-nat-lit .Has-from-nat.fromNat n = [ pos n , 1 ]

    inst-from-neg-lit : Has-from-neg Rat
    inst-from-neg-lit .Has-from-neg.Constraint n = Types.⊤
    inst-from-neg-lit .Has-from-neg.fromNeg n = [ - (pos n) , 1 ]

    inst-from-int : Canonical.Map Int Rat
    inst-from-int = Canonical.mk (λ n → [ n , 1 ])

    inst-from-nat : Canonical.Map Nat Rat
    inst-from-nat = Canonical.mk (λ n → n to Int to Rat)

    inst-from-nat1 : Canonical.Map Nat1 Rat
    inst-from-nat1 = Canonical.mk (λ n → n to Int to Rat)

