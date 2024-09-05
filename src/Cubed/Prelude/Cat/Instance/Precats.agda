module Cubed.Prelude.Cat.Instance.Precats where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Cat.Ftor.Base
open import Cubed.Prelude.Cat.Instance.Product hiding (_×_)
open import Cubed.Prelude.Cat.Limits.BinProduct
open import Cubed.Prelude.Cat.Notation
open import Cubed.Prelude.Cat.Precat.Base

open Precat
open Notation

private variable
  ℓob ℓhom : Level


Precats : (ℓob ℓhom : Level) → Precat (lsuc (ℓob ⊔ ℓhom)) (ℓob ⊔ ℓhom)
Precats ℓob ℓhom .ob = Precat ℓob ℓhom
Precats ℓob ℓhom .hom = Ftor
Precats ℓob ℓhom .id = Ftor.id
Precats ℓob ℓhom .seq = Ftor.seq
Precats ℓob ℓhom .id-seq = Ftor.id-seq
Precats ℓob ℓhom .seq-id = Ftor.seq-id
Precats ℓob ℓhom .seq-assoc = Ftor.seq-assoc

open Has-bin-products
open Bin-product

instance
  precats-has-bin-products : Has-bin-products (Precats ℓob ℓhom)
  precats-has-bin-products .product a b .product = a × b
  precats-has-bin-products .product a b .π₁ = Fst
  precats-has-bin-products .product a b .π₂ = Snd
  precats-has-bin-products .product a b .has-is-bin-product a×'b π₁' π₂' = (F , {!!}) , {!!}
    where
    open Ftor.Ftor
    open Ftor.Ftor-on
    open Ftor.is-ftor
    F : Ftor a×'b (a × b)
    F .ob-map x = π₁' .ob-map x , π₂' .ob-map x
    F .ftor-on-ob-map .map f = (π₁' .ftor-on-ob-map .map f) , (π₂' .ftor-on-ob-map .map f)
    F .ftor-on-ob-map .has-is-ftor .map-id i .fst = π₁' .ftor-on-ob-map .has-is-ftor .map-id i
    F .ftor-on-ob-map .has-is-ftor .map-id i .snd = π₂' .ftor-on-ob-map .has-is-ftor .map-id i
    F .ftor-on-ob-map .has-is-ftor .map-seq {f = f} {g} i .fst =
      π₁' .ftor-on-ob-map .has-is-ftor .map-seq {f = f} {g} i
    F .ftor-on-ob-map .has-is-ftor .map-seq {f = f} {g} i .snd =
      π₂' .ftor-on-ob-map .has-is-ftor .map-seq {f = f} {g} i

