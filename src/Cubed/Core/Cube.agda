open import Cubed.Core.Primitives
open import Cubed.Core.Path
open import Cubed.Core.Types.Base

open import Cubed.Core.Builtin using (module Nat)
open Nat

module Cubed.Core.Cube where

private variable
  ℓ : Level
  A : Type _
  n : Nat


∂Cube : (n : Nat) (A : Type ℓ) → Type ℓ
Cube-int : (n : Nat) (A : Type ℓ) (boundary : ∂Cube n A) → Type ℓ

record Cube (n : Nat) (A : Type ℓ) : Type ℓ where
  inductive
  field
    ∂ : ∂Cube n A
    int : Cube-int n A ∂

open Cube

record ∂Cube+ (n : Nat) (A : Type ℓ) : Type ℓ where
  inductive
  field
    start end : Cube n A
    ∂start≡∂end : ∂ start ≡ ∂ end

∂Cube zero A = Lift Unit
∂Cube (suc n) A = ∂Cube+ n A

Cube-int zero A boundary = A
Cube-int (suc n) A boundary = (λ i → Cube-int n A (∂start≡∂end i)) [ int start ≡ int end ]
  where open ∂Cube+ boundary


∂Globe : (n : Nat) (A : Type ℓ) → Type ℓ
Globe-int : (n : Nat) (A : Type ℓ) (boundary : ∂Globe n A) → Type ℓ

record Globe (n : Nat) (A : Type ℓ) : Type ℓ where
  inductive
  field
    ∂ : ∂Globe n A
    int : Globe-int n A ∂

open Globe

record ∂Globe+ (n : Nat) (A : Type ℓ) : Type ℓ where
  inductive
  field
    ∂² : ∂Globe n A
    start end : Globe-int n A ∂²

∂Globe zero A = Lift Unit
∂Globe (suc n) A = ∂Globe+ n A

Globe-int zero A boundary = A
Globe-int (suc n) A boundary = start ≡ end
  where open ∂Globe+ boundary

open ∂Cube+
open ∂Globe+


∂Cube→∂Globe : (cube-boundary : ∂Cube n A) → ∂Globe n A
∂Globe→∂Cube : (globe-boundary : ∂Globe n A) → ∂Cube n A

Globe-int→Cube-int : (cube-boundary : ∂Cube n A) (globe-int : Globe-int n A (∂Cube→∂Globe cube-boundary)) → Cube-int n A cube-boundary
Cube-int→Globe-int : (globe-boundary : ∂Globe n A) (cube-int : Cube-int n A (∂Globe→∂Cube globe-boundary)) → Globe-int n A globe-boundary

∂Cube→∂Globe {n = zero} (lift tt) = lift tt
∂Cube→∂Globe {n = suc zero} cube-boundary .∂² = lift tt
∂Cube→∂Globe {n = suc zero} cube-boundary .start = int (start cube-boundary)
∂Cube→∂Globe {n = suc zero} cube-boundary .end = int (end cube-boundary)
∂Cube→∂Globe {n = suc (suc (suc zero))} cube-boundary .∂² = ∂Cube→∂Globe {n = 2} {!!}
∂Cube→∂Globe {n = suc (suc (suc zero))} cube-boundary .start = {![≡]→≡ ?!}
∂Cube→∂Globe {n = suc (suc (suc zero))} cube-boundary .end = {!Cube-int→Globe-int {n = n} ? (int (end cube-boundary))!}
∂Cube→∂Globe {n = suc (suc (suc n))} cube-boundary .∂² = {!!}
∂Cube→∂Globe {n = suc (suc (suc n))} cube-boundary .start = {!!}
∂Cube→∂Globe {n = suc (suc (suc n))} cube-boundary .end = {!Cube-int→Globe-int {n = n} ? (int (end cube-boundary))!}

∂Globe→∂Cube {n = n} globe-boundary = {!!}

Globe-int→Cube-int {n = zero} (lift tt) globe-int = globe-int
Globe-int→Cube-int {n = suc n} cube-boundary globe-int = ≡→[≡] {B = λ i → Cube-int n _ (∂start≡∂end cube-boundary i)} {!!}

Cube-int→Globe-int {n = n} globe-boundary = {!!}


Path-filler : (A : Type ℓ) → Type ℓ
Path-filler A = {x y : A} → x ≡ y

Square-filler : (A : Type ℓ) → Type ℓ
Square-filler A =
  {a00 a01 a10 a11 : A}
  {left : a00 ≡ a01} {right : a10 ≡ a11}
  {bottom : a00 ≡ a10} {top : a01 ≡ a11} →
  Square left right bottom top

Cube-filler : (n : Nat) (A : Type ℓ) → Type ℓ
Cube-filler n A = (boundary : ∂Cube n A) → Cube-int n A boundary

