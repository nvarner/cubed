open import Cubed.Core.Primitives

module Cubed.Core.Builtin where


module Unit where
  open import Agda.Builtin.Unit public
    using (tt)
    renaming (⊤ to Unit)


module Sigma where
  open import Agda.Builtin.Sigma public
    using (Σ ; _,_ ; fst ; snd)

  infix 2 Σ-syntax
  Σ-syntax : ∀ {ℓ ℓ'} (A : Type ℓ) (B : A → Type ℓ') → Type (ℓ ⊔ ℓ')
  Σ-syntax = Σ
  syntax Σ-syntax A (λ x → B) = Σ[ x ∈ A ] B


module Bool where
  open import Agda.Builtin.Bool public
    using (Bool ; true ; false)


module Maybe where
  open import Agda.Builtin.Maybe public
    using (Maybe ; just ; nothing)


module Nat where
  open import Agda.Builtin.Nat public
    using (Nat ; zero ; suc ; _+_ ; _-_)
    renaming (_*_ to _·_)

  open import Agda.Builtin.String public
    renaming (primShowNat to show)


module List where
  open import Agda.Builtin.List public
    using (List ; [] ; _∷_)

  pattern [_] a = a ∷ []


module Char where
  open Bool

  open import Agda.Builtin.Char public
    using (Char)
    renaming
      ( primCharEquality to _==_
      ; primToUpper to upper
      ; primToLower to lower
      ; primCharToNat to Char→Nat
      ; primNatToChar to Nat→Char
      )

  open import Agda.Builtin.String public
    renaming (primShowChar to show)

  postulate
    @0 prim-eq≡Path : {a b : Char} → (a == b ≡ true) ≡ (a ≡ b)


module String where
  open Bool

  open import Agda.Builtin.String public
    using (String)
    renaming
      ( primStringUncons to try-pop
      ; primStringToList to String→List
      ; primStringFromList to List→String
      ; primStringAppend to _++_
      ; primStringEquality to _==_
      ; primShowString to show
      )

  postulate
    @0 prim-eq≡Path : {a b : String} → (a == b ≡ true) ≡ (a ≡ b)


module Int where
  open import Agda.Builtin.Int public
    using (Int ; pos ; negsuc)
    renaming (primShowInteger to show)


module Word64 where
  open import Agda.Builtin.Word public
    using (Word64)
    renaming (primWord64ToNat to Word64→Nat)


module Float where
  open import Agda.Builtin.Float public
    using (Float)
    renaming
      ( primFloatInequality to _!=_
      ; primFloatEquality to _==_
      ; primShowFloat to show
      )

