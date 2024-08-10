module Cubed.Prelude.Cat.Precat.Base where

open import Cubed.Core.Prelude

private
  variable
    ℓob ℓhom ℓob' ℓhom' : Level


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


module _
  (C : Precat ℓob ℓhom)
  (D : Precat ℓob' ℓhom')
  where
  open Precat

  record is-ftor
    (F : C .ob → D .ob)
    (map : ∀ {a b} → C .hom a b → D .hom (F a) (F b)) :
    Type (ℓob ⊔ ℓhom ⊔ ℓhom') where
    field
      map-id : ∀ {a} →
        map (C .id {a}) ≡ D .id
      map-seq : ∀ {a b c} {f : C .hom a b} {g : C .hom b c} →
        map (C .seq f g) ≡ D .seq (map f) (map g)

  record Ftor-on
    (F : C .ob → D .ob) :
    Type (ℓob ⊔ ℓhom ⊔ ℓhom') where
    field
      map : {a b : C .ob} → C .hom a b → D .hom (F a) (F b)
      has-is-ftor : is-ftor F map

  record Ftor : Type (ℓob ⊔ ℓhom ⊔ ℓob' ⊔ ℓhom') where
    field
      ob-map : C .ob → D .ob
      map : {a b : C .ob} → C .hom a b → D .hom (ob-map a) (ob-map b)

