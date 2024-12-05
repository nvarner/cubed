{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE EmptyCase #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}

{-# OPTIONS_GHC -Wno-overlapping-patterns #-}

module MAlonzo.Code.Cubed.Data.Fin.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text

-- Cubed.Data.Fin.Base.Fin
d_Fin_10 a0 = ()
data T_Fin_10 = C_zero_12 Integer | C_suc_14 Integer T_Fin_10
-- Cubed.Data.Fin.Base.weaken
d_weaken_16 :: Integer -> T_Fin_10 -> T_Fin_10
d_weaken_16 ~v0 v1 = du_weaken_16 v1
du_weaken_16 :: T_Fin_10 -> T_Fin_10
du_weaken_16 v0
  = case coe v0 of
      C_zero_12 v1
        -> coe C_zero_12 (coe addInt (coe (1 :: Integer)) (coe v1))
      C_suc_14 v1 v2
        -> coe
             C_suc_14 (coe addInt (coe (1 :: Integer)) (coe v1))
             (coe du_weaken_16 (coe v2))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Fin.Base.to-nat
d_to'45'nat_22 :: Integer -> T_Fin_10 -> Integer
d_to'45'nat_22 ~v0 v1 = du_to'45'nat_22 v1
du_to'45'nat_22 :: T_Fin_10 -> Integer
du_to'45'nat_22 v0
  = case coe v0 of
      C_zero_12 v1 -> coe (0 :: Integer)
      C_suc_14 v1 v2
        -> coe addInt (coe (1 :: Integer)) (coe du_to'45'nat_22 (coe v2))
      _ -> MAlonzo.RTE.mazUnreachableError
