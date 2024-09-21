module Cubed.Data.Quot.Base where

open import Cubed.Core.Prelude

private variable
  ℓ ℓ' : Level
  A B C : Type _
  _~_ _~'_ : A → A → Type _


data _/_ (A : Type ℓ) (_~_ : A → A → Type ℓ') : Type (ℓ ⊔ ℓ') where
  [_] : A → A / _~_
  eq : {x y : A} → x ~ y → [ x ] ≡ [ y ]

instance
  inst-/-notation : Notation./-notation (Type ℓ) (λ {A} → A → A → Type ℓ') (Type (ℓ ⊔ ℓ'))
  inst-/-notation = Notation.mk _/_

rec :
  (f : A → B) → ((x y : A) → x ~ y → f x ≡ f y) →
  A / _~_ → B
rec f f-resp-~ [ a ] = f a
rec f f-resp-~ (eq x~y i) = f-resp-~ _ _ x~y i

-- rec2 :
--   (f : A → B → C) →
--   (∀ b x y → x ~ y → f x b ≡ f y b) →
--   (∀ a x y → x ~' y → f a x ≡ f a y) →
--   A / _~_ → B / _~'_ → C
-- rec2 f f-resp-~ f-resp-~' [ a ] [ b ] = f a b
-- rec2 f f-resp-~ f-resp-~' [ a ] (eq b~b' i) = f-resp-~' a _ _ b~b' i
-- rec2 f f-resp-~ f-resp-~' (eq a~a' i) [ b ] = f-resp-~ b _ _ a~a' i
-- rec2 f f-resp-~ f-resp-~' (eq {a} {a'} a~a' i) (eq {b} {b'} b~b' j) = {!!}
-- -- rec2 f f-resp-~ f-resp-~' =
-- --   rec (λ a → rec (f a) (f-resp-~' _))
-- --     (λ x y x~y → {!cong (λ a → rec a )!})
-- -- rec2 {A = A} {B = B} {C = C} {_~_ = _~_} {_~'_ = _~'_} f f-resp-~ f-resp-~' a b =
-- --   {!rec ? ? (a , b)!}
-- --   where
-- --   _~''_ : A Types.× B → A Types.× B → Type _
-- --   (a , b) ~'' (a' , b') = a ~ a' Types.× b ~' b'

