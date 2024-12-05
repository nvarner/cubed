open import Cubed.Level

open import Cubed.Data.Prod.Base using (_×_)

open import Cubed.Effect.Monad.Id as Id using (Id)
open import Cubed.Effect.Monad.State.Trans.Base as StateT using (StateT)


module Cubed.Effect.Monad.State.Base where

private variable
  ℓ : Level
  A S : Type _

State : (S : Type ℓ) (A : Type ℓ) → Type ℓ
State S = StateT S Id

run : State S A → S → S × A
run Ma s = Id.run (StateT.run Ma s)

eval : State S A → S → A
eval Ma s = Id.run (StateT.eval Ma s)

exec : State S A → S → S
exec Ma s = Id.run (StateT.exec Ma s)

