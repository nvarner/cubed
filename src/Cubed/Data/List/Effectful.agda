open import Cubed.Level

open import Cubed.Data.List.Base as List using (List; []; _∷_; [_])

open import Cubed.Effect.Semigroup
open import Cubed.Effect.Monoid

open import Cubed.Effect.Functor
open import Cubed.Effect.Applicative
open import Cubed.Effect.Monad

open import Cubed.Effect.Foldable
open import Cubed.Effect.Traversable


module Cubed.Data.List.Effectful where

private variable
  ℓ : Level
  A : Type _

instance semigroup : Raw-semigroup (List A)
semigroup = record
  { _<>_ = List._++_
  }

instance monoid : Raw-monoid (List A)
monoid = record
  { mempty = []
  }

instance functor : Raw-functor {ℓ = ℓ} List
functor = record
  { map = List.map
  }

instance applicative : Raw-applicative {ℓ = ℓ} List
applicative = record
  { pure = [_]
  ; seq = List.seq
  }

instance monad : Raw-monad {ℓ = ℓ} List
monad = record
  { bind = List.bind
  }

instance foldable : Raw-foldable {ℓ = ℓ} List
foldable = record
  { foldr = List.foldr
  ; foldl = List.foldl
  }

instance traversable : Raw-traversable {ℓ = ℓ} List
traversable = record
  { traverse = λ f → List.foldr
    (λ x acc → pure _∷_ <*> f x <*> acc)
    (pure [])
  }

