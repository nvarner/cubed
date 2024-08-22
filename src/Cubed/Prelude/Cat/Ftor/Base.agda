module Cubed.Prelude.Cat.Ftor.Base where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Cat.Precat.Base

private
  variable
    ℓ ℓob ℓhom ℓob' ℓhom' : Level
    B C D E : Precat ℓob ℓhom


module Ftor where
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
        ftor-on-ob-map : Ftor-on ob-map

    record Ftor≡ (F G : Ftor) : Type (ℓob ⊔ ℓhom ⊔ ℓob' ⊔ ℓhom') where
      open Precat
      open Ftor
      open Ftor-on
      open is-ftor
      field
        ob-map : ∀ a → F .ob-map a ≡ G .ob-map a
        map : ∀ {a b} (f : C .hom a b) →
          PathP (λ i → D .hom (ob-map a i) (ob-map b i))
            (F .ftor-on-ob-map .map f) (G .ftor-on-ob-map .map f)
        map-id : ∀ {a} →
          PathP (λ i → map (C .id {a}) i ≡ D .id)
            (F .ftor-on-ob-map .has-is-ftor .map-id)
            (G .ftor-on-ob-map .has-is-ftor .map-id)
        map-seq : ∀ {a b c} {f : C .hom a b} {g : C .hom b c} →
          PathP (λ i → map (C .seq f g) i ≡ D .seq (map f i) (map g i))
            (F .ftor-on-ob-map .has-is-ftor .map-seq)
            (G .ftor-on-ob-map .has-is-ftor .map-seq)

  module _ where
    open Ftor
    open Ftor-on
    open is-ftor

    private
      variable
        F G : Ftor C D

    ≡→Ftor≡ : F ≡ G → Ftor≡ C D F G
    ≡→Ftor≡ p .Ftor≡.ob-map a i = p i .ob-map a
    ≡→Ftor≡ p .Ftor≡.map f i = p i .ftor-on-ob-map .map f
    ≡→Ftor≡ p .Ftor≡.map-id i = p i .ftor-on-ob-map .has-is-ftor .map-id
    ≡→Ftor≡ p .Ftor≡.map-seq i = p i .ftor-on-ob-map .has-is-ftor .map-seq

    Ftor≡→≡ : Ftor≡ C D F G → F ≡ G
    Ftor≡→≡ p i .ob-map a = p .Ftor≡.ob-map a i
    Ftor≡→≡ p i .ftor-on-ob-map .map f = p .Ftor≡.map f i
    Ftor≡→≡ p i .ftor-on-ob-map .has-is-ftor .map-id = p .Ftor≡.map-id i
    Ftor≡→≡ p i .ftor-on-ob-map .has-is-ftor .map-seq = p .Ftor≡.map-seq i


  module _ where
    open Ftor
    open Ftor-on
    open is-ftor

    id : Ftor C C
    id .ob-map = idfun
    id .ftor-on-ob-map .map = idfun
    id .ftor-on-ob-map .has-is-ftor .map-id = refl
    id .ftor-on-ob-map .has-is-ftor .map-seq = refl

    seq : Ftor C D → Ftor D E → Ftor C E
    seq F G .ob-map = G .ob-map ∘ F .ob-map
    seq F G .ftor-on-ob-map .map = G .ftor-on-ob-map .map ∘ F .ftor-on-ob-map .map
    seq F G .ftor-on-ob-map .has-is-ftor .map-id =
      cong (G .ftor-on-ob-map .map) (F .ftor-on-ob-map .has-is-ftor .map-id)
      ∙ G .ftor-on-ob-map .has-is-ftor .map-id
    seq F G .ftor-on-ob-map .has-is-ftor .map-seq =
      cong (G .ftor-on-ob-map .map) (F .ftor-on-ob-map .has-is-ftor .map-seq)
      ∙ G .ftor-on-ob-map .has-is-ftor .map-seq

    id-seq : {F : Ftor C D} → seq id F ≡ F
    id-seq {C = C} {D = D} {F = F} = Ftor≡→≡ p
      where
      p : Ftor≡ C D (seq id F) F
      p .Ftor≡.ob-map _ = refl
      p .Ftor≡.map _ = refl
      p .Ftor≡.map-id = ∙.id-l _
      p .Ftor≡.map-seq = ∙.id-l _

    seq-id : {F : Ftor C D} → seq F id ≡ F
    seq-id {C = C} {D = D} {F = F} = Ftor≡→≡ p
      where
      p : Ftor≡ C D (seq F id) F
      p .Ftor≡.ob-map _ = refl
      p .Ftor≡.map _ = refl
      p .Ftor≡.map-id = ∙.id-r _
      p .Ftor≡.map-seq = ∙.id-r _

    seq-assoc : (F : Ftor B C) (G : Ftor C D) (H : Ftor D E) →
      seq (seq F G) H ≡ seq F (seq G H)
    seq-assoc F G H = Ftor≡→≡ p
      where
      p : Ftor≡ _ _ (seq (seq F G) H) (seq F (seq G H))
      p .Ftor≡.ob-map _ = refl
      p .Ftor≡.map _ = refl
      p .Ftor≡.map-id =
        cong (_∙ _) (
          cong.along-∙ (H .ftor-on-ob-map .map)
          ∙ cong (_∙ _) (sym (cong.by-∘ (H .ftor-on-ob-map .map) (G .ftor-on-ob-map .map))))
        ∙ ∙.assoc _ _ _
      p .Ftor≡.map-seq =
        cong (_∙ _) (
          cong.along-∙ (H .ftor-on-ob-map .map)
          ∙ cong (_∙ _) (sym (cong.by-∘ (H .ftor-on-ob-map .map) (G .ftor-on-ob-map .map))))
        ∙ ∙.assoc _ _ _

open Ftor
  using (is-ftor ; Ftor-on ; Ftor)
  hiding (module Ftor)
  public

