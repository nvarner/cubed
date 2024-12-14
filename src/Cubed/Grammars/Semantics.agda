open import Cubed.Level

open import Cubed.Data.Empty.Base using (Empty)
open import Cubed.Data.List.Base as List using (List; []; _∷_; [_]; _++_)
open import Cubed.Data.List.Properties as List using (++-id-r; ++-assoc)
open import Cubed.Data.Maybe.Base as Maybe using (Maybe; just; nothing)
open import Cubed.Data.Prod.Base using (Σ; Σ-syntax; _×_; _,_; fst; snd; map-fst)
open import Cubed.Data.Unit.Base using (Unit; tt)

open import Cubed.Fun.Base as Fun using (_∘_; _|>_)

open import Cubed.Path.Base as Path using (_≡_; refl; _∙_; sym; cong; subst)


module Cubed.Grammars.Semantics {ℓ} (Alph : Type ℓ) where

open import Cubed.Grammars.Base Alph
open import Cubed.Grammars.Maybe Alph as Lin-maybe using ()
open import Cubed.Grammars.Parser-combinator Alph using (Weak-parser; finish)
open import Cubed.Grammars.Sem-act Alph as Sem-act using (Sem-act; Δ)

private variable
  A : Type ℓ
  G : Lin
  Gᴰ Hᴰ : A → Lin

Grammar : Type (lsuc ℓ)
Grammar = List Alph → Type ℓ

Parser : Grammar → Grammar → Type ℓ
Parser G H = (w : List Alph) → G w → H w

record Split (w : List Alph) : Type ℓ where
  constructor mk
  field
    left right : List Alph
    is-split : left ++ right ≡ w

open Split

split-right : (w : List Alph) → Split w
split-right w .left = []
split-right w .right = w
split-right w .is-split = refl

split-left : (w : List Alph) → Split w
split-left w .left = w
split-left w .right = []
split-left w .is-split = ++-id-r w

split-++ : (w w' : List Alph) → Split (w ++ w')
split-++ w w' .left = w
split-++ w w' .right = w'
split-++ w w' .is-split = refl

G⟦_⟧ : Lin → Grammar

