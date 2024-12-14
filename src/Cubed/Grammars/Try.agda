open import Cubed.Level


module Cubed.Grammars.Try {ℓ} (Alph : Type ℓ) where

open import Cubed.Grammars.Base Alph hiding (rec; map)
open import Cubed.Grammars.Prod Alph as & using (_&_; _,&_; fst; snd)
open import Cubed.Grammars.Sum Alph as ⊕ using (_⊕_; inl; inr)

private variable
  G H K : Lin

Try : Lin → Lin → Lin
Try G H = (H & G) ⊕ G

succeed : G ⊢ H → G ⊢ Try G H
succeed x = (x ,& id) ⋆ inl

fail : G ⊢ Try G H
fail = inr

forget : Try G H ⊢ G
forget = ⊕.elim snd id

map : G ⊢ H → Try K G ⊢ Try K H
map f = ⊕.map-l (&.map-fst f)

bind : G ⊢ Try G H → Try K G ⊢ Try K H
bind f = ⊕.elim {!!} fail

or-retry : G ⊢ Try G H → Try G H ⊢ Try G H
or-retry retry = ⊕.elim inl retry

