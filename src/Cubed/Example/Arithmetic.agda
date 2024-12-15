open import Cubed.Level

open import Cubed.Data.Char.Base renaming (Char to Unicode-char)
open import Cubed.Data.Char.Properties using ()
open import Cubed.Data.List.Base as List using (List; []; _∷_; [_]; _++_)
open import Cubed.Data.Unit.Base using (Unit; tt)

open import Cubed.Fun.Base as Fun using (const)


open import Cubed.Grammars.Base Unicode-char hiding (map)
open import Cubed.Grammars.Helper Unicode-char
open import Cubed.Grammars.Sum Unicode-char as ⊕ using (_⊕_; _⊕F_; inl; inr)
open import Cubed.Grammars.Parser-combinator Unicode-char as Parser hiding (pure; map)
open import Cubed.Grammars.Sem-act Unicode-char as Sem-act hiding (pure; bind; map; map-g)
open import Cubed.Grammars.Semantics Unicode-char


module Cubed.Example.Arithmetic where

private variable
  A : Type lzero

module Concrete where
  Digit = One-of ('0' ∷ '1' ∷ '2' ∷ '3' ∷ '4' ∷ '5' ∷ '6' ∷ '7' ∷ '8' ∷ '9' ∷ [])
  Num = Digit +

  Plus = Lit '+'
  Times = Lit '*'

  *-ftor' : Lin → Functor Lin
  *-ftor' = ?

  --Expr = Chain1 (Chain1 ((Lit '(' ⊗ Expr ⊗ Lit ')') ⊕ Num) Times) Plus

  digit : Weak-parser Digit
  digit = one-of _

  num : Weak-parser Num
  num = many1 digit

  plus : Weak-parser Plus
  plus = char '+'

  times : Weak-parser Times
  times = char '*'

