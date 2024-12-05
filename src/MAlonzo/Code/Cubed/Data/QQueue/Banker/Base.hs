{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE EmptyCase #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE QualifiedDo #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}

{-# OPTIONS_GHC -Wno-overlapping-patterns #-}

module MAlonzo.Code.Cubed.Data.QQueue.Banker.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Maybe
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Data.Dec.Base
import qualified MAlonzo.Code.Cubed.Data.List.Base
import qualified MAlonzo.Code.Cubed.Data.Maybe.Effectful
import qualified MAlonzo.Code.Cubed.Data.Nat.Base
import qualified MAlonzo.Code.Cubed.Data.QQueue.Base
import qualified MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen
import qualified MAlonzo.Code.Cubed.Effect.Monad

-- Cubed.Data.Queue.Banker.Base.Queue
d_Queue_20 !a0 !a1 = ()
data T_Queue_20
  = C_mk_40 !Integer
            !MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.T_Stream_32
            ![AgdaAny]
-- Cubed.Data.Queue.Banker.Base.Queue.len-front
d_len'45'front_32 :: T_Queue_20 -> Integer
d_len'45'front_32 !v0
  = case coe v0 of
      !(C_mk_40 v1 v2 v3) -> coe v1
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Queue.Banker.Base.Queue.front
d_front_34 ::
  T_Queue_20 ->
  MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.T_Stream_32
d_front_34 !v0
  = case coe v0 of
      !(C_mk_40 v1 v2 v3) -> coe v2
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Queue.Banker.Base.Queue.back
d_back_36 :: T_Queue_20 -> [AgdaAny]
d_back_36 !v0
  = case coe v0 of
      !(C_mk_40 v1 v2 v3) -> coe v3
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Queue.Banker.Base.from-fin-stream
d_from'45'fin'45'stream_42 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  Integer ->
  MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.T_Stream_32 ->
  T_Queue_20
d_from'45'fin'45'stream_42 ~v0 ~v1 !v2 !v3
  = du_from'45'fin'45'stream_42 v2 v3
du_from'45'fin'45'stream_42 ::
  Integer ->
  MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.T_Stream_32 ->
  T_Queue_20
du_from'45'fin'45'stream_42 !v0 !v1
  = coe
      C_mk_40 v0 v1 (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
-- Cubed.Data.Queue.Banker.Base.split-queue
d_split'45'queue_50 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  Integer ->
  MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.T_Stream_32 ->
  [AgdaAny] -> T_Queue_20
d_split'45'queue_50 !v0 ~v1 !v2 !v3 !v4
  = du_split'45'queue_50 v0 v2 v3 v4
du_split'45'queue_50 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  Integer ->
  MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.T_Stream_32 ->
  [AgdaAny] -> T_Queue_20
du_split'45'queue_50 !v0 !v1 !v2 !v3
  = coe
      MAlonzo.Code.Cubed.Data.Dec.Base.du_rec_46
      (coe (\ !v4 -> coe C_mk_40 v1 v2 v3))
      (coe
         (\ !v4 ->
            coe
              C_mk_40
              (addInt
                 (coe
                    MAlonzo.Code.Cubed.Data.List.Base.du_length_50
                    (coe MAlonzo.Code.Cubed.Data.List.Base.du_reverse_144 v3))
                 (coe v1))
              (coe
                 MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du__'43''43'__210
                 v0 v1
                 (coe
                    MAlonzo.Code.Cubed.Data.List.Base.du_length_50
                    (coe MAlonzo.Code.Cubed.Data.List.Base.du_reverse_144 v3))
                 v2
                 (coe
                    MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du_from'45'list_142
                    (coe MAlonzo.Code.Cubed.Data.List.Base.du_reverse_144 v3)))
              (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)))
      (coe
         MAlonzo.Code.Cubed.Data.Nat.Base.d__'8804''63'__98
         (coe MAlonzo.Code.Cubed.Data.List.Base.du_length_50 (coe v3))
         (coe v1))
-- Cubed.Data.Queue.Banker.Base.empty
d_empty_62 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> () -> T_Queue_20
d_empty_62 ~v0 ~v1 = du_empty_62
du_empty_62 :: T_Queue_20
du_empty_62
  = coe
      du_from'45'fin'45'stream_42 (coe (0 :: Integer))
      (coe MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du_empty_50)
-- Cubed.Data.Queue.Banker.Base.is-empty
d_is'45'empty_64 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> () -> T_Queue_20 -> Bool
d_is'45'empty_64 ~v0 ~v1 !v2 = du_is'45'empty_64 v2
du_is'45'empty_64 :: T_Queue_20 -> Bool
du_is'45'empty_64 !v0
  = coe
      MAlonzo.Code.Cubed.Data.Nat.Base.d_is'45'zero'7495'_52
      (d_len'45'front_32 (coe v0))
-- Cubed.Data.Queue.Banker.Base.snoc
d_snoc_66 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> AgdaAny -> T_Queue_20 -> T_Queue_20
d_snoc_66 !v0 ~v1 !v2 !v3 = du_snoc_66 v0 v2 v3
du_snoc_66 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  AgdaAny -> T_Queue_20 -> T_Queue_20
du_snoc_66 !v0 !v1 !v2
  = coe
      du_split'45'queue_50 (coe v0) (coe d_len'45'front_32 (coe v2))
      (coe d_front_34 (coe v2))
      (coe
         MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v1)
         (coe d_back_36 (coe v2)))
-- Cubed.Data.Queue.Banker.Base.pop
d_pop_72 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Queue_20 -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_pop_72 !v0 ~v1 !v2 = du_pop_72 v0 v2
du_pop_72 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Queue_20 -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_pop_72 !v0 !v1
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
      (coe MAlonzo.Code.Cubed.Data.Maybe.Effectful.du_monad_14)
      (coe
         MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du_safe'45'pop_206
         (d_len'45'front_32 (coe v1)) (d_front_34 (coe v1)))
      (\ !v2 ->
         case coe v2 of
           !(MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v3 v4)
             -> coe
                  MAlonzo.Code.Agda.Builtin.Maybe.C_just_16
                  (coe
                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v3)
                     (coe
                        du_split'45'queue_50 (coe v0)
                        (coe
                           MAlonzo.Code.Cubed.Data.Nat.Base.d_safe'45'pred_140
                           (coe d_len'45'front_32 (coe v1)))
                        (coe v4) (coe d_back_36 (coe v1))))
           !_ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Data.Queue.Banker.Base.head
d_head_82 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Queue_20 -> Maybe AgdaAny
d_head_82 ~v0 ~v1 !v2 = du_head_82 v2
du_head_82 :: T_Queue_20 -> Maybe AgdaAny
du_head_82 !v0
  = coe
      MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du_safe'45'head_178
      (d_len'45'front_32 (coe v0)) (d_front_34 (coe v0))
-- Cubed.Data.Queue.Banker.Base.tail
d_tail_84 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Queue_20 -> Maybe T_Queue_20
d_tail_84 !v0 ~v1 !v2 = du_tail_84 v0 v2
du_tail_84 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Queue_20 -> Maybe T_Queue_20
du_tail_84 !v0 !v1
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
      (coe MAlonzo.Code.Cubed.Data.Maybe.Effectful.du_monad_14)
      (coe
         MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du_safe'45'tail_192
         (d_len'45'front_32 (coe v1)) (d_front_34 (coe v1)))
      (\ !v2 ->
         coe
           MAlonzo.Code.Agda.Builtin.Maybe.C_just_16
           (coe
              du_split'45'queue_50 (coe v0)
              (coe
                 MAlonzo.Code.Cubed.Data.Nat.Base.d_safe'45'pred_140
                 (coe d_len'45'front_32 (coe v1)))
              (coe v2) (coe d_back_36 (coe v1))))
-- Cubed.Data.Queue.Banker.Base.iqueue
d_iqueue_90 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24
d_iqueue_90 !v0 ~v1 = du_iqueue_90 v0
du_iqueue_90 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24
du_iqueue_90 !v0
  = coe
      MAlonzo.Code.Cubed.Data.QQueue.Base.C_IQueue'46'constructor_485
      (coe
         (\ !v1 ->
            coe
              du_from'45'fin'45'stream_42
              (coe MAlonzo.Code.Cubed.Data.List.Base.du_length_50 (coe v1))
              (coe
                 MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du_from'45'list_142
                 (coe v1))))
      (coe du_empty_62) (coe du_snoc_66 (coe v0))
      (coe du_pop_72 (coe v0)) (coe du_head_82) (coe du_tail_84 (coe v0))
