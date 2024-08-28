module Cubed.Prelude.Effect.Functor where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Cat.Instance.Types
open import Cubed.Prelude.Cat.Ftor.Base
open import Cubed.Prelude.Cat.Precat.Base

open Notation

private
  variable
    ℓ ℓ' : Level
    A B C : Type ℓ

TypeFtor : (Type ℓ → Type ℓ') → Type (lsuc ℓ ⊔ ℓ')
TypeFtor {ℓ} {ℓ'} = Ftor-on (Types ℓ) (Types ℓ')


module _ {F : Type ℓ → Type ℓ'} {{ftor : TypeFtor F}} where

  infixl 4 _<$>_ _<$_ _$>_
  infixl 1 _<&>_

  _<$>_ : (A → B) → F A → F B
  _<$>_ = Ftor-on.map ftor

  _<&>_ : F A → (A → B) → F B
  _<&>_ = flip _<$>_

  _<$_ : B → F A → F B
  b <$ Fa = const b <$> Fa

  _$>_ : F A → B → F B
  _$>_ = flip _<$_

  unzip : F (A × B) → F A × F B
  unzip x = (fst <$> x) , (snd <$> x)

  void : F A → F (Lift Types.⊤)
  void = lift tt <$_

