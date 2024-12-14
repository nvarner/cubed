open import Cubed.Level


module Cubed.Grammars.Maybe {ℓ} (Alph : Type ℓ) where

open import Cubed.Grammars.Base Alph hiding (rec; map)
open import Cubed.Grammars.Prod Alph as & using (_&_; _,&_; fst; snd)

private variable
  G H : Lin

data Tag : Type ℓ where
  `just `nothing : Tag

Maybe : Lin → Lin
Maybe G = ⊕ᴰ Tag (λ where
  `just → G
  `nothing → ⊤)

just : G ⊢ Maybe G
just = ⊕ᴰ-in `just

nothing : H ⊢ Maybe G
nothing = ⊤-in ⋆ ⊕ᴰ-in `nothing

rec : G ⊢ H → ⊤ ⊢ H → Maybe G ⊢ H
rec j n = ⊕ᴰ-elim (λ where
  `just → j
  `nothing → n)

map : G ⊢ H → Maybe G ⊢ Maybe H
map f = rec (f ⋆ just) nothing

bind : G ⊢ Maybe H → Maybe G ⊢ Maybe H
bind f = rec f nothing

⊗l : Maybe G ⊗ H ⊢ Maybe (G ⊗ H)
⊗l = ⟜-in⁻ (rec (⟜-in just) (⟜-in nothing))

⊗r : G ⊗ Maybe H ⊢ Maybe (G ⊗ H)
⊗r = ⊸-in⁻ (rec (⊸-in just) (⊸-in nothing))

