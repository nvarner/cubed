open import Cubed.Level

open import Cubed.Data.Bool.Base using (Bool; true; false; ifᵇ_then_else_)
open import Cubed.Data.Empty.Base using (Empty)
open import Cubed.Data.Maybe.Base as Maybe using (Maybe; just; nothing)
open import Cubed.Data.Nat.Base using (Nat; zero; suc)
open import Cubed.Data.Prod.Base using (_×_; _,_; fst; snd; map-fst)
open import Cubed.Data.Unit.Base using (Unit; tt)

open import Cubed.Fun.Base using (id; const; flip; uncurry'; _∘_; _∘₂_; _|>_)

open import Cubed.Id.Base using (Id-sys; _≡ₛ_; reflₛ)


module Cubed.Data.List.Base where

private variable
  ℓ : Level
  A B : Type _

open import Agda.Builtin.List public using (List; []; _∷_)

pattern [_] x = x ∷ []

elim :
  {B : List A → Type ℓ} →
  B [] → (∀ a as → B as → B (a ∷ as)) →
  (as : List A) → B as
elim init ih [] = init
elim init ih (a ∷ as) = ih a as (elim init ih as)

map : (A → B) → List A → List B
map f [] = []
map f (a ∷ as) = f a ∷ map f as

length : List A → Nat
length [] = zero
length (a ∷ as) = suc (length as)

infix 4 _≡_
_≡_ : {{Id-sys A}} → List A → List A → Type (level A)
[] ≡ [] = Lift Unit
[] ≡ y ∷ ys = Lift Empty
x ∷ xs ≡ [] = Lift Empty
x ∷ xs ≡ y ∷ ys = (x ≡ₛ y) × (xs ≡ ys)

refl : {{_ : Id-sys A}} {as : List A} → as ≡ as
refl {as = []} = liftℓ tt
refl {as = x ∷ as} = reflₛ , refl

infixr 5 _++_
_++_ : List A → List A → List A
[] ++ ys = ys
(x ∷ xs) ++ ys = x ∷ (xs ++ ys)

foldl : (B → A → B) → B → List A → B
foldl f init [] = init
foldl f init (x ∷ as) = foldl f (f init x) as

foldr : (A → B → B) → B → List A → B
foldr f init [] = init
foldr f init (x ∷ as) = f x (foldr f init as)

flatten : List (List A) → List A
flatten = foldr _++_ []

flat-map : (A → List B) → List A → List B
flat-map f = flatten ∘ map f

bind : List A → (A → List B) → List B
bind = flip flat-map

seq : List (A → B) → List A → List B
seq fs xs = bind fs (λ f → bind xs (λ x → [ f x ]))

filter-map : (A → Maybe B) → List A → List B
filter-map f = foldr (Maybe.rec id _∷_ ∘ f) []

reverse : List A → List A
reverse = foldl (flip _∷_) []

down-from : Nat → List Nat
down-from zero = []
down-from (suc n) = n ∷ down-from n

pop : List A → Maybe (A × List A)
pop [] = nothing
pop (x ∷ xs) = just (x , xs)

head : List A → Maybe A
head = Maybe.map fst ∘ pop

tail : List A → Maybe (List A)
tail [] = nothing
tail (x ∷ xs) = just xs

take : Nat → List A → List A
take zero xs = []
take (suc n) [] = []
take (suc n) (x ∷ xs) = x ∷ take n xs

drop : Nat → List A → List A
drop zero xs = xs
drop (suc n) [] = []
drop (suc n) (x ∷ xs) = drop n xs

split-at : Nat → List A → List A × List A
split-at zero xs = [] , xs
split-at (suc n) [] = [] , []
split-at (suc n) (x ∷ xs) = split-at n xs |> map-fst (x ∷_)

chunked : Nat → List A → List (List A)
chunked zero = const []
chunked (suc n) = uncurry' _∷_ ∘ snd ∘ go
  where private
  go : List A → Nat × List A × List (List A)
  go = foldl
    (λ where
      (zero , next , chunks) a → n , [ a ] , next ∷ chunks
      (suc k , next , chunks) a → k , a ∷ next , chunks)
    (suc n , [] , [])

data Is-empty {ℓ} {A : Type ℓ} : List A → Type (level A) where
  [] : Is-empty []

is-emptyᵇ : List A → Bool
is-emptyᵇ [] = true
is-emptyᵇ (_ ∷ _) = false

split-byᵇ : (A → Bool) → List A → List (List A)
split-byᵇ = uncurry' _∷_ ∘₂ go
  where private
  go : (A → Bool) → List A → List A × List (List A)
  go p = foldl
    (λ (next , chunks) a →
      ifᵇ p a
      then ([] , next ∷ chunks)
      else (a ∷ next , chunks))
    ([] , [])