{-# NO_POSITIVITY_CHECK #-}
data μ' (F : A → Functor A) (a : A) : Grammar where
  roll : (w : List Alph) → G⟦ F⟦ F a ⟧ (μ F) ⟧ w → μ' F a w

G⟦ ε ⟧ [] = Lift Unit
G⟦ ε ⟧ (x ∷ xs) = Lift Empty
G⟦ ⊤ ⟧ w = Lift Unit
G⟦ ⊥ ⟧ w = Lift Empty
G⟦ Lit c ⟧ [] = Lift Empty
G⟦ Lit c ⟧ (c' ∷ w) = c ≡ c'
G⟦ &ᴰ A f ⟧ w = (a : A) → G⟦ f a ⟧ w
G⟦ ⊕ᴰ A f ⟧ w = Σ[ a ∈ A ] G⟦ f a ⟧ w
G⟦ G ⊗ G' ⟧ w = Σ[ split ∈ Split w ] G⟦ G ⟧ (left split) × G⟦ G' ⟧ (right split)
G⟦ G ⊸ H ⟧ w = (w' : List _) → G⟦ G ⟧ w' → G⟦ H ⟧ (w' ++ w)
G⟦ G ⟜ H ⟧ w = (w' : List _) → G⟦ H ⟧ w' → G⟦ G ⟧ (w ++ w')
G⟦ μ F a ⟧ w = μ' F a w

internalize : (w : List Alph) → G⟦ String ⟧ w
internalize [] = roll [] (`nil , liftℓ tt)
internalize w@(c ∷ w') = roll w (`cons , (split-++ [ c ] w' , (c , refl) , internalize w'))

{-# TERMINATING #-}
t⟦_⟧ : {G H : Lin} → G ⊢ H → Parser G⟦ G ⟧ G⟦ H ⟧
t⟦ id ⟧ w = Fun.id
t⟦ t ⋆ t' ⟧ w = t⟦ t' ⟧ w ∘ t⟦ t ⟧ w
t⟦ ⊤-in ⟧ w p = liftℓ tt
t⟦ ⊥-elim ⟧ w ()
t⟦ &ᴰ-in f ⟧ w p a = t⟦ f a ⟧ w p
t⟦ &ᴰ-π a ⟧ w p = p a
t⟦ ⊕ᴰ-in a ⟧ w p = a , p
t⟦ ⊕ᴰ-elim f ⟧ w (a , p) = t⟦ f a ⟧ w p
t⟦ t ,⊗ t' ⟧ w (split , p-left , p-right) =
  split , t⟦ t ⟧ (left split) p-left , t⟦ t' ⟧ (right split) p-right
t⟦ ⊗-unit-l ⟧ w (mk [] right split , p-left , p-right) = subst G⟦ _ ⟧ split p-right
t⟦ ⊗-unit-l⁻ ⟧ w p = split-right w , _ , p
t⟦ ⊗-unit-r ⟧ w (mk left [] split , p-left , p-right) = subst G⟦ _ ⟧ (sym (++-id-r _) ∙ split) p-left
t⟦ ⊗-unit-r⁻ ⟧ w p = split-left w , p , _
t⟦ ⊗-assoc ⟧ w (mk left middle-right split-l-mr , p-left , mk middle right split-mr , p-middle , p-right) =
  let lm-r = split-++ (left ++ middle) right in
  let l-m = split-++ left middle in
  let assoc-path = sym (++-assoc left middle right) ∙ cong (left ++_) split-mr ∙ split-l-mr in
  subst (λ w → Σ (Split w) _) assoc-path (lm-r , (l-m , p-left , p-middle) , p-right)
t⟦ ⊗-assoc⁻ ⟧ w (mk left-middle right split-lm-r , (mk left middle split-lm , p-left , p-middle) , p-right) =
  let l-mr = split-++ left (middle ++ right) in
  let m-r = split-++ middle right in
  let assoc-path = ++-assoc left middle right ∙ cong (_++ right) split-lm ∙ split-lm-r in
  subst (λ w → Σ (Split w) _) assoc-path (l-mr , p-left , (m-r , p-middle , p-right))
t⟦ ⊕ᴰ-dist-l ⟧ w (split , (a , p-left) , p-right) = a , split , p-left , p-right
t⟦ ⊕ᴰ-dist-l⁻ ⟧ w (a , split , p-left , p-right) = split , (a , p-left) , p-right
t⟦ ⊕ᴰ-dist-r ⟧ w (split , p-left , a , p-right) = a , split , p-left , p-right
t⟦ ⊕ᴰ-dist-r⁻ ⟧ w (a , split , p-left , p-right) = split , p-left , a , p-right
t⟦ ⊸-in t ⟧ w p w' p' = t⟦ t ⟧ (w' ++ w) (split-++ w' w , p' , p)
t⟦ ⊸-app ⟧ w (mk left right split , p , f) = subst G⟦ _ ⟧ split (f left p)
t⟦ ⟜-in t ⟧ w p w' p' = t⟦ t ⟧ (w ++ w') (split-++ w w' , p , p')
t⟦ ⟜-app ⟧ w (mk left right split , f , p) = subst G⟦ _ ⟧ split (f right p)
t⟦ roll ⟧ w p = roll w p
t⟦ rec {F = F} alg a ⟧ w (roll .w x) = t⟦ alg a ⟧ w (t⟦ map (F a) (rec alg) ⟧ w x)
t⟦ read ⟧ w p = internalize w

run-parser : String ⊢ G → (w : List Alph) → G⟦ G ⟧ w
run-parser parser w = t⟦ parser ⟧ w (internalize w)

run-weak-parser : Weak-parser G → (w : List Alph) → Maybe (G⟦ G ⟧ w)
run-weak-parser parser w = run-parser (finish parser) w |> λ where
  (Lin-maybe.`just , p) → just p
  (Lin-maybe.`nothing , _) → nothing

run-weak-parser-partial : Weak-parser G → (w : List Alph) → Maybe (Σ (List Alph) G⟦ G ⟧) × List Alph
run-weak-parser-partial parser w = run-parser parser w |> λ where
  (Lin-maybe.`just , split , p-left , p-right) → just (left split , p-left) , right split
  (Lin-maybe.`nothing , p) → nothing , w

run-weak-parser-Δ : Weak-parser (Δ A) → List Alph → Maybe A
run-weak-parser-Δ parser w = run-weak-parser parser w |> Maybe.map fst

run-weak-parser-Δ-partial : Weak-parser (Δ A) → List Alph → Maybe A × List Alph
run-weak-parser-Δ-partial parser w = run-weak-parser-partial parser w |> map-fst (Maybe.map (fst ∘ snd))

