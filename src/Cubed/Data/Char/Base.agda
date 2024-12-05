open import Cubed.Data.Bool.Base using (Bool)
open import Cubed.Data.Maybe.Base as Maybe using (Maybe; just; nothing)
open import Cubed.Data.Nat.Base as Nat using (Nat)


module Cubed.Data.Char.Base where

import Agda.Builtin.Char as Char

open Char public
  using (Char)
  renaming
    ( primIsSpace to is-spaceᵇ
    ; primCharToNat to to-nat
    ; primNatToChar to from-nat
    )

_≡ᵇ_ : Char → Char → Bool
_≡ᵇ_ = Char.primCharEquality

parse-digit : Char → Maybe Nat
parse-digit '0' = just 0
parse-digit '1' = just 1
parse-digit '2' = just 2
parse-digit '3' = just 3
parse-digit '4' = just 4
parse-digit '5' = just 5
parse-digit '6' = just 6
parse-digit '7' = just 7
parse-digit '8' = just 8
parse-digit '9' = just 9
parse-digit _ = nothing

