open import Cubed.Level

open import Cubed.Data.Eq.Base using (_≡_)


module Cubed.Data.Eq.Unsafe where

private
  primitive
    primEraseEquality : {ℓ : Level} {A : Type ℓ} {x y : A} → x ≡ y → x ≡ y

prim-erase-equality : {ℓ : Level} {A : Type ℓ} {x y : A} → x ≡ y → x ≡ y
prim-erase-equality = primEraseEquality

prim-trust-me : {ℓ : Level} {A : Type ℓ} {x y : A} → x ≡ y
prim-trust-me {x = x} {y = y} = prim-erase-equality unsafe-prim-trust-me
  where postulate unsafe-prim-trust-me : x ≡ y

