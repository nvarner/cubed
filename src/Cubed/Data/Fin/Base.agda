open import Cubed.Level

open import Cubed.Data.Nat.Base as Nat using (Nat; zero; suc; Is-nonzero)
open import Cubed.Data.Prod.Base using (_×_; _,_; fst; snd)

open import Cubed.Fun.Base as Fun using (_∘_; const)


module Cubed.Data.Fin.Base where

private variable
  A : Type _
  n : Nat

data Fin : Nat → Type where
  zero : Fin (suc n)
  suc : Fin n → Fin (suc n)

last : Fin (suc n)
last {n = zero} = zero
last {n = suc n} = suc last

rec-zero : A → (Fin (Nat.safe-pred n) → A) → Fin n → A
rec-zero z s zero = z
rec-zero z s (suc k) = s k

case-zero : A → A → Fin n → A
case-zero z s = rec-zero z (const s)

rec-last : A → (Fin (Nat.safe-pred n) → A) → Fin n → A
rec-last {n = suc zero} l p k = l
rec-last {n = suc (suc n)} l p zero = p zero
rec-last {n = suc (suc n)} l p (suc k) = rec-last l (p ∘ suc) k

case-last : A → A → Fin n → A
case-last l p = rec-last l (const p)

weaken : Fin n → Fin (suc n)
weaken zero = zero
weaken (suc k) = suc (weaken k)

to-nat : Fin n → Nat
to-nat zero = zero
to-nat (suc k) = suc (to-nat k)

module Mod where

  inc : Fin n → Fin n
  inc {n = suc n} = rec-last zero suc

  dec : Fin n → Fin n
  dec {n = suc n} = rec-zero last weaken

  infixl 6 _+_
  _+_ : Fin n → Fin n → Fin n
  x + y = Fun.repeat (to-nat x) inc y

  infixl 6 _-_
  _-_ : Fin n → Fin n → Fin n
  x - y = Fun.repeat (to-nat y) dec x

  infixl 7 _*_
  _*_ : Fin n → Fin n → Fin n
  _*_ {n = suc n} x y = Fun.repeat (to-nat x) (_+ y) zero

nat-mod : Nat → (b : Nat) → {{Is-nonzero b}} → Fin b
nat-mod a (suc b) = Nat.rec zero (const Mod.inc) a

