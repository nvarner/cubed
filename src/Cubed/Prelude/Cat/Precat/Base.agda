module Cubed.Prelude.Cat.Precat.Base where

open import Cubed.Core.Prelude


record Precat (ℓob ℓhom : Level) : Type (lsuc (ℓob ⊔ ℓhom)) where
  field
    ob : Type ℓob
    hom : ob → ob → Type ℓhom
    id : {a : ob} → hom a a
    seq : {a b c : ob} → hom a b → hom b c → hom a c
    id-seq : {a b : ob} {f : hom a b} →
      seq id f ≡ f
    seq-id : {a b : ob} {f : hom a b} →
      seq f id ≡ f
    seq-assoc : {a b c d : ob} (f : hom a b) (g : hom b c) (h : hom c d) →
      seq (seq f g) h ≡ seq f (seq g h)

