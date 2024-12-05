open import Cubed.Level

open import Cubed.Data.Dec.Base as Dec using (Dec)
open import Cubed.Data.Prod.Base using (_×_; _,_)
open import Cubed.Data.Unit.Base using (Unit; tt)

open import Cubed.Effect.Functor using (Raw-functor; _<$>_)

open import Cubed.Fun.Base using (flip; const; _|>_; _$_)

open import Cubed.Relation.Nullary.Neg.Base using (¬_)


module Cubed.Effect.Applicative where

private variable
  ℓ ℓ' : Level
  A B C : Type _

record Raw-applicative (F : Type ℓ → Type ℓ') : Type (lsuc ℓ ⊔ ℓ') where
  field
    overlap {{functor}} : Raw-functor F
    pure : A → F A
    seq : F (A → B) → (F A → F B)

  infixl 4 _<*>_
  _<*>_ : F (A → B) → (F A → F B)
  _<*>_ = seq

  infixl 4 _<*_
  _<*_ : F A → F B → F A
  Fa <* Fb = const <$> Fa <*> Fb

  infixl 4 _*>_
  _*>_ : F A → F B → F B
  Fa *> Fb = flip const <$> Fa <*> Fb

  zip-with : (A → B → C) → F A → F B → F C
  zip-with f Fa Fb = pure f <*> Fa <*> Fb

  zip : F A → F B → F (A × B)
  zip = zip-with _,_

  infixl 4 _<**>_
  _<**>_ : F A → F (A → B) → F B
  _<**>_ = zip-with _|>_

  when : Dec A → F (A → Lift Unit) → F (Lift Unit)
  when d f = d |> Dec.rec (λ a → f <*> pure a) (const $ pure $ liftℓ tt)

  unless : Dec A → F (¬ A → Lift Unit) → F (Lift Unit)
  unless d f = d |> Dec.rec (const $ pure $ liftℓ tt) (λ ¬a → f <*> pure ¬a)

open Raw-applicative {{...}} public hiding (functor)

