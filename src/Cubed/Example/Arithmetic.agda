open import Cubed.Level

open import Cubed.Data.Char.Base renaming (Char to Unicode-char)
open import Cubed.Data.Char.Properties using ()
open import Cubed.Data.List.Base as List using (List; []; _∷_; [_]; _++_)
open import Cubed.Data.Unit.Base using (Unit; tt)

open import Cubed.Fun.Base as Fun using (const)


open import Cubed.Grammars.Base Unicode-char hiding (map)
open import Cubed.Grammars.Mutual Unicode-char
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

  Plus-op = Lit '+'
  Times-op = Lit '*'

  data Branch : Type lzero where
    `Base `Times `Times0 `Plus `Plus0 : Branch

  interleaved mutual
    Idx : Branch → Type lzero
    All-ftor : (branch : Branch) → Idx branch → Mutual-functor Branch Idx

    Idx `Base = Lift Unit
    All-ftor `Base _ = k (Lit '(') ⊗ Var `Plus _ ⊗ k (Lit ')')

    Idx `Times = Lift Unit
    All-ftor `Times _ = Var `Base _ ⊗ Var `Times0 _

    Idx `Times0 = Lift Unit
    All-ftor `Times0 _ = ⊕ᴰ ⊕.Tag λ { ⊕.`inl → k Times-op ⊗ k Num ⊗ Var `Times0 _ ; ⊕.`inr → k ε }

    Idx `Plus = Lift Unit
    All-ftor `Plus _ = Var `Times _ ⊗ Var `Plus0 _

    Idx `Plus0 = Lift Unit
    All-ftor `Plus0 _ = ⊕ᴰ ⊕.Tag λ { ⊕.`inl → k Plus-op ⊗ Var `Plus _ ⊗ Var `Plus0 _ ; ⊕.`inr → k ε }

  All-grammar = μ-mutual All-ftor

  Base = All-grammar `Base _
  Times = All-grammar `Times _
  Plus = All-grammar `Plus _

  digit : Weak-parser Digit
  digit = one-of _

  num : Weak-parser Num
  num = many1 digit

  plus-op : Weak-parser Plus-op
  plus-op = char '+'

  times-op : Weak-parser Times-op
  times-op = char '*'

