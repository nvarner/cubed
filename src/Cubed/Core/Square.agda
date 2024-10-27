open import Cubed.Core.Primitives
open import Cubed.Core.Fun.Base using (_∘_)

open import Cubed.Core.Path as Path
  using (Square; module ∙; _∙_; sym; symP)

module Cubed.Core.Square where

private variable
  A B : Type _
  a00 a01 a02 a10 a11 a12 a20 a21 a22 : A
  left : a00 ≡ a01
  right : a10 ≡ a11
  bottom : a00 ≡ a10
  top : a01 ≡ a11

flip : Square left right bottom top → Square bottom top left right
flip p i j = p j i

flip-h : Square left right bottom top → Square right left (sym bottom) (sym top)
flip-h = symP

flip-v : Square left right bottom top → Square (sym left) (sym right) top bottom
flip-v p i = sym (p i)

flip' : Square left right bottom top → Square (sym top) (sym bottom) (sym right) (sym left)
flip' = flip-h ∘ flip-v ∘ flip

infixr 30 _∙v_
_∙v_ :
  {p-left : a00 ≡ a01} {p-right : a10 ≡ a11}
  {q-left : a01 ≡ a02} {q-right : a11 ≡ a12}
  {middle : a01 ≡ a11} {top : a02 ≡ a12}
  (p : Square p-left p-right bottom middle)
  (q : Square q-left q-right middle top) →
  Square (p-left ∙ q-left) (p-right ∙ q-right) bottom top
(p ∙v q) i = p i ∙ q i

infixr 30 _∙h_
_∙h_ :
  {middle : a10 ≡ a11} {right : a20 ≡ a21}
  {p-bottom : a00 ≡ a10} {p-top : a01 ≡ a11}
  {q-bottom : a10 ≡ a20} {q-top : a11 ≡ a21}
  (p : Square left middle p-bottom p-top)
  (q : Square middle right q-bottom q-top) →
  Square left right (p-bottom ∙ q-bottom) (p-top ∙ q-top)
p ∙h q = flip (flip p ∙v flip q)


opaque
  unfolding Path.cong Path.congP

  cong :
    (f : A → B) (p : Square left right bottom top) →
    Square (Path.cong f left) (Path.cong f right) (Path.cong f bottom) (Path.cong f top)
  cong f p i j = f (p i j)

