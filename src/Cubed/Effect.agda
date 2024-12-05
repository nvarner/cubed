module Cubed.Effect where

open import Cubed.Effect.Semigroup public
open import Cubed.Effect.Monoid public

open import Cubed.Effect.Functor public
open import Cubed.Effect.Applicative public
open import Cubed.Effect.Monad public

open import Cubed.Effect.Foldable public
open import Cubed.Effect.Traversable public

-- This allows instance search to find instances defined in these modules,
-- whereas `import ... as ...` does not seem to
module Id where open import Cubed.Effect.Monad.Id public
module State where open import Cubed.Effect.Monad.State.Base public
module StateT where open import Cubed.Effect.Monad.State.Trans.Base public
module Reader where open import Cubed.Effect.Monad.Reader.Base public
module ReaderT where open import Cubed.Effect.Monad.Reader.Trans public

module IO where open import Cubed.IO.Effectful public

module List where open import Cubed.Data.List.Effectful public
module Maybe where open import Cubed.Data.Maybe.Effectful public
module String where open import Cubed.Data.String.Effectful public

