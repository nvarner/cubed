open import Cubed.Level

open import Cubed.Id.Base using (Is-id-sys)

open import Cubed.Data.Prod.Base using (Σ-syntax; _,_)

open import Cubed.Path.HLevel.Base using (Is-hlevel; hlevel; Is-contr)


module Cubed.Id.Properties where

private variable
  ℓ : Level
  A : Type _

is-id-sys→is-contr :
  {_≡ₛ_ : A → A → Type ℓ} {reflₛ : {a : A} → a ≡ₛ a} →
  Is-id-sys _≡ₛ_ reflₛ → (x : A) → Is-contr (Σ[ y ∈ A ] y ≡ₛ x)
is-id-sys→is-contr {reflₛ = reflₛ} is-id-sys x =
  hlevel ((x , reflₛ) , λ (y , id) i → ≡ₛ→≡ y x id i , path-to-reflₛ y x id i)
  where open Is-id-sys is-id-sys

