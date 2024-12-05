open import Cubed.Level

open import Cubed.Fun.Base using (id)

open import Cubed.Id.Base using (Id-sys)

open import Cubed.Path.Base as Path using (PathP; Path; _≡_; refl; J; path-to-refl)


module Cubed.Path.Id where

private variable
  A : Type _

instance id-sys : Id-sys A
id-sys = record
  { _≡ₛ_ = _≡_
  ; reflₛ = refl
  ; ≡ₛ→≡ = id
  ; path-to-reflₛ = path-to-refl
  }

{-# INCOHERENT id-sys #-}

