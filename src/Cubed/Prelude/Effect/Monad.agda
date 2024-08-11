module Cubed.Prelude.Effect.Monad where

open import Cubed.Core.Prelude

open import Cubed.Prelude.Effect.Applicative hiding (pure)
open import Cubed.Prelude.Effect.Functor

private
  variable
    ℓ ℓ' : Level
    A B C : Type ℓ


module _ where
  open import Cubed.Prelude.Effect.Applicative

  record is-monad
    (F : Type ℓ → Type ℓ')
    (bind : ∀ {A B} → F A → (A → F B) → F B)
    (has-applicative : Applicative F) :
    Type (lsuc ℓ ⊔ ℓ') where
    instance
      _ = has-functor
      _ = has-applicative
    field
      pure-bind : (a : A) (f : A → F B) →
        bind (pure a) f ≡ f a
      bind-pure : (a : F A) →
        bind a pure ≡ a
      bind-assoc : (a : F A) (f : A → F B) (g : B → F C) →
        bind a (λ a → bind (f a) g) ≡ bind (bind a f) g
      seq-bind : (f : F (A → B)) (a : F A) →
        (f <*> a) ≡ bind f (λ f → bind a (λ a → pure (f a)))


record Monad
  (F : Type ℓ → Type ℓ') :
  Type (lsuc ℓ ⊔ ℓ') where
  field
    {{has-applicative}} : Applicative F
    bind : F A → (A → F B) → F B
    has-is-monad : is-monad F bind has-applicative

  infixl 1 _>>=_ _>>_
  infixr 1 _=<<_ _>=>_ _<=<_

  _>>=_ : F A → (A → F B) → F B
  _>>=_ = bind

  _>>_ : F A → F B → F B
  a >> b = a >>= const b

  _=<<_ : (A → F B) → F A → F B
  _=<<_ = flip bind

  _>=>_ : (A → F B) → (B → F C) → A → F C
  (f >=> g) a = f a >>= g

  _<=<_ : (B → F C) → (A → F B) → A → F C
  _<=<_ = flip _>=>_


record make-monad (F : Type ℓ → Type ℓ') : Type (lsuc ℓ ⊔ ℓ') where
  field
    pure : A → F A
    bind : F A → (A → F B) → F B
    pure-bind : (a : A) (f : A → F B) →
      bind (pure a) f ≡ f a
    bind-pure : (a : F A) →
      bind a pure ≡ a
    bind-assoc : (a : F A) (f : A → F B) (g : B → F C) →
      bind a (λ a → bind (f a) g) ≡ bind (bind a f) g

  private
    applicative-factory : make-applicative F
    applicative-factory = record
      { pure = pure
      ; seq = λ f a → bind f (λ f → bind a (λ a → pure (f a)))
      ; seq-id = λ a → pure-bind _ _ ∙ bind-pure _
      ; seq-comp = λ Ff Fg Fa →
        cong
          (λ x → bind
            (bind x (λ f∘_ → bind Fg (λ g → pure (f∘ g))))
            (λ f∘g → bind Fa (λ a → pure (f∘g a))))
          (pure-bind _∘S_ (λ _∘S'_ → bind Ff (λ f → pure (f ∘S'_))))
        ∙ cong (λ x → bind x (λ f∘g → bind Fa (λ a → pure (f∘g a))))
          (sym (bind-assoc Ff _ _))
        ∙ sym (bind-assoc Ff _ _)
        ∙ cong (bind Ff) (funext (λ f →
          cong (λ x → bind x (λ f∘g → bind Fa (λ a → pure (f∘g a))))
            (pure-bind _ _)
          ∙ sym (bind-assoc Fg (λ g → pure (λ a → f (g a))) (λ f∘g → bind Fa (λ a → pure (f∘g a))))
          ∙ cong (bind Fg) (funext (λ g →
            pure-bind _ _
            ∙ cong (bind Fa) (funext (λ a →
              sym (pure-bind _ _)))
            ∙ bind-assoc Fa _ _))
          ∙ bind-assoc Fg (λ g → bind Fa (λ a → pure (g a))) (λ a → pure (f a))))
      ; seq-hom = λ f a → pure-bind _ _ ∙ pure-bind _ _
      ; seq-interchange = λ Ff a →
        cong (bind Ff) (funext (λ f → pure-bind _ _))
        ∙ sym (pure-bind _ _)
      }

  →TypeFtor : TypeFtor F
  →TypeFtor = make-applicative.→TypeFtor applicative-factory

  →Applicative : Applicative F
  →Applicative = make-applicative.→Applicative applicative-factory

  →Monad : Monad F
  →Monad = record
    { has-applicative = →Applicative
    ; bind = bind
    ; has-is-monad = record
      { pure-bind = pure-bind
      ; bind-pure = bind-pure
      ; bind-assoc = bind-assoc
      ; seq-bind = λ f a → refl
      }
    }


open Monad {{...}} public


module _
  {F : Type ℓ → Type ℓ}
  {{_ : Monad F}}
  where

  join : F (F A) → F A
  join a = a >>= idfun

