open import Cubed.Level
open import Cubed.Effect

open import Cubed.Data.Maybe.Base as Maybe using (Maybe; just; nothing)
open import Cubed.Data.Prod.Base using (_×_; _,_; fst; snd)
open import Cubed.Data.Queue.Base as Queue using (IQueue)
open import Cubed.Data.Unit.Base using (Unit)

open import Cubed.Effect.Monad.Id using ()
open import Cubed.Effect.Monad.State.Base as State using (State)
open import Cubed.Effect.Monad.State.Trans.Base using (Raw-monad-state; get; put; gets; modify)

open import Cubed.Fun.Base using (_|>_)


module Cubed.Data.Queue.Effectful where

private variable
  ℓ : Level
  A Q : Type _

module _
  {M : Type (level A) → Type ℓ}
  {{iqueue : IQueue A Q}}
  {{monad-state : Raw-monad-state Q M}}
  where

  snoc : A → M (Lift Unit)
  snoc a = modify (Queue.snoc a)

  pop : {{Raw-monad M}} → M (Maybe A)
  pop = do
    q ← get
    Queue.pop q |> Maybe.rec
      (pure nothing)
      (λ (x , q') → do
        put q'
        pure (just x))
