module Cubed.Core.Reflection where

open import Cubed.Core.Primitives
open import Cubed.Core.Builtin

import Agda.Builtin.Reflection as Reflection

private variable
  ℓ : Level
  A B C : Type ℓ


open Reflection public
  using ( Associativity
        ; left-assoc
        ; right-assoc
        ; non-assoc
        ; Precedence
        ; related
        ; unrelated
        ; Fixity)


module Name where
  open Reflection public
    using (Name)
    renaming
      ( primQNameEquality to _==_
      ; primShowQName to show
      ; primQNameFixity to fixity
      ; primQNameToWord64s to Name→Word64×Word64
      )

open Name using (Name) public


module Meta where
  open Reflection public
    using (Meta)
    renaming
      ( primMetaEquality to _==_
      ; primShowMeta to show
      ; primMetaToNat to Meta→Nat
      )

open Meta using (Meta) public


module Arg where
  open Reflection public
    using
      ( Arg
      ; arg
      ; Visibility
      ; visible
      ; hidden
      ; instance′
      ; Relevance
      ; relevant
      ; irrelevant
      ; Quantity
      ; quantity-0
      ; quantity-ω
      ; Modality
      ; modality
      )
    renaming
      ( ArgInfo to Info
      ; arg-info to info
      )

open Arg public
  using (Arg ; arg)
  hiding (module Arg)


open Reflection public
  using (Blocker)
  renaming
    ( blockerAny to any
    ; blockerAll to all
    ; blockerMeta to meta
    )


open Reflection public
  using (Abs ; abs)


open Reflection public
  using (Literal ; nat ; word64 ; float ; char ; string ; name ; meta)


open Reflection public
  using (Term ; var ; con ; def ; lam ; pat-lam ; pi ; agda-sort ; lit ; meta ; unknown)


open Reflection public
  using (Sort ; set ; lit ; prop ; inf ; unknown)
  renaming (propLit to prop-lit)


open Reflection public
  using (Pattern ; con ; dot ; var ; lit ; proj ; absurd)


open Reflection public
  using (Clause ; clause ; absurd-clause)


open Reflection public
  using (Type ; Telescope)


open Reflection public
  using (Definition ; function ; data-type ; record-type ; data-cons ; axiom ; prim-fun)


open Reflection public
  using (ErrorPart)
  renaming (strErr to str ; termErr to term ; pattErr to patt ; nameErr to name)


module TC where
  open Reflection public
    using (TC ; unify ; normalise ; reduce)
    renaming
      ( returnTC to pure
      ; bindTC to bind
      ; typeError to type-error
      ; inferType to infer-type
      ; checkType to check-type
      ; catchTC to catch
      ; quoteTC to quote′
      ; unquoteTC to unquote′
      ; quoteωTC to quoteω
      ; getContext to get-context
      ; extendContext to extend-context
      ; inContext to in-context
      ; freshName to fresh-name
      ; declareDef to declare-def
      ; declarePostulate to declare-postulate
      ; declareData to declare-data
      ; defineData to define-data
      ; defineFun to define-fun
      ; getType to get-type
      ; getDefinition to get-definition
      ; blockTC to block
      ; commitTC to commit
      -- ; isMacro to ?
      ; pragmaForeign to pragma-foreign
      ; pragmaCompile to pragma-compile
      ; withNormalisation to with-normalisation
      ; askNormalisation to ask-normalisation
      ; withReconstructed to with-reconstructed
      ; askReconstructed to ask-reconstructed
      ; withExpandLast to with-expand-last
      ; askExpandLast to ask-expand-last
      ; withReduceDefs to with-reduce-defs
      ; askReduceDefs to ask-reduce-defs
      ; formatErrorParts to format-error-parts
      ; debugPrint to debug-print
      ; noConstraints to no-constraints
      ; runSpeculative to run-speculative
      ; getInstances to get-instances
      ; blockOnMeta to block-on-meta
      )


  postulate
    pure-bind : (a : A) (f : A → TC B) → bind (pure a) f ≡ f a
    bind-pure : (a : TC A) → bind a pure ≡ a
    bind-assoc : (a : TC A) (f : A → TC B) (g : B → TC C) →
      bind a (λ a' → bind (f a') g) ≡ bind (bind a f) g


open TC using (TC) public

