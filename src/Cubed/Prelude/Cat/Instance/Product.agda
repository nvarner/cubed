module Cubed.Prelude.Cat.Instance.Product where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Cat.Ftor.Base
open import Cubed.Prelude.Cat.Precat.Base

open Precat

private variable
  ℓob ℓhom ℓob' ℓhom' : Level


_×_ : Precat ℓob ℓhom → Precat ℓob' ℓhom' → Precat (ℓob ⊔ ℓob') (ℓhom ⊔ ℓhom')
(C × D) .ob = C .ob Types.× D .ob
(C × D) .hom (a , a') (b , b') = (C .hom a b) Types.× (D .hom a' b')
(C × D) .id = C .id , D .id
(C × D) .seq (f , f') (g , g') = (C .seq f g) , (D .seq f' g')
(C × D) .id-seq {f = (f , f')} i = (C .id-seq {f = f} i) , (D .id-seq {f = f'} i)
(C × D) .seq-id {f = (f , f')} i = (C .seq-id {f = f} i) , (D .seq-id {f = f'} i)
(C × D) .seq-assoc (f , f') (g , g') (h , h') i = (C .seq-assoc f g h i) , (D .seq-assoc f' g' h' i)

module
  _
  {C : Precat ℓob ℓhom}
  {D : Precat ℓob' ℓhom'}
  where
  open Ftor.Ftor
  open Ftor.Ftor-on
  open Ftor.is-ftor

  Fst : Ftor (C × D) C
  Fst .ob-map = fst
  Fst .ftor-on-ob-map .map = fst
  Fst .ftor-on-ob-map .has-is-ftor .map-id = refl
  Fst .ftor-on-ob-map .has-is-ftor .map-seq = refl

  Snd : Ftor (C × D) D
  Snd .ob-map = snd
  Snd .ftor-on-ob-map .map = snd
  Snd .ftor-on-ob-map .has-is-ftor .map-id = refl
  Snd .ftor-on-ob-map .has-is-ftor .map-seq = refl

  module _
    (C×'D : Precat (ℓob ⊔ ℓob') (ℓhom ⊔ ℓhom'))
    (Fst' : Ftor C×'D C)
    (Snd' : Ftor C×'D D)
    where

    Factor : Ftor C×'D (C × D)
    Factor .ob-map x = Fst' .ob-map x , Snd' .ob-map x
    Factor .ftor-on-ob-map = factor-ftor-on
      where
      factor-is-ftor : is-ftor C×'D (C × D) (Factor .ob-map) _
      factor-is-ftor .map-id i .fst = Fst' .ftor-on-ob-map .has-is-ftor .map-id i
      factor-is-ftor .map-id i .snd = Snd' .ftor-on-ob-map .has-is-ftor .map-id i
      factor-is-ftor .map-seq {f = f} {g} i .fst =
        Fst' .ftor-on-ob-map .has-is-ftor .map-seq {f = f} {g} i
      factor-is-ftor .map-seq {f = f} {g} i .snd =
        Snd' .ftor-on-ob-map .has-is-ftor .map-seq {f = f} {g} i

      factor-ftor-on : Ftor-on C×'D (C × D) _
      factor-ftor-on .map f = (Fst' .ftor-on-ob-map .map f) , (Snd' .ftor-on-ob-map .map f)
      factor-ftor-on .has-is-ftor = factor-is-ftor
