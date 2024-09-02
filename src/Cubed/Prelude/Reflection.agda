module Cubed.Prelude.Reflection where

open import Cubed.Core.Prelude
open import Cubed.Prelude.Effect

private variable
  ℓ : Level


open import Cubed.Core.Reflection public


open make-monad

private
  tc-monad-builder : make-monad {ℓ} TC
  tc-monad-builder .pure = TC.pure
  tc-monad-builder .bind = TC.bind
  tc-monad-builder .pure-bind = TC.pure-bind
  tc-monad-builder .bind-pure = TC.bind-pure
  tc-monad-builder .bind-assoc = TC.bind-assoc


instance
  inst-ftor : TypeFtor {ℓ} TC
  inst-ftor = →TypeFtor tc-monad-builder

  inst-applicative : Applicative {ℓ} TC
  inst-applicative = →Applicative tc-monad-builder

  inst-monad : Monad {ℓ} TC
  inst-monad = →Monad tc-monad-builder

