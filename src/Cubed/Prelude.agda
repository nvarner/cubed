module Cubed.Prelude where

open import Cubed.Core.Prelude public

open import Cubed.Prelude.Effect public

module Agda where
  open import Cubed.Prelude.Reflection public

open import Cubed.Prelude.Cat.Instance.Types public
open import Cubed.Prelude.Cat.Precat.Base public

open import Cubed.Prelude.Data.Bot.Base public
open import Cubed.Prelude.Data.Dec.Base public
open import Cubed.Prelude.Data.List.Base public
open import Cubed.Prelude.Data.Maybe.Base public

open import Cubed.Prelude.Data.Nat.Base public
module Trichotomy where
  open import Cubed.Prelude.Data.Nat.Trichotomy public
open Trichotomy public
  using (Trichotomy ; lt ; eq ; gt)
  hiding (module Trichotomy)

open import Cubed.Prelude.Data.Sum.Base public

open import Cubed.Prelude.HLevel.Base public

open import Cubed.Prelude.Types.PropTrunc.Base public

