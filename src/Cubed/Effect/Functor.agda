open import Cubed.Level

open import Cubed.Data.Prod.Base using (_×_; _,_; fst; snd)
open import Cubed.Data.Unit.Base using (Unit; tt)

open import Cubed.Fun.Base using (flip; const)


module Cubed.Effect.Functor where

private variable
  ℓ ℓ' : Level
  A B : Type _

record Raw-functor (F : Type ℓ → Type ℓ') : Type (lsuc ℓ ⊔ ℓ') where
  field
    map : (A → B) → (F A → F B)

  infixl 4 _<$>_
  _<$>_ : (A → B) → (F A → F B)
  _<$>_ = map

  infixl 1 _<&>_
  _<&>_ : F A → (A → B) → F B
  _<&>_ = flip map

  infixl 4 _<$_
  _<$_ : B → F A → F B
  b <$ Fa = const b <$> Fa

  infixl 4 _$>_
  _$>_ : F A → B → F B
  _$>_ = flip _<$_

  unzip : F (A × B) → F A × F B
  unzip x = (fst <$> x) , (snd <$> x)

  void : F A → F (Lift Unit)
  void = liftℓ tt <$_

open Raw-functor {{...}} public

