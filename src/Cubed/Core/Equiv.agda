open import Cubed.Core.Primitives
open import Cubed.Core.Glue
open import Cubed.Core.Types
open import Cubed.Core.Path

module Cubed.Core.Equiv where

private variable
  A B C : Type _
  f g : A → B

_∙-is-equiv_ : is-equiv f → is-equiv g → is-equiv (g ∘ f)
(f≃ ∙-is-equiv g≃) .has-equiv-proof y .fst .fst =
  f≃ .has-equiv-proof (g≃ .has-equiv-proof y .fst .fst) .fst .fst
(_∙-is-equiv_ {g = g} f≃ g≃) .has-equiv-proof y .fst .snd =
  cong g (f≃ .has-equiv-proof _ .fst .snd) ∙ g≃ .has-equiv-proof y .fst .snd
(f≃ ∙-is-equiv g≃) .has-equiv-proof y .snd y' i .fst = {!f≃ .has-equiv-proof!}
(f≃ ∙-is-equiv g≃) .has-equiv-proof y .snd y' i .snd = {!!}

_∙≃_ : A ≃ B → B ≃ C → A ≃ C
((f , f-is-equiv) ∙≃ (g , g-is-equiv)) .fst = g ∘ f
((f , f-is-equiv) ∙≃ (g , g-is-equiv)) .snd = f-is-equiv ∙-is-equiv g-is-equiv

