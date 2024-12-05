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

module MAlonzo.Code.Cubed.Data.FinStream.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Maybe
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Codata.Susp.Base
import qualified MAlonzo.Code.Cubed.Data.List.Base

-- Cubed.Data.FinStream.Base.FinStream
d_FinStream_22 a0 a1 a2 = ()
data T_FinStream_22
  = C_'91''93'_26 |
    C__'8759'__28 Integer AgdaAny
                  MAlonzo.Code.Cubed.Codata.Susp.Base.T_Susp_18
-- Cubed.Data.FinStream.Base.from-list
d_from'45'list_32 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> T_FinStream_22
d_from'45'list_32 ~v0 ~v1 v2 = du_from'45'list_32 v2
du_from'45'list_32 :: [AgdaAny] -> T_FinStream_22
du_from'45'list_32 v0
  = case coe v0 of
      [] -> coe C_'91''93'_26
      (:) v1 v2
        -> coe
             C__'8759'__28
             (coe MAlonzo.Code.Cubed.Data.List.Base.du_length_36 (coe v2))
             (coe v1)
             (coe
                MAlonzo.Code.Cubed.Codata.Susp.Base.C_delay_26
                (coe du_from'45'list_32 (coe v2)))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.FinStream.Base.map
d_map_38 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  Integer ->
  (AgdaAny -> AgdaAny) ->
  MAlonzo.Code.Cubed.Codata.Susp.Base.T_Susp_18 ->
  MAlonzo.Code.Cubed.Codata.Susp.Base.T_Susp_18
d_map_38 v0 ~v1 v2 ~v3 v4 v5 v6 = du_map_38 v0 v2 v4 v5 v6
du_map_38 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  Integer ->
  (AgdaAny -> AgdaAny) ->
  MAlonzo.Code.Cubed.Codata.Susp.Base.T_Susp_18 ->
  MAlonzo.Code.Cubed.Codata.Susp.Base.T_Susp_18
du_map_38 v0 v1 v2 v3 v4
  = coe
      MAlonzo.Code.Cubed.Codata.Susp.Base.C_delay_26
      (case coe v2 of
         0 -> coe C_'91''93'_26
         _ -> coe
                du_'46'extendedlambda0_50 (coe v0) (coe v1) (coe v3)
                (coe MAlonzo.Code.Cubed.Codata.Susp.Base.d_force_24 (coe v4)))
-- Cubed.Data.FinStream.Base..extendedlambda0
d_'46'extendedlambda0_50 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  Integer ->
  (AgdaAny -> AgdaAny) ->
  MAlonzo.Code.Cubed.Codata.Susp.Base.T_Susp_18 ->
  T_FinStream_22 -> T_FinStream_22
d_'46'extendedlambda0_50 v0 ~v1 v2 ~v3 ~v4 v5 ~v6 v7
  = du_'46'extendedlambda0_50 v0 v2 v5 v7
du_'46'extendedlambda0_50 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (AgdaAny -> AgdaAny) -> T_FinStream_22 -> T_FinStream_22
du_'46'extendedlambda0_50 v0 v1 v2 v3
  = case coe v3 of
      C__'8759'__28 v4 v5 v6
        -> coe
             C__'8759'__28 (coe v4) (coe v2 v5)
             (coe du_map_38 (coe v0) (coe v1) (coe v4) (coe v2) (coe v6))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.FinStream.Base.head
d_head_56 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> T_FinStream_22 -> AgdaAny
d_head_56 ~v0 ~v1 ~v2 v3 = du_head_56 v3
du_head_56 :: T_FinStream_22 -> AgdaAny
du_head_56 v0
  = case coe v0 of
      C__'8759'__28 v1 v2 v3 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.FinStream.Base.safe-head
d_safe'45'head_62 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> T_FinStream_22 -> Maybe AgdaAny
d_safe'45'head_62 ~v0 ~v1 ~v2 v3 = du_safe'45'head_62 v3
du_safe'45'head_62 :: T_FinStream_22 -> Maybe AgdaAny
du_safe'45'head_62 v0
  = case coe v0 of
      C_'91''93'_26 -> coe MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18
      C__'8759'__28 v1 v2 v3
        -> coe MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe v2)
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.FinStream.Base.tail
d_tail_68 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> T_FinStream_22 -> T_FinStream_22
d_tail_68 ~v0 ~v1 ~v2 v3 = du_tail_68 v3
du_tail_68 :: T_FinStream_22 -> T_FinStream_22
du_tail_68 v0
  = case coe v0 of
      C__'8759'__28 v1 v2 v3
        -> coe MAlonzo.Code.Cubed.Codata.Susp.Base.d_force_24 (coe v3)
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.FinStream.Base._++_
d__'43''43'__74 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  Integer ->
  Integer -> T_FinStream_22 -> T_FinStream_22 -> T_FinStream_22
d__'43''43'__74 ~v0 ~v1 v2 v3 v4 v5 = du__'43''43'__74 v2 v3 v4 v5
du__'43''43'__74 ::
  Integer ->
  Integer -> T_FinStream_22 -> T_FinStream_22 -> T_FinStream_22
du__'43''43'__74 v0 v1 v2 v3
  = case coe v0 of
      0 -> coe seq (coe v2) (coe v3)
      _ -> let v4 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (case coe v2 of
                C__'8759'__28 v5 v6 v7
                  -> coe
                       C__'8759'__28 (coe addInt (coe v4) (coe v1)) (coe v6)
                       (coe
                          MAlonzo.Code.Cubed.Codata.Susp.Base.C_delay_26
                          (coe
                             du__'43''43'__74 (coe v4) (coe v1)
                             (coe MAlonzo.Code.Cubed.Codata.Susp.Base.d_force_24 (coe v7))
                             (coe v3)))
                _ -> MAlonzo.RTE.mazUnreachableError)
