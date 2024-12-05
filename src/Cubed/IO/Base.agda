open import Cubed.Level

open import Cubed.Data.String.Base using (String)
open import Cubed.Data.Unit.Base using (Unit)


module Cubed.IO.Base where

open import Agda.Builtin.IO public using (IO)

private variable
  A B : Type _

postulate
  pure : A → IO A
  bind : IO A → (A → IO B) → IO B

{-# COMPILE GHC pure = \_ _ -> return #-}
{-# COMPILE GHC bind = \_ _ _ _ -> (>>=) #-}

postulate
  put-str-ln : String → IO Unit
  get-line : IO String

{-# FOREIGN GHC import qualified Data.Text.IO as Text #-}
{-# COMPILE GHC put-str-ln = Text.putStrLn #-}
{-# COMPILE GHC get-line = Text.getLine #-}

