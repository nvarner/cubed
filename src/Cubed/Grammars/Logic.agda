{-# OPTIONS --lossy-unification #-}
module Cubed.Grammars.Logic where

open import Cubed.Prelude hiding (pure ; _>>=_ ; _>>_ ; _<*>_ ; _<$>_)

private
  variable
    ℓ ℓ' : Level
    n : Nat
    A B : Type ℓ


IFun : Type ℓ → (ℓ' : Level) → Type (ℓ ⊔ lsuc ℓ')
IFun A ℓ' = A → A → Type ℓ' → Type ℓ'

record RawIApplicative (Idx : Type ℓ) (F : IFun Idx ℓ') : Type (ℓ ⊔ lsuc ℓ') where
  field
    pure : ∀ {x} → A → F x x A
    _<*>_ : ∀ {x y z} → F x y (A → B) → F y z A → F x z B

  _<$>_ : ∀ {x y} → (A → B) → F x y A → F x y B
  f <$> a = pure f <*> a

record RawIMonad {Idx : Type ℓ} (M : IFun Idx ℓ') : Type (ℓ ⊔ lsuc ℓ') where
  field
    pure : ∀ {x} → A → M x x A
    _>>=_ : ∀ {x y z} → M x y A → (A → M y z B) → M x z B

  _>>_ : ∀ {x y z} → M x y A → M y z B → M x z B
  a >> b = a >>= const b

  rawIApplicative : RawIApplicative Idx M
  rawIApplicative = record
    { pure = pure
    ; _<*>_ = λ f a → f >>= (λ f' → a >>= (λ a' → pure (f' a')))
    }

  open RawIApplicative rawIApplicative
    hiding (pure)
    public


module _ (Σ₀ : Type ℓ) where

  String : Type ℓ
  String = List Σ₀

  Split : String → Type ℓ
  Split cs = Σ[ (as , bs) ∈ String × String ] as List.++ bs ≡ cs

  Grammar : (ℓG : Level) → Type (ℓ ⊔ lsuc ℓG)
  Grammar ℓG = String → Type ℓG

  ε-grammar : Grammar ℓ
  ε-grammar cs = cs ≡ []

  lit-grammar : Σ₀ → Grammar ℓ
  lit-grammar c cs = cs ≡ c ∷ []

  concat-grammar : Grammar ℓ → Grammar ℓ → Grammar ℓ
  concat-grammar g g' cs = Σ[ ((as , bs) , is-split) ∈ Split cs ] g as × g' bs

  disjunct-grammar : Grammar ℓ → Grammar ℓ → Grammar ℓ
  disjunct-grammar g g' cs = g cs ⊎ g' cs

  ¬concat-grammar-lit-[] : {c : Σ₀} {g : Grammar ℓ} →
    ¬ concat-grammar (lit-grammar c) g []
  ¬concat-grammar-lit-[] (((as , bs) , is-split) , (lit-as , _)) =
    subst (λ x → x List.++ bs ≡ []) lit-as is-split & List.¬cons≡nil


  data LinTyp : Nat → Type ℓ where
    end : LinTyp n
    lit : Σ₀ → LinTyp 0
    _⊗_ _⊕_ : LinTyp n → LinTyp n → LinTyp n

  data LinTerm : Type ℓ where
    lit : Σ₀ → LinTerm
    _⊗_ _⊕_ : LinTerm → LinTerm → LinTerm

  LinTerm⟦_⟧ : LinTerm → Grammar ℓ
  LinTerm⟦ lit c ⟧ = lit-grammar c
  LinTerm⟦ l ⊗ r ⟧ = concat-grammar LinTerm⟦ l ⟧ LinTerm⟦ r ⟧
  LinTerm⟦ l ⊕ r ⟧ = disjunct-grammar LinTerm⟦ l ⟧ LinTerm⟦ r ⟧

  data _:Lin_ : LinTerm → LinTyp n → Type ℓ where
    lit : (c : Σ₀) → lit c :Lin lit c

  data LinCtxt : Type ℓ where
    · : LinCtxt
    _`:_⟨_⟩,_ : (term : LinTerm) (typ : LinTyp n) → term :Lin typ → LinCtxt → LinCtxt

  LinCtxt⟦_⟧ : LinCtxt → Grammar ℓ
  LinCtxt⟦ · ⟧ = ε-grammar
  LinCtxt⟦ term `: lin ⟨ term:lin ⟩, Δ ⟧ = concat-grammar LinTerm⟦ term ⟧ LinCtxt⟦ Δ ⟧


  module _ where
    open ⟦⟧-Notation

    instance
      LinTerm-⟦⟧-Notation : ⟦⟧-Notation LinTerm
      LinTerm-⟦⟧-Notation .⟦⟧-ℓ = lsuc ℓ
      LinTerm-⟦⟧-Notation .⟦A⟧ = Grammar ℓ
      LinTerm-⟦⟧-Notation .⟦_⟧ = LinTerm⟦_⟧

      LinCtxt-⟦⟧-Notation : ⟦⟧-Notation LinCtxt
      LinCtxt-⟦⟧-Notation .⟦⟧-ℓ = lsuc ℓ
      LinCtxt-⟦⟧-Notation .⟦A⟧ = Grammar ℓ
      LinCtxt-⟦⟧-Notation .⟦_⟧ = LinCtxt⟦_⟧


  module Parsing (_≟Σ₀_ : (a b : Σ₀) → Dec (a ≡ b)) where
    Parser : LinCtxt → LinCtxt → Type ℓ' → Type (ℓ ⊔ ℓ')
    Parser Δ Δ' A = Σ String ⟦ Δ ⟧ → List (A × Σ String ⟦ Δ' ⟧)

    ParserRawIMonad : RawIMonad {ℓ' = ℓ} Parser
    ParserRawIMonad .RawIMonad.pure a cs = (a , cs) ∷ []
    ParserRawIMonad .RawIMonad._>>=_ a f cs =
      a cs & List.flat-map (λ (a' , cs') → (f a') cs')

    open RawIMonad ParserRawIMonad

    char : (c : Σ₀) {Δ : LinCtxt} → Parser (lit c `: lit c ⟨ lit c ⟩, Δ) Δ Σ₀
    char c ([] , g) = ¬concat-grammar-lit-[] g & ⊥.rec
    char c {Δ} (c' ∷ cs , (((as , bs) , is-split) , (l , r))) =
      let c∷bs≡c'∷cs = subst (λ x → x List.++ bs ≡ c' ∷ cs) l is-split in
      let bs≡cs = List.cons-r-inj c∷bs≡c'∷cs in
      c' ≟Σ₀ c & Dec.rec
        (λ p → (c , cs , subst LinCtxt⟦ Δ ⟧ bs≡cs r) ∷ [])
        (λ ¬p → [])


    module _ (a b : Σ₀) where
      ab-parser : Parser (lit a `: lit a ⟨ lit a ⟩, (lit b `: lit b ⟨ lit b ⟩, ·)) · Σ₀
      ab-parser = do
        char a
        char b

      -- The first index can be inferred with --lossy-unification
      ab-parser' : Parser _ · Σ₀
      ab-parser' = do
        char a
        char b


