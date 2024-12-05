open import Cubed.Level

open import Cubed.Data.Fin.Base as Fin using (Fin; zero; suc)
open import Cubed.Data.List.Base as List using (List)
open import Cubed.Data.Maybe.Base as Maybe using (Maybe)
open import Cubed.Data.Prod.Base using (_×_; fst; snd)

open import Cubed.Fun.Base using (_∘_)


module Cubed.Data.Queue.Base where

private variable
  ℓ ℓ' : Level
  A Q : Type _

record IQueue (A : Type ℓ) (Q : Type ℓ') : Type (ℓ ⊔ ℓ') where
  field
    from-list : List A → Q
    empty : Q
    snoc : A → Q → Q
    pop : Q → Maybe (A × Q)
    head : Q → Maybe A
    tail : Q → Maybe Q

open IQueue {{...}} public

mk-from-minimal : (empty : Q) (snoc : A → Q → Q) (pop : Q → Maybe (A × Q)) → IQueue A Q
mk-from-minimal empty snoc pop = record
  { from-list = List.foldr snoc empty
  ; empty = empty
  ; snoc = snoc
  ; pop = pop
  ; head = Maybe.map fst ∘ pop
  ; tail = Maybe.map snd ∘ pop
  }

