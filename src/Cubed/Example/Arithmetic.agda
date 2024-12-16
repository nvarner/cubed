open import Cubed.Level

open import Cubed.Data.Char.Base renaming (Char to Unicode-char)
open import Cubed.Data.Char.Properties using ()
open import Cubed.Data.List.Base as List using (List; []; _∷_; [_]; _++_)
open import Cubed.Data.Maybe.Base as Maybe using (Maybe; just; nothing)
open import Cubed.Data.Nat.Base as Nat using (Nat; zero; suc; _+_; _*_)
open import Cubed.Data.Prod.Base using (_×_; _,_; fst; snd)
open import Cubed.Data.String.Base as String using ()
open import Cubed.Data.Unit.Base using (Unit; tt)

open import Cubed.Fun.Base as Fun using (const; uncurry'; _$_; _|>_; _∘_)


open import Cubed.Grammars.Base Unicode-char as Grammars hiding (map)
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
    All-ftor `Base _ = ⊕ᴰ ⊕.Tag λ { ⊕.`inl → k Num ; ⊕.`inr → k (Lit '(') ⊗ Var `Plus _ ⊗ k (Lit ')') }

    Idx `Times = Lift Unit
    All-ftor `Times _ = Var `Base _ ⊗ Var `Times0 _

    Idx `Times0 = Lift Unit
    All-ftor `Times0 _ = ⊕ᴰ ⊕.Tag λ { ⊕.`inl → k Times-op ⊗ Var `Base _ ⊗ Var `Times0 _ ; ⊕.`inr → k ε }

    Idx `Plus = Lift Unit
    All-ftor `Plus _ = Var `Times _ ⊗ Var `Plus0 _

    Idx `Plus0 = Lift Unit
    All-ftor `Plus0 _ = ⊕ᴰ ⊕.Tag λ { ⊕.`inl → k Plus-op ⊗ Var `Times _ ⊗ Var `Plus0 _ ; ⊕.`inr → k ε }

  All-grammar = μ-mutual All-ftor

  Base = All-grammar `Base _
  Times = All-grammar `Times _
  Times0 = All-grammar `Times0 _
  Plus = All-grammar `Plus _
  Plus0 = All-grammar `Plus0 _

  Cst = Plus

  base-num : Num ⊢ Base
  base-num = ⊕ᴰ-in ⊕.`inl ⋆ roll

  base-paren : Lit '(' ⊗ Plus ⊗ Lit ')' ⊢ Base
  base-paren = ⊕ᴰ-in ⊕.`inr ⋆ roll

  times0-in : (Times-op ⊗ Base) * ⊢ Times0
  times0-in = rec (λ _ → ⊕ᴰ-elim λ { `nil → ⊕ᴰ-in ⊕.`inr ; `cons → ⊗-map-r roll ⋆ ⊗-assoc⁻ ⋆ ⊕ᴰ-in ⊕.`inl }) _ ⋆ roll

  times-in : Base ⊗ (Times-op ⊗ Base) * ⊢ Times
  times-in = ⊗-map-r times0-in ⋆ roll

  plus0-in : (Plus-op ⊗ Times) * ⊢ Plus0
  plus0-in = rec (λ _ → ⊕ᴰ-elim λ { `nil → ⊕ᴰ-in ⊕.`inr ; `cons → ⊗-map-r roll ⋆ ⊗-assoc⁻ ⋆ ⊕ᴰ-in ⊕.`inl }) _ ⋆ roll

  plus-in : Times ⊗ (Plus-op ⊗ Times) * ⊢ Plus
  plus-in = ⊗-map-r plus0-in ⋆ roll

  digit : Weak-parser Digit
  digit = one-of _

  num : Weak-parser Num
  num = many1 digit

  plus-op : Weak-parser Plus-op
  plus-op = char '+'

  times-op : Weak-parser Times-op
  times-op = char '*'

  {-# NON_TERMINATING #-}
  base : Weak-parser Base
  times : Weak-parser Times
  plus : Weak-parser Plus

  base = Parser.map base-num num <|> Parser.map base-paren (char '(' <⊗> plus <⊗> char ')')

  times = Parser.map times-in (base <⊗> many (times-op <⊗> base))

  plus = Parser.map plus-in (times <⊗> many (plus-op <⊗> times))

  parser = plus

module Eval where
  eval-digit : Sem-act Concrete.Digit Nat
  eval-digit = semact-⊕ᴰ' (λ c → semact-⊕ᴰ' (Sem-act.pure ∘ List.elt-index))

  eval-num : Sem-act Concrete.Num Nat
  eval-num =
    semact-⊗ eval-digit (semact-* eval-digit)
    |> Sem-act.map (λ (msd , digs) → List.foldl (λ acc d → 10 * acc + d) msd digs)

  eval : Sem-act Concrete.Cst Nat
  eval = semact-rec {Bᴰ = const Nat} (λ where
    (Concrete.`Base , _) → ⊕ᴰ-elim (λ where
      ⊕.`inl → eval-num
      ⊕.`inr → semact-surround semact-Δ)
    (Concrete.`Times , _) → semact-⊗ semact-Δ semact-Δ |> Sem-act.map (uncurry' _*_)
    (Concrete.`Times0 , _) → ⊕ᴰ-elim (λ where
      ⊕.`inl → semact-right $ semact-⊗ semact-Δ semact-Δ |> Sem-act.map (uncurry' _*_)
      ⊕.`inr → Sem-act.pure 1)
    (Concrete.`Plus , _) → semact-⊗ semact-Δ semact-Δ |> Sem-act.map (uncurry' _+_)
    (Concrete.`Plus0 , _) → ⊕ᴰ-elim (λ where
      ⊕.`inl → semact-right $ semact-⊗ semact-Δ semact-Δ |> Sem-act.map (uncurry' _+_)
      ⊕.`inr → Sem-act.pure 0))
    (Concrete.`Plus , _)

open import Cubed.Effect
open import Cubed.IO.Base as IO using (IO; put-str-ln; get-line)

main : IO Unit
main = do
  input ← String.to-list <$> get-line

  let result = run-weak-parser-Δ (Parser.map Eval.eval Concrete.parser) input
  result |> Maybe.rec (put-str-ln "failed to evaluate arithmetic") (put-str-ln ∘ Nat.show)

  pure tt

