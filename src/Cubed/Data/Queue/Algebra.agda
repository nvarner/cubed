open import Cubed.Level

open import Cubed.Data.Fin.Base as Fin using (Fin; zero; suc)
open import Cubed.Data.Nat.Base using (Nat; zero; suc)

open import Cubed.Path.Base using (_≡_)


module Cubed.Data.Queue.Algebra where

private variable
  ℓ ℓ' : Level
  A : Type _
  n : Nat

data Ops (A : Type ℓ) : (num-elts : Nat) → Type ℓ where
  empty : Ops A zero
  snoc : A → Ops A n → Ops A (suc n)
  tail : Ops A (suc n) → Ops A n

snoc-count : Ops A n → Nat
snoc-count empty = zero
snoc-count (snoc x ops) = suc (snoc-count ops)
snoc-count (tail ops) = snoc-count ops

Snoc : Ops A n → Type lzero
Snoc ops = Fin (snoc-count ops)

snoc-lookup : (ops : Ops A n) → Snoc ops → A
snoc-lookup (snoc x ops) zero = x
snoc-lookup (snoc x ops) (suc i) = snoc-lookup ops i
snoc-lookup (tail ops) i = snoc-lookup ops i

record Queue-str (ℓ : Level) (A : Type ℓ') : Type (lsuc ℓ ⊔ ℓ') where
  field
    Q : Nat → Type ℓ
    sem : Ops A n → Q n
    head : Q (suc n) → A

Is-correct : Queue-str ℓ A → Type (level A)
Is-correct queue = {n : Nat} (ops : Ops _ (suc n)) (i : Snoc ops) → snoc-lookup ops i ≡ head (sem ops)
  where open Queue-str queue

