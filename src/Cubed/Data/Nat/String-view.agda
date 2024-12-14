open import Cubed.Level

open import Cubed.Data.Fin.Base as Fin using (Fin; zero; suc)
open import Cubed.Data.List.Base as List using (List; []; _∷_; [_])
open import Cubed.Data.Prod.Base using (_×_; _,_; fst; snd)
open import Cubed.Data.Nat.Base as Nat using (Nat; zero; suc; _+_; _*_; _≤_; z≤; s≤s)


module Cubed.Data.Nat.String-view where

module Base (base : Nat) where

  Digit : Type lzero
  Digit = Fin base

  from-nat : (n : Nat) → {{2 ≤ base}} → List Digit
  from-nat zero {{ s≤s _ }} = [ zero ]
  from-nat n = {!Nat.div n base!}

  to-nat : List Digit → Nat
  to-nat = List.foldr (λ dig n → base * n + (Fin.to-nat dig)) zero

module Binary = Base 2
module Ternary = Base 3
module Octal = Base 8
module Decimal = Base 10
module Hexadecimal = Base 16

