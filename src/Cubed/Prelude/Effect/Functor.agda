module Cubed.Prelude.Effect.Functor where

open import Cubed.Core.Prelude

private
  variable
    ℓ ℓ' : Level
    A B C : Type ℓ

record is-functor
  (F : Type ℓ → Type ℓ')
  (map : ∀ {A B} → (A → B) → F A → F B) :
  Type (lsuc ℓ ⊔ ℓ') where
  field
    map-id : (a : F A) →
      map idfun a ≡ idfun a
    map-comp : (f : B → C) (g : A → B) (a : F A) →
      map (f ∘ g) a ≡ (map f ∘ map g) a

record Functor (F : Type ℓ → Type ℓ') : Type (lsuc ℓ ⊔ ℓ') where
  field
    map : (A → B) → F A → F B
    has-is-functor : is-functor F map

  infixl 4 _<$>_ _<$_ _$>_
  infixl 1 _<&>_

  _<$>_ : (A → B) → F A → F B
  _<$>_ = map

  _<&>_ : F A → (A → B) → F B
  _<&>_ = flip _<$>_

  _<$_ : B → F A → F B
  _<$_ = map ∘ const

  _$>_ : F A → B → F B
  _$>_ = flip _<$_

  unzip : F (A × B) → F A × F B
  unzip x = (fst <$> x) , (snd <$> x)

  void : F A → F (Lift ⊤)
  void = lift tt <$_


record make-functor (F : Type ℓ → Type ℓ') : Type (lsuc ℓ ⊔ ℓ') where
  field
    map : (A → B) → F A → F B
    map-id : (a : F A) → map idfun a ≡ idfun a
    map-comp : (f : B → C) (g : A → B) (a : F A) → map (f ∘ g) a ≡ (map f ∘ map g) a

  →Functor : Functor F
  →Functor = record
    { map = map
    ; has-is-functor = record
      { map-id = map-id
      ; map-comp = map-comp
      }
    }


open Functor {{...}} public

