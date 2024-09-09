module Cubed.Core.Types.Cat where

open import Cubed.Core.Primitives
open import Cubed.Core.Cat.Base
open import Cubed.Core.Types.Base


module _ ℓ where
  open Cat-raw

  Types : Cat-raw (ℓsuc ℓ)
  Types .Ob = Type ℓ
  Types .Hom A B = Lift (A → B) _
  Types .seq (ℓ↑ f) (ℓ↑ g) .ℓ↓ a = g (f a)


instance
  open Has-terminal
  open Is-terminal

  inst-Types-lzero-has-terminal : Has-terminal

  inst-Types-has-terminal : ∀ {ℓ} → Has-terminal (Types ℓ)
  inst-Types-has-terminal .⊤ = Lift Unit _
  inst-Types-has-terminal .⊤-is-terminal .univ-prop y .fst .ℓ↓ x = ℓ↑ *
  inst-Types-has-terminal .⊤-is-terminal .univ-prop y .snd g i .ℓ↓ x = ℓ↑ *

  open Has-initial
  open Is-initial

  inst-Types-has-initial : ∀ {ℓ} → Has-initial (Types ℓ)
  inst-Types-has-initial .⊥ = Lift Void _
  inst-Types-has-initial .⊥-is-initial .univ-prop y .fst .ℓ↓ ()
  inst-Types-has-initial .⊥-is-initial .univ-prop y .snd g i .ℓ↓ ()

  inst-Types-has-products-raw : ∀ {ℓ} → Has-products-raw (Types ℓ)
  inst-Types-has-products-raw .Has-products-raw._×_ = Product

