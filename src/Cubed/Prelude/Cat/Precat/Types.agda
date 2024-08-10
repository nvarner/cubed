module Cubed.Cat.Precat.Types where

open import Cubed.Prelude

open import Cubed.Cat.Precat.Base

Types : (ℓ : Level) → Precat (lsuc ℓ) ℓ
Types ℓ .Precat.ob = Type ℓ
Types ℓ .Precat.hom A B = A → B
Types ℓ .Precat.id = idfun
Types ℓ .Precat.seq f g x = g (f x)
Types ℓ .Precat.id-seq = refl
Types ℓ .Precat.seq-id = refl
Types ℓ .Precat.seq-assoc f g h = refl

TypeFtor : (ℓ ℓ' : Level) → Type (lsuc (ℓ ⊔ ℓ'))
TypeFtor ℓ ℓ' = Ftor (Types ℓ) (Types ℓ')

Mby : (ℓ : Level) → TypeFtor ℓ ℓ
Mby ℓ .Ftor.on-ob A = Maybe A
Mby ℓ .Ftor.on-hom f (just a) = just (f a)
Mby ℓ .Ftor.on-hom f nothing = nothing

TypeFtor' : {ℓ ℓ' : Level} (F : Type ℓ → Type ℓ') → Type (lsuc (ℓ ⊔ ℓ'))
TypeFtor' {ℓ} {ℓ'} F = Ftor-on (Types ℓ) (Types ℓ') F

MaybeFtor' : {ℓ : Level} → TypeFtor' {ℓ} Maybe
MaybeFtor' .Ftor-on.map f (just a) = just (f a)
MaybeFtor' .Ftor-on.map f nothing = nothing

