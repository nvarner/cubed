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

module MAlonzo.Code.Cubed.Data.QQueue.Batched.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Maybe
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Data.List.Base
import qualified MAlonzo.Code.Cubed.Data.Maybe.Effectful
import qualified MAlonzo.Code.Cubed.Data.QQueue.Base
import qualified MAlonzo.Code.Cubed.Effect.Monad

-- Cubed.Data.Queue.Batched.Base.Queue
d_Queue_18 a0 a1 = ()
data T_Queue_18 = C_mk_34 [AgdaAny] [AgdaAny]
-- Cubed.Data.Queue.Batched.Base.Queue.front
d_front_28 :: T_Queue_18 -> [AgdaAny]
d_front_28 v0
  = case coe v0 of
      C_mk_34 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Queue.Batched.Base.Queue.back
d_back_30 :: T_Queue_18 -> [AgdaAny]
d_back_30 v0
  = case coe v0 of
      C_mk_34 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Queue.Batched.Base.from-list
d_from'45'list_36 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> T_Queue_18
d_from'45'list_36 ~v0 ~v1 v2 = du_from'45'list_36 v2
du_from'45'list_36 :: [AgdaAny] -> T_Queue_18
du_from'45'list_36 v0
  = coe
      seq (coe v0)
      (coe C_mk_34 v0 (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16))
-- Cubed.Data.Queue.Batched.Base.split-queue
d_split'45'queue_42 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> [AgdaAny] -> T_Queue_18
d_split'45'queue_42 ~v0 ~v1 v2 = du_split'45'queue_42 v2
du_split'45'queue_42 :: [AgdaAny] -> [AgdaAny] -> T_Queue_18
du_split'45'queue_42 v0
  = case coe v0 of
      []
        -> coe
             (\ v1 ->
                coe
                  du_from'45'list_36
                  (coe MAlonzo.Code.Cubed.Data.List.Base.du_reverse_144 v1))
      (:) v1 v2 -> coe (\ v3 -> coe C_mk_34 v0 v3)
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Queue.Batched.Base.empty
d_empty_48 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> () -> T_Queue_18
d_empty_48 ~v0 ~v1 = du_empty_48
du_empty_48 :: T_Queue_18
du_empty_48
  = coe
      du_from'45'list_36
      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
-- Cubed.Data.Queue.Batched.Base.is-empty
d_is'45'empty_50 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> () -> T_Queue_18 -> Bool
d_is'45'empty_50 ~v0 ~v1 v2 = du_is'45'empty_50 v2
du_is'45'empty_50 :: T_Queue_18 -> Bool
du_is'45'empty_50 v0
  = coe
      MAlonzo.Code.Cubed.Data.List.Base.du_is'45'empty'7495'_240
      (coe d_front_28 (coe v0))
-- Cubed.Data.Queue.Batched.Base.snoc
d_snoc_52 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> AgdaAny -> T_Queue_18 -> T_Queue_18
d_snoc_52 ~v0 ~v1 v2 v3 = du_snoc_52 v2 v3
du_snoc_52 :: AgdaAny -> T_Queue_18 -> T_Queue_18
du_snoc_52 v0 v1
  = coe
      du_split'45'queue_42 (d_front_28 (coe v1))
      (coe
         MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v0)
         (coe d_back_30 (coe v1)))
-- Cubed.Data.Queue.Batched.Base.pop
d_pop_58 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Queue_18 -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_pop_58 ~v0 ~v1 v2 = du_pop_58 v2
du_pop_58 ::
  T_Queue_18 -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_pop_58 v0
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
      (coe MAlonzo.Code.Cubed.Data.Maybe.Effectful.du_monad_14)
      (coe
         MAlonzo.Code.Cubed.Data.List.Base.du_pop_150
         (coe d_front_28 (coe v0)))
      (\ v1 ->
         case coe v1 of
           MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v2 v3
             -> coe
                  MAlonzo.Code.Agda.Builtin.Maybe.C_just_16
                  (coe
                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v2)
                     (coe du_split'45'queue_42 v3 (d_back_30 (coe v0))))
           _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Data.Queue.Batched.Base.head
d_head_68 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Queue_18 -> Maybe AgdaAny
d_head_68 ~v0 ~v1 v2 = du_head_68 v2
du_head_68 :: T_Queue_18 -> Maybe AgdaAny
du_head_68 v0
  = coe
      MAlonzo.Code.Cubed.Data.List.Base.du_head_156
      (coe d_front_28 (coe v0))
-- Cubed.Data.Queue.Batched.Base.tail
d_tail_70 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Queue_18 -> Maybe T_Queue_18
d_tail_70 ~v0 ~v1 v2 = du_tail_70 v2
du_tail_70 :: T_Queue_18 -> Maybe T_Queue_18
du_tail_70 v0
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
      (coe MAlonzo.Code.Cubed.Data.Maybe.Effectful.du_monad_14)
      (coe
         MAlonzo.Code.Cubed.Data.List.Base.du_tail_158
         (coe d_front_28 (coe v0)))
      (\ v1 ->
         coe
           MAlonzo.Code.Agda.Builtin.Maybe.C_just_16
           (coe du_split'45'queue_42 v1 (d_back_30 (coe v0))))
-- Cubed.Data.Queue.Batched.Base.iqueue
d_iqueue_76 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24
d_iqueue_76 ~v0 ~v1 = du_iqueue_76
du_iqueue_76 :: MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24
du_iqueue_76
  = coe
      MAlonzo.Code.Cubed.Data.QQueue.Base.C_IQueue'46'constructor_485
      (coe du_from'45'list_36) (coe du_empty_48) (coe du_snoc_52)
      (coe du_pop_58) (coe du_head_68) (coe du_tail_70)
