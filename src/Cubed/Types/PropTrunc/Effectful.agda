module Cubed.Prelude.Types.PropTrunc.Effectful where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Effect

open import Cubed.Prelude.HLevel.Base

open import Cubed.Prelude.Types.PropTrunc.Base

module _ {ℓ : Level} where

  private
    monad-factory : make-monad {ℓ} ∥_∥
    monad-factory = record
      { pure = ∣_∣
      ; bind = PropTrunc.rec _&_ (→-is-prop squash)
      ; pure-bind = λ a f → refl
      ; bind-pure = λ ∣a∣ → squash _ _
      ; bind-assoc = λ ∣a∣ f g → squash _ _
      }

  instance
    _ : Functor ∥_∥
    _ = make-monad.→Functor monad-factory

    _ : Applicative ∥_∥
    _ = make-monad.→Applicative monad-factory

    _ : Monad ∥_∥
    _ = make-monad.→Monad monad-factory

