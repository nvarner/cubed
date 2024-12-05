open import Cubed.Level

open import Cubed.Data.Prod.Base using (_×_)

open import Cubed.Effect.Monad.Id as Id using (Id)
open import Cubed.Effect.Monad.Reader.Trans as ReaderT using (ReaderT)


module Cubed.Effect.Monad.Reader.Base where

private variable
  ℓ : Level
  A R : Type _

Reader : (R : Type ℓ) (A : Type ℓ) → Type ℓ
Reader R = ReaderT R Id

run : Reader R A → R → A
run Ma s = Id.run (ReaderT.run Ma s)

