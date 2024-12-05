open import Cubed.Level

open import Cubed.Data.List.Base using (List)
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
  get-args : IO (List String)

{-# FOREIGN GHC import qualified Data.Text as T #-}
{-# FOREIGN GHC import qualified Data.Text.IO as TextIO #-}
{-# FOREIGN GHC import qualified System.Environment as SE #-}

{-# COMPILE GHC put-str-ln = TextIO.putStrLn #-}
{-# COMPILE GHC get-line = TextIO.getLine #-}
{-# COMPILE GHC get-args = fmap (fmap T.pack) SE.getArgs #-}

