module Cubed.Cat.Instance.HLevels where

open import Cubed.Core.Prelude

open import Cubed.Cat.Base using (Precat)
open import Cubed.Cat.Displayed.Base using (Displayed ; ∫)
open import Cubed.Cat.Displayed.StructureOver using (PropertyOver)
open import Cubed.Cat.Instance.Types using (Types)
open import Cubed.Data.Nat.Base using (Nat)

open Displayed
open Precat

HLevelsᴰ : (ℓ : Level) → Nat → Displayed (Types ℓ) (lsuc ℓ) lzero
HLevelsᴰ ℓ n = PropertyOver _ (Is-of-hlevel n)

HLevels : (ℓ : Level) → Nat → Precat (lsuc ℓ) ℓ
HLevels ℓ n = ∫ (HLevelsᴰ ℓ n)

