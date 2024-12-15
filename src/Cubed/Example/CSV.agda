open import Cubed.Level

open import Cubed.Data.Char.Base renaming (Char to Unicode-char)
open import Cubed.Data.Char.Properties using ()
open import Cubed.Data.Dec.Base using (Dec; yes; no; _≟_)
open import Cubed.Data.List.Base as List using (List; []; _∷_; [_]; _++_)
open import Cubed.Data.Maybe.Base as Maybe using (Maybe; just; nothing)
open import Cubed.Data.Nat.Base as Nat using (Nat; zero; suc)
open import Cubed.Data.Prod.Base using (Σ; Σ-syntax; _×_; _,_; fst; snd)
open import Cubed.Data.String.Base as String using ()
open import Cubed.Data.Unit.Base using (Unit; tt)

open import Cubed.Fun.Base as Fun using (_|>_; uncurry')


open import Cubed.Grammars.Base Unicode-char hiding (map)
open import Cubed.Grammars.Sum Unicode-char
open import Cubed.Grammars.Parser-combinator Unicode-char as Parser hiding (pure; map)
open import Cubed.Grammars.Sem-act Unicode-char as Sem-act hiding (pure; bind; map; map-g)
open import Cubed.Grammars.Semantics Unicode-char


module Cubed.Example.CSV where

module Concrete where
  Quoted-lit = None-of [ '"' ] ⊕ (Lit '"' ⊗ Lit '"')
  quoted-lit : Weak-parser Quoted-lit
  quoted-lit = none-of [ '"' ] <⊕> (char '"' <⊗> char '"')

  Quoted-field = Lit '"' ⊗ Quoted-lit * ⊗ Lit '"'
  quoted-field : Weak-parser Quoted-field
  quoted-field = char '"' <⊗> many quoted-lit <⊗> char '"'

  Unquoted-lit = None-of ('\n' ∷ '\"' ∷ [ ',' ])
  unquoted-lit : Weak-parser Unquoted-lit
  unquoted-lit = none-of ('\n' ∷ '"' ∷ ',' ∷ [])

  Unquoted-field = Unquoted-lit *
  unquoted-field : Weak-parser Unquoted-field
  unquoted-field = many unquoted-lit

  Field = Quoted-field ⊕ Unquoted-field
  field' : Weak-parser Field
  field' = quoted-field <⊕> unquoted-field

  Nonempty-line = Field ⊗ (Lit ',' ⊗ Field) *
  nonempty-line : Weak-parser Nonempty-line
  nonempty-line = field' <⊗> many (char ',' <⊗> field')

  Line = (Nonempty-line ⊕ ε) ⊗ Lit '\n'
  line : Weak-parser Line
  line = (nonempty-line <⊕> Parser.pure) <⊗> char '\n'

  Cst = Line *
  cst : Weak-parser Cst
  cst = many line

module Abstract where
  Field = List Unicode-char
  Line = List Field
  Ast = List Line

module Concrete→Abstract where
  quoted-lit : Sem-act Concrete.Quoted-lit Unicode-char
  quoted-lit = semact-⊕ (semact-⊕ᴰ' (λ c → Sem-act.pure c)) (Sem-act.pure '"')

  quoted-field : Sem-act Concrete.Quoted-field Abstract.Field
  quoted-field = semact-surround (semact-* quoted-lit)

  unquoted-field : Sem-act Concrete.Unquoted-field Abstract.Field
  unquoted-field = semact-underlying

  field' : Sem-act Concrete.Field Abstract.Field
  field' = semact-⊕ quoted-field unquoted-field

  nonempty-line : Sem-act Concrete.Nonempty-line Abstract.Line
  nonempty-line = Sem-act.map (uncurry' _∷_) (semact-⊗ field' (semact-* (semact-right field')))

  line : Sem-act Concrete.Line Abstract.Line
  line = semact-left (semact-⊕ nonempty-line (Sem-act.pure []))

  ast : Sem-act Concrete.Cst Abstract.Ast
  ast = semact-* line

parser : Weak-parser (Δ Abstract.Ast)
parser = Parser.map Concrete→Abstract.ast Concrete.cst

module Test where
  csv1 : List Unicode-char
  csv1 = String.to-list "a,\"b,x,y\",c\ne,f,g\n"

  csv1-ast : Maybe Abstract.Ast
  csv1-ast = run-weak-parser-Δ parser csv1

open import Cubed.Effect
open import Cubed.IO.Base as IO using (IO; put-str-ln; get-line; get-args)

stringify-line : Abstract.Line → String.String
stringify-line [] = "\n"
stringify-line (x ∷ line) = String.from-list x String.++ "; " String.++ stringify-line line

stringify : Abstract.Ast → String.String
stringify [] = ""
stringify (line ∷ ast) = stringify-line line String.++ stringify ast

print-csv : Abstract.Ast → IO Unit
print-csv csv = do
  put-str-ln ("num rows: " String.++ Nat.show (List.length csv))
  put-str-ln (stringify csv)
  pure tt

main : IO Unit
main = do
  put-str-ln "csv:"
  Test.csv1-ast |> Maybe.rec
    (put-str-ln "failed to parse CSV")
    print-csv

  pure tt

