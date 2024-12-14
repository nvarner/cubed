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
  quoted-lit = none-of [ '"' ] <⊕> (char '"' <⊗> char '"')
  quoted-field = char '"' <⊗> many quoted-lit <⊗> char '"'
  unquoted-lit = none-of ('\n' ∷ '"' ∷ ',' ∷ [])
  unquoted-field = many unquoted-lit
  field' = unquoted-field <⊕> quoted-field
  nonempty-line = field' <⊗> many (char ',' <⊗> field')
  line = (nonempty-line <⊕> Parser.pure) <⊗> char '\n'
  cst = many line

module Abstract where
  Field = List Unicode-char
  Line = List Field
  AST = List Line

module Concrete→Abstract where
  quoted-lit : Sem-act (grammar-of Concrete.quoted-lit) Unicode-char
  quoted-lit = semact-⊕ (semact-⊕ᴰ' (λ c → Sem-act.pure c)) (Sem-act.pure '"')

  quoted-field : Sem-act (grammar-of Concrete.quoted-field) Abstract.Field
  quoted-field = semact-surround (semact-* quoted-lit)

  unquoted-field : Sem-act (grammar-of Concrete.unquoted-field) Abstract.Field
  unquoted-field = semact-underlying

  field' : Sem-act (grammar-of Concrete.field') Abstract.Field
  field' = semact-⊕ unquoted-field quoted-field

  nonempty-line : Sem-act (grammar-of Concrete.nonempty-line) Abstract.Line
  nonempty-line = Sem-act.map (uncurry' _∷_) (semact-⊗ field' (semact-* (semact-right field')))

  line : Sem-act (grammar-of Concrete.line) Abstract.Line
  line = semact-left (semact-⊕ nonempty-line (Sem-act.pure []))

  ast : Sem-act (grammar-of Concrete.cst) Abstract.AST
  ast = semact-* line

parser : Weak-parser (Δ Abstract.AST)
parser = Parser.map Concrete→Abstract.ast Concrete.cst

module Test where
  csv1 : List Unicode-char
  csv1 = String.to-list "a,\"b,x,y\",c\ne,f,g\n"

  csv1-ast : Maybe Abstract.AST
  csv1-ast = run-weak-parser-Δ parser csv1

  small : List Unicode-char
  small = String.to-list "\"testing\""

  small-c = run-weak-parser-Δ-partial (Parser.map semact-underlying (Concrete.unquoted-field <⊕> rest)) small

open import Cubed.Effect
open import Cubed.IO.Base as IO using (IO; put-str-ln; get-line; get-args)

stringify-line : Abstract.Line → String.String
stringify-line [] = "\n"
stringify-line (x ∷ line) = String.from-list x String.++ " and also " String.++ stringify-line line

stringify : Abstract.AST → String.String
stringify [] = ""
stringify (line ∷ ast) = stringify-line line String.++ stringify ast

print-csv : Abstract.AST → IO Unit
print-csv csv = do
  put-str-ln ("num rows: " String.++ Nat.show (List.length csv))
  put-str-ln (stringify csv)
  pure tt

main : IO Unit
main = do
  put-str-ln "small:"
  put-str-ln (Maybe.rec "failed to parse small" String.from-list (fst Test.small-c))
  put-str-ln ("rest: " String.++ String.from-list (snd Test.small-c))

  put-str-ln "\n\ncsv:"
  Test.csv1-ast |> Maybe.rec
    (put-str-ln "failed to parse CSV")
    print-csv

  pure tt

