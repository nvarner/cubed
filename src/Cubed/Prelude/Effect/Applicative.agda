module Cubed.Prelude.Effect.Applicative where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Cat.Precat.Base
open import Cubed.Prelude.Cat.Ftor.Base

open import Cubed.Prelude.Data.Dec.Base

open import Cubed.Prelude.Effect.Functor

private
  variable
    ℓ ℓ' : Level
    A B C : Type ℓ


record is-applicative
  (F : Type ℓ → Type ℓ')
  (pure : ∀ {A} → A → F A)
  (seq : ∀ {A B} → F (A → B) → F A → F B)
  (has-functor : TypeFtor F) :
  Type (lsuc ℓ ⊔ ℓ') where
  instance _ = has-functor
  field
    seq-id : (a : F A) →
      seq (pure idfun) a ≡ a
    seq-comp : (f : F (B → C)) (g : F (A → B)) (a : F A) →
      seq (seq (seq (pure _∘S_) f) g) a ≡ seq f (seq g a)
    seq-hom : (f : A → B) (a : A) →
      seq (pure f) (pure a) ≡ pure (f a)
    seq-interchange : (f : F (A → B)) (a : A) →
      seq f (pure a) ≡ seq (pure (_$ a)) f
    map-seq : (f : A → B) (a : F A) →
      (f <$> a) ≡ seq (pure f) a


record Applicative
  (F : Type ℓ → Type ℓ') :
  Type (lsuc ℓ ⊔ ℓ') where
  field
    overlap {{has-functor}} : TypeFtor F
    pure : A → F A
    seq : F (A → B) → F A → F B
    has-is-applicative : is-applicative F pure seq has-functor

  infixl 4 _<*>_ _<*_ _*>_ _<**>_

  _<*>_ : F (A → B) → F A → F B
  _<*>_ = seq

  _<*_ : F A → F B → F A
  a <* b = const <$> a <*> b

  _*>_ : F A → F B → F B
  a *> b = flip const <$> a <*> b

  zip-with : (A → B → C) → F A → F B → F C
  zip-with f a b = pure f <*> a <*> b

  zip : F A → F B → F (A × B)
  zip = zip-with _,_

  _<**>_ : F A → F (A → B) → F B
  _<**>_ = zip-with _&_

  when : Dec A → F (A → ⊤) → F ⊤
  when d f = d & Dec.rec (λ a → f <*> pure a) (const $ pure $ lift tt)

  unless : Dec A → F (¬ A → ⊤) → F ⊤
  unless d f = d & Dec.rec (const $ pure $ lift tt) (λ ¬a → f <*> pure ¬a)


record make-applicative (F : Type ℓ → Type ℓ') : Type (lsuc ℓ ⊔ ℓ') where
  field
    pure : A → F A
    seq : F (A → B) → F A → F B
    seq-id : (a : F A) → seq (pure idfun) a ≡ a
    seq-comp : (f : F (B → C)) (g : F (A → B)) (a : F A) →
      seq (seq (seq (pure _∘S_) f) g) a ≡ seq f (seq g a)
    seq-hom : (f : A → B) (a : A) → seq (pure f) (pure a) ≡ pure (f a)
    seq-interchange : (f : F (A → B)) (a : A) → seq f (pure a) ≡ seq (pure (_$ a)) f

  open Ftor-on

  →TypeFtor : TypeFtor F
  →TypeFtor = record
    { map = λ f → seq (pure f)
    ; has-is-ftor = record
      { map-id = funext seq-id
      ; map-seq = funext (λ Fa →
        (sym ∘ cong (flip seq _) $ cong (flip seq _) (seq-hom _ _) ∙ seq-hom _ _)
        ∙ seq-comp _ _ _)
      }
    }

  →Applicative : Applicative F
  →Applicative = record
    { has-functor = →TypeFtor
    ; pure = pure
    ; seq = seq
    ; has-is-applicative = record
      { seq-id = seq-id
      ; seq-comp = seq-comp
      ; seq-hom = seq-hom
      ; seq-interchange = seq-interchange
      ; map-seq = λ f a → refl
      }
    }


open Applicative {{...}} public

