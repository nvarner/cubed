open import Cubed.Level

open import Cubed.Data.Prod.Base using (Σ)

open import Cubed.Path.Base using (_≡_)

open import Cubed.Relation.Nullary.Neg.Base using (¬_)


module Cubed.Data.Dec.Base where

private variable
  ℓ : Level
  A B : Type _

data Dec (A : Type ℓ) : Type ℓ where
  yes : A → Dec A
  no : ¬ A → Dec A

Is-discrete : Type ℓ → Type ℓ
Is-discrete A = {x y : A} → Dec (x ≡ y)

Decidable : (ℓ : Level) → Type (lsuc ℓ)
Decidable ℓ = Σ (Type ℓ) Dec

Discrete : (ℓ : Level) → Type (lsuc ℓ)
Discrete ℓ = Σ (Type ℓ) Is-discrete

rec : (A → B) → (¬ A → B) → Dec A → B
rec f g (yes a) = f a
rec f g (no ¬a) = g ¬a

map : (A → B) → (¬ A → ¬ B) → Dec A → Dec B
map y n (yes a) = yes (y a)
map y n (no ¬a) = no (n ¬a)

_≟_ : (a b : A) → {{Is-discrete A}} → Dec (a ≡ b)
_≟_ a b {{dec}} = dec

dec! : (A : Type ℓ) → {{Dec A}} → Dec A
dec! A {{dec}} = dec

instance ¬-dec : {{Dec A}} → Dec (¬ A)
¬-dec {{yes a}} = no (λ ¬a → ¬a a)
¬-dec {{no ¬a}} = yes ¬a

