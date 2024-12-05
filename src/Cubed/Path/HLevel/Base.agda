open import Cubed.Level

open import Cubed.Data.Nat.Base using (Nat; zero; suc)
open import Cubed.Data.Prod.Base using (Σ-syntax; _,_)

open import Cubed.Fun.Base using (_∘_; _∘₂_)

open import Cubed.Id.Base using (Id-sys; _≡ₛ_; path-to-reflₛ; ≡ₛ→≡; ≡→≡ₛ)

open import Cubed.Path.Base using (_≡_; cong; J)
open import Cubed.Path.Id as Path using ()


module Cubed.Path.HLevel.Base where

private variable
  ℓ : Level
  A : Type _
  n : Nat

Globe-filler : (n : Nat) (A : Type ℓ) → Type ℓ
Globe-filler zero A = Σ[ center ∈ A ] ((a : A) → a ≡ center)
Globe-filler (suc zero) A = (x y : A) → x ≡ y
Globe-filler (suc (suc n)) A = (x y : A) → Globe-filler (suc n) (x ≡ y)

record Is-hlevel (n : Nat) (A : Type ℓ) : Type ℓ where
  constructor hlevel
  field
    filler : Globe-filler n A

Is-contr : (A : Type ℓ) → Type ℓ
Is-contr = Is-hlevel 0

Is-prop : (A : Type ℓ) → Type ℓ
Is-prop = Is-hlevel 1

Is-set : (A : Type ℓ) → Type ℓ
Is-set = Is-hlevel 2

Globe-fillerₛ : (n : Nat) (A : Type ℓ) → {{Id-sys A}} → Type ℓ
Globe-fillerₛ zero A = Σ[ center ∈ A ] ((a : A) → a ≡ₛ center)
Globe-fillerₛ (suc zero) A = (x y : A) → x ≡ₛ y
Globe-fillerₛ (suc (suc n)) A = (x y : A) → Globe-filler (suc n) (x ≡ₛ y)

-- Globe-filler-≡ₛ→Globe-filler-≡ :
--   {{id-sys : Id-sys A}} {x y : A} →
--   Globe-filler n (x ≡ₛ y) → Globe-filler n (x ≡ y)
-- Globe-filler-≡ₛ→Globe-filler-≡ {n = zero} (center , s) = ≡ₛ→≡ center , {!!} -- (λ p → {!cong ext (s (ext⁻ p))!})
-- Globe-filler-≡ₛ→Globe-filler-≡ {n = suc n} globe-filler = {!!}

Globe-fillerₛ→Globe-filler : {{id-sys : Id-sys A}} → Globe-fillerₛ n A → Globe-filler n A
Globe-fillerₛ→Globe-filler {n = zero} (center , s) = center , ≡ₛ→≡ ∘ s
Globe-fillerₛ→Globe-filler {n = suc zero} globe-filler = ≡ₛ→≡ ∘₂ globe-filler
Globe-fillerₛ→Globe-filler {n = suc (suc zero)} globe-filler = {!!}
Globe-fillerₛ→Globe-filler {n = suc (suc (suc n))} globe-filler x y p q = {!globe-filler x y ? ?!}

-- Globe-fillerₛ→Globe-filler {n = zero} (center , s) = center , ≡ₛ→≡ ∘ s
-- Globe-fillerₛ→Globe-filler {n = suc zero} globe-filler = ≡ₛ→≡ ∘₂ globe-filler
-- --Globe-fillerₛ→Globe-filler {n = suc (suc n)} globe-filler = {!Globe-fillerₛ→Globe-filler ∘₂ globe-filler!}
-- Globe-fillerₛ→Globe-filler {n = suc (suc n)} globe-filler x y = {!Globe-filler!}

-- hlevelₛ : {{id-sys : Id-sys A}} → Globe-fillerₛ n A → Is-hlevel n A
-- hlevelₛ = hlevel ∘ Globe-fillerₛ→Globe-filler

inhabited-prop→is-contr : (a : A) (is-prop : Is-prop A) → Is-contr A
inhabited-prop→is-contr a is-prop = hlevel (a , λ a' → Is-hlevel.filler is-prop a' a)

