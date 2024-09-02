module Cubed.Prelude.Data.List.Base where

open import Cubed.Core.Prelude

private
  variable
    ℓ : Level
    A B : Type ℓ


module List where

  import Cubed.Core.Builtin as Builtin
  open Builtin.List public

  rec : B → (A → B → B) → List A → B
  rec b f [] = b
  rec b f (a ∷ as) = f a $ rec b f as

  _++_ : List A → List A → List A
  [] ++ ys = ys
  (x ∷ xs) ++ ys = x ∷ (xs ++ ys)

  map : (A → B) → List A → List B
  map f [] = []
  map f (a ∷ as) = f a ∷ map f as

  flat-map : (A → List B) → List A → List B
  flat-map f [] = []
  flat-map f (a ∷ as) = f a ++ flat-map f as

  safe-head : A → List A → A
  safe-head a' [] = a'
  safe-head a' (a ∷ as) = a

  safe-tail : List A → List A
  safe-tail [] = []
  safe-tail (a ∷ as) = as

  case : A → A → List B → A
  case a a' [] = a
  case a a' (b ∷ bs) = a'

  is-nil : List A → Type lzero
  is-nil = case Types.⊤ Types.⊥

  ¬cons≡nil : {a : A} {as : List A} → ¬ a ∷ as ≡ []
  ¬cons≡nil cons≡nil = subst is-nil (sym cons≡nil) tt

  cons-l-inj : {a a' : A} {as as' : List A} →
    a ∷ as ≡ a' ∷ as' → a ≡ a'
  cons-l-inj {a = a} = cong (safe-head a)

  cons-r-inj : {a a' : A} {as as' : List A} →
    a ∷ as ≡ a' ∷ as' → as ≡ as'
  cons-r-inj = cong safe-tail


open List
  using (List ; [] ; _∷_)
  hiding (module List)
  public

