open import Cubed.Level

open import Cubed.Data.Prod.Base using (_×_; _,_)


module Cubed.Foreign.Pair where

record Pair {ℓ ℓ' : Level} (A : Type ℓ) (B : Type ℓ') : Type (ℓ ⊔ ℓ') where
  constructor _,_
  field
    fst : A
    snd : B

open Pair public

infixr 4 _,_

{-# FOREIGN GHC type AgdaPair l l' A B = (A, B) #-}
{-# COMPILE GHC Pair = data MAlonzo.Code.Cubed.Foreign.Pair.AgdaPair ((,)) #-}

