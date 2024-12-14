open import Cubed.Level

open import Cubed.Data.Dec.Base as Dec using (Dec; yes; no; _≟_; dec!)
open import Cubed.Data.List.Base as List using (List; []; _∷_)
open import Cubed.Data.List.Properties using ()

open import Cubed.Fun.Base as Fun using (_|>_)

open import Cubed.Path.Base using (J)

open import Cubed.Relation.Nullary.Neg.Base using (¬_)


module Cubed.Grammars.Parser-combinator {ℓ} (Alph : Type ℓ) where

open import Cubed.Grammars.Base Alph hiding (map)
open import Cubed.Grammars.Maybe Alph as Maybe using (Maybe; just; nothing)
open import Cubed.Grammars.Sum Alph as ⊕ using (_⊕_; inl; inr)

private variable
  A : Type ℓ
  G H K L : Lin

Weak-parser : Lin → Type (lsuc ℓ)
Weak-parser G = String ⊢ Maybe (G ⊗ String)

grammar-of : Weak-parser G → Lin
grammar-of {G = G} p = G

Finished-weak-parser : Lin → Type (lsuc ℓ)
Finished-weak-parser G = String ⊢ Maybe G

finish : Weak-parser G → Finished-weak-parser G
finish p = p ⋆ Maybe.bind
  ((id ,⊗ unroll _
  ⋆ ⊕ᴰ-elim (λ where
    `nil → just
    `cons → nothing))
  ⋆ Maybe.⊗r
  ⋆ Maybe.map ⊗-unit-r)

pure : Weak-parser ε
pure = ⊗-unit-l⁻ ⋆ just

map : G ⊢ H → Weak-parser G → Weak-parser H
map f p = p ⋆ Maybe.map (f ,⊗ id)

map-maybe : G ⊢ Maybe H → Weak-parser G → Weak-parser H
map-maybe f x = x ⋆ Maybe.bind ((f ,⊗ id) ⋆ Maybe.⊗l)

concat : Weak-parser G → Weak-parser H → Weak-parser (G ⊗ H)
concat p p' = p ⋆ Maybe.bind ((id ,⊗ p') ⋆ Maybe.⊗r ⋆ Maybe.map ⊗-assoc)

infixr 5 _<⊗>_
_<⊗>_ = concat

fail : Weak-parser G
fail = nothing

infixr 5 _<|>_
_<|>_ : Weak-parser G → Weak-parser G → Weak-parser G
p <|> p' = p ⋆ Maybe.rec just (read ⋆ p')

infixr 5 _<⊕>_
_<⊕>_ : Weak-parser G → Weak-parser H → Weak-parser (G ⊕ H)
p <⊕> p' = map inl p <|> map inr p'

-- TODO: address nontermination when `G` admits `ε`
{-# NON_TERMINATING #-}
many : Weak-parser G → Weak-parser (G *)
many p =
  p ⋆ Maybe.bind ((id ,⊗  many p) ⋆ Maybe.⊗r ⋆ Maybe.map (⊗-assoc ⋆ (cons ,⊗ id)))
  <|> map nil pure

rest : Weak-parser String
rest = ⊗-unit-r⁻ ⋆ (id ,⊗ string-in) ⋆ just

any-char : Weak-parser Char
any-char = unroll _ ⋆ ⊕ᴰ-elim (λ where
  `nil → nothing
  `cons → (id ,⊗ string-in) ⋆ just)

satisfy :
  {P : Alph → Type ℓ} (P-dec : (c : Alph) → Dec (P c)) →
  Weak-parser (⊕ᴰ Alph (λ c → ⊕ᴰ (P c) (λ p → Lit c)))
satisfy P-dec = any-char |> map-maybe
  (⊕ᴰ-elim (λ c → P-dec c |> Dec.rec
    (λ p → ⊕ᴰ-in p ⋆ ⊕ᴰ-in c ⋆ just)
    (λ _ → nothing)))

module _ {{alph-is-disc : Dec.Is-discrete Alph}} where

  char : (c : Alph) → Weak-parser (Lit c)
  char c = satisfy (c ≟_) |> map (⊕ᴰ-elim (λ c' → ⊕ᴰ-elim (J (λ c' p → Lit c' ⊢ Lit c) id)))

  One-of : List Alph → Lin
  One-of cs = ⊕ᴰ Alph (λ c → ⊕ᴰ (List.Elt cs c) (λ elt → Lit c))

  one-of : (cs : List Alph) → Weak-parser (One-of cs)
  one-of cs = satisfy (λ c → dec! (List.Elt cs c))

  None-of : List Alph → Lin
  None-of cs = ⊕ᴰ Alph (λ c → ⊕ᴰ (¬ List.Elt cs c) λ ¬elt → Lit c)

  none-of : (cs : List Alph) → Weak-parser (None-of cs)
  none-of cs = satisfy (λ c → dec! (¬ List.Elt cs c))

