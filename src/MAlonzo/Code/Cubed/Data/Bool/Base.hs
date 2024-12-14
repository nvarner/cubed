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

module MAlonzo.Code.Cubed.Data.Bool.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Agda.Primitive.Cubical
import qualified MAlonzo.Code.Cubed.Data.Empty.Base

-- Cubed.Data.Bool.Base.not
d_not_10 :: Bool -> Bool
d_not_10 v0
  = if coe v0
      then coe MAlonzo.Code.Agda.Builtin.Bool.C_false_8
      else coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10
-- Cubed.Data.Bool.Base.T
d_T_12 :: Bool -> ()
d_T_12 = erased
-- Cubed.Data.Bool.Base.ifᵇ_then_else_
d_if'7495'_then_else__14 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Bool -> AgdaAny -> AgdaAny -> AgdaAny
d_if'7495'_then_else__14 ~v0 ~v1 v2 v3 v4
  = du_if'7495'_then_else__14 v2 v3 v4
du_if'7495'_then_else__14 :: Bool -> AgdaAny -> AgdaAny -> AgdaAny
du_if'7495'_then_else__14 v0 v1 v2
  = if coe v0 then coe v1 else coe v2
-- Cubed.Data.Bool.Base.flip
d_flip_26 ::
  Bool ->
  (AgdaAny -> MAlonzo.Code.Cubed.Data.Empty.Base.T_Empty_10) ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> Bool
d_flip_26 v0 ~v1 = du_flip_26 v0
du_flip_26 ::
  Bool -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> Bool
du_flip_26 v0
  = if coe v0
      then coe MAlonzo.Code.Cubed.Data.Empty.Base.du_rec_12
      else coe (\ v1 -> v0)
