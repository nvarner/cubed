module Cubed.Grammars.LogicRules where

open import Cubed.Prelude


open Notation
open Agda using (TC)
open TC hiding (pure)


declare : Agda.Name → TC ⊤
declare Term-name = do
  Type′ ← quote′ Type
  declare-data Term-name 0 Type′
  let Term′ = Agda.def Term-name []

  T-is-T-name ← fresh-name "T-is-T"
  --define-data Term-name ((T-is-T-name , Agda.Arg.quantity-ω , Term′) ∷ [])
  define-data Term-name ((T-is-T-name , Term′) ∷ [])

  pure tt


module _ {ℓ : Level} where
  data Term : Type ℓ where
    ⊤Term ⊥Term : Term
    _+Term_ : Term → Term → Term

  Ctxt : Type ℓ
  Ctxt = List Term

  unquoteDecl data Judge = declare Judge

