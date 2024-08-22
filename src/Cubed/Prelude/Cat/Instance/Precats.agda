module Cubed.Prelude.Cat.Instance.Precats where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Cat.Ftor.Base
open import Cubed.Prelude.Cat.Precat.Base

open Precat


module Precats where

  Precats : (ℓob ℓhom : Level) → Precat (lsuc (ℓob ⊔ ℓhom)) (ℓob ⊔ ℓhom)
  Precats ℓob ℓhom .ob = Precat ℓob ℓhom
  Precats ℓob ℓhom .hom = Ftor
  Precats ℓob ℓhom .id = Ftor.id
  Precats ℓob ℓhom .seq = Ftor.seq
  Precats ℓob ℓhom .id-seq = Ftor.id-seq
  Precats ℓob ℓhom .seq-id = Ftor.seq-id
  Precats ℓob ℓhom .seq-assoc = Ftor.seq-assoc

open Precats
  using (Precats)
  public

