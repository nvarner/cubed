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

module MAlonzo.Code.Cubed.Data.Vec.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive

-- Cubed.Data.Vec.Base.Vec
d_Vec_18 a0 a1 a2 = ()
data T_Vec_18
  = C_'91''93'_22 | C__'8759'__24 Integer AgdaAny T_Vec_18
-- Cubed.Data.Vec.Base.foldl
d_foldl_30 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  Integer ->
  (Integer -> ()) ->
  (Integer -> AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> T_Vec_18 -> AgdaAny
d_foldl_30 ~v0 ~v1 ~v2 ~v3 ~v4 v5 v6 v7 = du_foldl_30 v5 v6 v7
du_foldl_30 ::
  (Integer -> AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> T_Vec_18 -> AgdaAny
du_foldl_30 v0 v1 v2
  = case coe v2 of
      C_'91''93'_22 -> coe v1
      C__'8759'__24 v3 v4 v5
        -> coe
             du_foldl_30
             (coe (\ v6 -> coe v0 (addInt (coe (1 :: Integer)) (coe v6))))
             (coe v0 (0 :: Integer) v1 v4) (coe v5)
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Vec.Base.reverse
d_reverse_48 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> T_Vec_18 -> T_Vec_18
d_reverse_48 ~v0 ~v1 ~v2 = du_reverse_48
du_reverse_48 :: T_Vec_18 -> T_Vec_18
du_reverse_48
  = coe
      du_foldl_30
      (coe (\ v0 v1 v2 -> coe C__'8759'__24 (coe v0) (coe v2) (coe v1)))
      (coe C_'91''93'_22)
