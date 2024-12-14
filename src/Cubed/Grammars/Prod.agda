open import Cubed.Level


module Cubed.Grammars.Prod {ℓ} (Alph : Type ℓ) where

open import Cubed.Grammars.Base Alph hiding (rec; map)

private variable
  A : Type ℓ
  G H K L : Lin
  Hᴰ : A → Lin

data Tag : Type ℓ where
  `fst `snd : Tag

infixr 5 _&_
_&_ : Lin → Lin → Lin
G & H = &ᴰ Tag (λ where
  `fst → G
  `snd → H)

infixr 4 _,&_
_,&_ : G ⊢ H → G ⊢ K → G ⊢ H & K
p ,& p' = &ᴰ-in (λ where
  `fst → p
  `snd → p')

fst : G & H ⊢ G
fst = &ᴰ-π `fst

snd : G & H ⊢ H
snd = &ᴰ-π `snd

bimap : G ⊢ H → K ⊢ L → G & K ⊢ H & L
bimap f g = fst ⋆ f ,& snd ⋆ g

map-fst : G ⊢ H → G & K ⊢ H & K
map-fst f = bimap f id

map-snd : G ⊢ H → K & G ⊢ K & H
map-snd f = bimap id f

