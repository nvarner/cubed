module Cubed.Core.Prelude where

open import Cubed.Core.Primitives public
open import Cubed.Core.Path public
open import Cubed.Core.Types public
open import Cubed.Core.Glue public

open import Cubed.Core.HLevel.Base public
  hiding (upward-closed)

open import Cubed.Core.InstanceSearch public
open import Cubed.Core.HLevel.InstanceSearch public


open import Cubed.Core.Canonical public
  using (⟨_⟩ ; _to_)

module Canonical where
  open import Cubed.Core.Canonical public


open import Cubed.Core.Notation public
  using (Has-from-nat ; Has-from-neg ; fromNat ; fromNeg)

module Notation where
  open import Cubed.Core.Notation public


module HLevel where
  open import Cubed.Core.HLevel.Base public
  open import Cubed.Core.HLevel.InstanceSearch public

