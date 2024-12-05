open import Cubed.Level

open import Cubed.Data.Bool.Base using (Bool)
open import Cubed.Data.Maybe.Base using (Maybe)
open import Cubed.Data.Maybe.Effectful using ()
open import Cubed.Data.Nat.Base as Nat using (Nat; zero; suc; _+_)
open import Cubed.Data.Nat.Properties as Nat using ()
open import Cubed.Data.Prod.Base using (Σ; Σ-syntax; _,_; fst; snd)
open import Cubed.Data.Queue.Base using (Ops)
open import Cubed.Data.Vec.Base as Vec using (Vec; []; _∷_)

open import Cubed.Effect

open import Cubed.Fun.Base using (_∘_; _$_)

open import Cubed.Path.Base using (subst)


module Cubed.Data.Queue.Batched.With-len where

private variable
  ℓ : Level
  A : Type _
  n m : Nat

-- Is-valid : Vec A n → Vec A m → Type (level A)
-- Is-valid front back = Vec.Is-empty front → Vec.Is-empty back

-- data Is-valid {A : Type ℓ} : Vec A n → Vec A m → Type ℓ where
--   instance back-empty : {front : Vec A n} → Is-valid front []
--   instance front-nonempty : {x : A} {front' : Vec A n} {back : Vec A m} → Is-valid (x ∷ front') back
-- {-# INCOHERENT back-empty front-nonempty #-}

data Is-valid : Nat → Nat → Type lzero where
  instance back-empty : Is-valid n zero
  instance front-nonempty : Is-valid (suc n) m

data Queue (A : Type ℓ) : Nat → Type ℓ where
  queue : (front : Vec A n) (back : Vec A m) {{valid : Is-valid n m}} → Queue A (n + m)

from-vec : (elts : Vec A n) → Queue A n
from-vec elts = subst (Queue _) (Nat.+-id-r _) $ queue elts []

private queue' : Vec A n → Vec A m → Queue A (n + m)
queue' [] back = from-vec back
queue' front@(x ∷ front') back = queue front back

empty : Queue A zero
empty = from-vec []

snoc : A → Queue A n → Queue A (suc n)
snoc x (queue front back) = subst (Queue _) (Nat.+-suc _ _) $ queue' front (x ∷ back)

get-front-len : Queue A n → Nat
get-front-len (queue {n = n} front back) = n

get-back-len : Queue A n → Nat
get-back-len (queue {m = m} front back) = m

get-front : (q : Queue A n) → Vec A (get-front-len q)
get-front (queue front back) = front

get-back : (q : Queue A n) → Vec A (get-back-len q)
get-back (queue front back) = back

get-valid : (q : Queue A n) → Is-valid (get-front-len q) (get-back-len q)
get-valid (queue front back {{valid}}) = valid

head : Queue A (suc n) → A
head q = {!!}

-- head : Queue A → Maybe A
-- head = List.head ∘ front

-- tail : Queue A → Maybe (Queue A)
-- tail q = do
--   front-tail ← List.tail (q .front)
--   pure $ split-queue front-tail (q .back)

module _ {A : Type ℓ} where

  open import Cubed.Data.Queue.Base as Queue' using (Ops; Snoc; Queue-str; Is-correct; snoc-lookup)

  sem : Ops A n → Queue A n
  sem Ops.empty = {!!}
  sem (Ops.snoc x ops) = {!!}
  sem (Ops.tail ops) = {!!}

  str : Queue-str ℓ A
  str .Queue-str.Q n = {!!}
  str .Queue-str.sem = {!!}
  str .Queue-str.head = {!!}


