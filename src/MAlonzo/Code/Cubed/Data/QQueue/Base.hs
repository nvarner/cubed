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

module MAlonzo.Code.Cubed.Data.QQueue.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Data.List.Base
import qualified MAlonzo.Code.Cubed.Data.Maybe.Base

-- Cubed.Data.Queue.Base.IQueue
d_IQueue_24 a0 a1 a2 a3 = ()
data T_IQueue_24
  = C_IQueue'46'constructor_485 ([AgdaAny] -> AgdaAny) AgdaAny
                                (AgdaAny -> AgdaAny -> AgdaAny)
                                (AgdaAny -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14)
                                (AgdaAny -> Maybe AgdaAny) (AgdaAny -> Maybe AgdaAny)
-- Cubed.Data.Queue.Base.IQueue.from-list
d_from'45'list_42 :: T_IQueue_24 -> [AgdaAny] -> AgdaAny
d_from'45'list_42 v0
  = case coe v0 of
      C_IQueue'46'constructor_485 v1 v2 v3 v4 v5 v6 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Queue.Base.IQueue.empty
d_empty_44 :: T_IQueue_24 -> AgdaAny
d_empty_44 v0
  = case coe v0 of
      C_IQueue'46'constructor_485 v1 v2 v3 v4 v5 v6 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Queue.Base.IQueue.snoc
d_snoc_46 :: T_IQueue_24 -> AgdaAny -> AgdaAny -> AgdaAny
d_snoc_46 v0
  = case coe v0 of
      C_IQueue'46'constructor_485 v1 v2 v3 v4 v5 v6 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Queue.Base.IQueue.pop
d_pop_48 ::
  T_IQueue_24 ->
  AgdaAny -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_pop_48 v0
  = case coe v0 of
      C_IQueue'46'constructor_485 v1 v2 v3 v4 v5 v6 -> coe v4
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Queue.Base.IQueue.head
d_head_50 :: T_IQueue_24 -> AgdaAny -> Maybe AgdaAny
d_head_50 v0
  = case coe v0 of
      C_IQueue'46'constructor_485 v1 v2 v3 v4 v5 v6 -> coe v5
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Queue.Base.IQueue.tail
d_tail_52 :: T_IQueue_24 -> AgdaAny -> Maybe AgdaAny
d_tail_52 v0
  = case coe v0 of
      C_IQueue'46'constructor_485 v1 v2 v3 v4 v5 v6 -> coe v6
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Queue.Base._.empty
d_empty_56 :: T_IQueue_24 -> AgdaAny
d_empty_56 v0 = coe d_empty_44 (coe v0)
-- Cubed.Data.Queue.Base._.from-list
d_from'45'list_58 :: T_IQueue_24 -> [AgdaAny] -> AgdaAny
d_from'45'list_58 v0 = coe d_from'45'list_42 (coe v0)
-- Cubed.Data.Queue.Base._.head
d_head_60 :: T_IQueue_24 -> AgdaAny -> Maybe AgdaAny
d_head_60 v0 = coe d_head_50 (coe v0)
-- Cubed.Data.Queue.Base._.pop
d_pop_62 ::
  T_IQueue_24 ->
  AgdaAny -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_pop_62 v0 = coe d_pop_48 (coe v0)
-- Cubed.Data.Queue.Base._.snoc
d_snoc_64 :: T_IQueue_24 -> AgdaAny -> AgdaAny -> AgdaAny
d_snoc_64 v0 = coe d_snoc_46 (coe v0)
-- Cubed.Data.Queue.Base._.tail
d_tail_66 :: T_IQueue_24 -> AgdaAny -> Maybe AgdaAny
d_tail_66 v0 = coe d_tail_52 (coe v0)
-- Cubed.Data.Queue.Base.mk-from-minimal
d_mk'45'from'45'minimal_74 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14) ->
  T_IQueue_24
d_mk'45'from'45'minimal_74 ~v0 ~v1 ~v2 ~v3 v4 v5 v6
  = du_mk'45'from'45'minimal_74 v4 v5 v6
du_mk'45'from'45'minimal_74 ::
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14) ->
  T_IQueue_24
du_mk'45'from'45'minimal_74 v0 v1 v2
  = coe
      C_IQueue'46'constructor_485
      (coe
         MAlonzo.Code.Cubed.Data.List.Base.du_foldr_108 (coe v1) (coe v0))
      (coe v0) (coe v1) (coe v2)
      (coe
         (\ v3 ->
            coe
              MAlonzo.Code.Cubed.Data.Maybe.Base.du_map_24
              (coe (\ v4 -> MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe v4)))
              (coe v2 v3)))
      (coe
         (\ v3 ->
            coe
              MAlonzo.Code.Cubed.Data.Maybe.Base.du_map_24
              (coe (\ v4 -> MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe v4)))
              (coe v2 v3)))
