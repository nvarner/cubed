open import Cubed.Level


module Cubed.Grammars.Sum {ℓ} (Alph : Type ℓ) where

open import Cubed.Grammars.Base Alph hiding (rec; map)

private variable
  A : Type ℓ
  G H K L : Lin

data Tag : Type ℓ where
  `inl `inr : Tag

infixr 4 _⊕_
_⊕_ : Lin → Lin → Lin
G ⊕ H = ⊕ᴰ Tag (λ where
  `inl → G
  `inr → H)

infixr 4 _⊕F_
_⊕F_ : Functor A → Functor A → Functor A
F ⊕F F' = ⊕ᴰF Tag (λ where
  `inl → F
  `inr → F')

pattern inl = ⊕ᴰ-in `inl
pattern inr = ⊕ᴰ-in `inr

elim : G ⊢ K → H ⊢ K → G ⊕ H ⊢ K
elim p p' = ⊕ᴰ-elim (λ where
  `inl → p
  `inr → p')

bimap : G ⊢ H → K ⊢ L → G ⊕ K ⊢ H ⊕ L
bimap f g = elim (f ⋆ inl) (g ⋆ inr)

map-l : G ⊢ H → G ⊕ K ⊢ H ⊕ K
map-l f = bimap f id

map-r : H ⊢ K → G ⊕ H ⊢ G ⊕ K
map-r f = bimap id f

bind-l : G ⊢ H ⊕ K → G ⊕ K ⊢ H ⊕ K
bind-l f = elim f inr

bind-r : H ⊢ G ⊕ K → G ⊕ H ⊢ G ⊕ K
bind-r f = elim inl f

