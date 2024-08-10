module Cubed.Prelude.Data.Dec.Base where

open import Cubed.Core.Prelude

private
  variable
    ℓ : Level
    A B : Type ℓ


module Dec where

  data Dec (A : Type ℓ) : Type ℓ where
    yes : A → Dec A
    no : ¬ A → Dec A

  rec : (A → B) → (¬ A → B) → Dec A → B
  rec f g (yes a) = f a
  rec f g (no ¬a) = g ¬a

  closed-under-× : Dec A → Dec B → Dec (A × B)
  closed-under-× (yes a) (yes b) = yes (a , b)
  closed-under-× (no ¬a) _ = no (¬a ∘ fst)
  closed-under-× _ (no ¬b) = no (¬b ∘ snd)

open Dec
  using (Dec ; yes ; no)
  hiding (module Dec)
  public

