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

module MAlonzo.Code.Cubed.Level where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive

-- Cubed.Level.level
d_level_8 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Agda.Primitive.T_Level_18
d_level_8 v0 ~v1 = du_level_8 v0
du_level_8 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18
du_level_8 v0 = coe v0
-- Cubed.Level.Lift
d_Lift_20 a0 a1 a2 = ()
newtype T_Lift_20 = C_liftℓ_32 AgdaAny
-- Cubed.Level.Lift.lowerℓ
d_lowerℓ_30 :: T_Lift_20 -> AgdaAny
d_lowerℓ_30 v0
  = case coe v0 of
      C_liftℓ_32 v1 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
