open import Cubed.Level

open import Cubed.Data.List.Base as List using (List; []; _∷_)
open import Cubed.Data.Prod.Base using (Σ; Σ-syntax; _×_; _,_; fst; snd)
open import Cubed.Data.Sum.Base as ⊎ using (_⊎_)
open import Cubed.Data.Unit.Base using (Unit; tt)

open import Cubed.Fun.Base as Fun using (_∘_; _|>_; const; uncurry')


module Cubed.Grammars.Sem-act {ℓ} (Alph : Type ℓ) where

open import Cubed.Grammars.Base Alph hiding (map)
open import Cubed.Grammars.Maybe Alph as Maybe using (Maybe; just; nothing)
open import Cubed.Grammars.Sum Alph as ⊕ using (_⊕_; inl; inr)

private variable
  A B : Type ℓ
  Bᴰ : A → Type ℓ
  G H K L : Lin
  Gᴰ : A → Lin

Δ : Type ℓ → Lin
Δ X = ⊕ᴰ X (const ⊤)

Δ-in : ⊕ᴰ A Gᴰ ⊢ Δ A
Δ-in = ⊕ᴰ-elim (λ a → ⊤-in ⋆ ⊕ᴰ-in a)

Δ-⊗⊤-r : ⊤ ⊗ Δ A ⊢ Δ A
Δ-⊗⊤-r = ⊕ᴰ-dist-r ⋆ ⊕ᴰ-map-g (const ⊤-in)

Sem-act : Lin → Type ℓ → Type (lsuc ℓ)
Sem-act G A = G ⊢ Δ A

pure : A → Sem-act G A
pure a = ⊤-in ⋆ ⊕ᴰ-in a

bind : Sem-act G A → (A → Sem-act H B) → Sem-act (G ⊗ H) B
bind x f =
  (x ,⊗ id)
  ⋆ ⊕ᴰ-dist-l
  ⋆ ⊕ᴰ-elim (λ a →
    (id ,⊗ f a)
    ⋆ Δ-⊗⊤-r)

map-g : G ⊢ H → Sem-act H A → Sem-act G A
map-g f x = f ⋆ x

map : (A → B) → Sem-act G A → Sem-act G B
map f x = x ⋆ ⊕ᴰ-map f

semact-Δ : Sem-act (Δ A) A
semact-Δ = id

semact-⊤ : Sem-act G (Lift Unit)
semact-⊤ = pure _

semact-⊥ : Sem-act ⊥ A
semact-⊥ = ⊥-elim

semact-&ᴰ : (a : A) → Sem-act (Gᴰ a) B → Sem-act (&ᴰ A Gᴰ) B
semact-&ᴰ a x = &ᴰ-π a ⋆ x

semact-⊕ᴰ : ((a : A) → Sem-act (Gᴰ a) (Bᴰ a)) → Sem-act (⊕ᴰ A Gᴰ) (Σ A Bᴰ)
semact-⊕ᴰ f = ⊕ᴰ-elim (λ a → map (a ,_) (f a))

semact-⊕ᴰ' : ((a : A) → Sem-act (Gᴰ a) B) → Sem-act (⊕ᴰ A Gᴰ) B
semact-⊕ᴰ' f = map snd (semact-⊕ᴰ f)

semact-⊗ : Sem-act G A → Sem-act H B → Sem-act (G ⊗ H) (A × B)
semact-⊗ x y = bind x (λ a → map (a ,_) y)

semact-left : Sem-act G A → Sem-act (G ⊗ H) A
semact-left x = map fst (semact-⊗ x semact-⊤)

semact-right : Sem-act H A → Sem-act (G ⊗ H) A
semact-right x = map snd (semact-⊗ semact-⊤ x)

semact-⊕ : Sem-act G A → Sem-act H A → Sem-act (G ⊕ H) A
semact-⊕ = ⊕.elim

semact-disjunct : Sem-act G A → Sem-act H B → Sem-act (G ⊕ H) (A ⊎ B)
semact-disjunct x y = semact-⊕ (map ⊎.inl x) (map ⊎.inr y)

semact-rec :
  {F : A → Functor A} →
  ((a : A) → F⟦ F a ⟧ (Δ ∘ Bᴰ) ⊢ Δ (Bᴰ a)) →
  (a : A) → Sem-act (μ F a) (Bᴰ a)
semact-rec = rec

semact-char : Sem-act Char Alph
semact-char = semact-⊕ᴰ' (λ c → pure c)

semact-* : Sem-act G A → Sem-act (G *) (List A)
semact-* x = semact-rec (λ _ → ⊕ᴰ-elim (λ where
  `nil → pure []
  `cons → map (uncurry' _∷_) (semact-⊗ x semact-Δ))) _

semact-string : Sem-act String (List Alph)
semact-string = semact-* semact-char

semact-underlying : Sem-act G (List Alph)
semact-underlying = map-g string-in semact-string

semact-surround : Sem-act H A → Sem-act (G ⊗ H ⊗ K) A
semact-surround x = semact-right (semact-left x)

