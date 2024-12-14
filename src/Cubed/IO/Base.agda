open import Cubed.Level

open import Cubed.Data.List.Base using (List)
open import Cubed.Data.Nat.Base using (Nat)
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

-- data Clock : Type lzero where
--   monotonic realtime process-cpu-time thread-cpu-time monotonic-raw boottime monotonic-coarse realtime-coarse : Clock

-- record Time : Type lzero where
--   field
--     sec : Nat
--     nsec : Nat

-- --postulate prim-get-time : Clock → IO (Pair )

-- {-# COMPILE GHC Clock = data Clock (Monotonic | Realtime | ProcessCPUTime | ThreadCPUTime | MonotonicRaw | Boottime | MonotonicCoarse | RealtimeCoarse) #-}
-- {-# FOREIGN GHC import System.Clock #-}
-- {-# COMPILE GHC Time = data TimeSpec (TimeSpec) #-}

