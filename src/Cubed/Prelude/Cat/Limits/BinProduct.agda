module Cubed.Prelude.Cat.Limits.BinProduct where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Cat.Precat.Base

open import Cubed.Prelude.HLevel.Base

private
  variable
    ℓob ℓhom : Level


module _
  (C : Precat ℓob ℓhom)
  where

  open Precat C

  module _
    (a b a×b : ob)
    (π₁ : hom a×b a) (π₂ : hom a×b b)
    where

    is-bin-product : Type (ℓob ⊔ ℓhom)
    is-bin-product =
      (a×'b : ob) (π₁' : hom a×'b a) (π₂' : hom a×'b b) →
      is-contr (Σ[ f ∈ hom a×'b a×b ] (seq f π₁ ≡ π₁') Types.× (seq f π₂ ≡ π₂'))

  record Bin-product (a b : ob) : Type (ℓob ⊔ ℓhom) where
    field
      product : ob
      π₁ : hom product a
      π₂ : hom product b
      has-is-bin-product : is-bin-product a b product π₁ π₂

  record Has-bin-products : Type (ℓob ⊔ ℓhom) where
    field
      product : (a b : ob) → Bin-product a b

