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

module MAlonzo.Code.Cubed.Data.QQueue.RealZ45Ztime.Base where

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
import qualified MAlonzo.Code.Cubed.Data.Stream.Fin
import qualified MAlonzo.Code.Cubed.Effect.Monad

-- Cubed.Data.Queue.Real-time.Base.Queue
d_Queue_18 a0 a1 = ()
data T_Queue_18
  = C_mk_34 MAlonzo.Code.Cubed.Data.Stream.Fin.T_Stream_18 [AgdaAny]
            MAlonzo.Code.Cubed.Data.Stream.Fin.T_Stream_18
-- Cubed.Data.Queue.Real-time.Base.Queue.front
d_front_28 ::
  T_Queue_18 -> MAlonzo.Code.Cubed.Data.Stream.Fin.T_Stream_18
d_front_28 v0
  = case coe v0 of
      C_mk_34 v1 v2 v3 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Queue.Real-time.Base.Queue.back
d_back_30 :: T_Queue_18 -> [AgdaAny]
d_back_30 v0
  = case coe v0 of
      C_mk_34 v1 v2 v3 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Queue.Real-time.Base.Queue.schedule
d_schedule_32 ::
  T_Queue_18 -> MAlonzo.Code.Cubed.Data.Stream.Fin.T_Stream_18
d_schedule_32 v0
  = case coe v0 of
      C_mk_34 v1 v2 v3 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Queue.Real-time.Base.rotate
d_rotate_36 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Data.Stream.Fin.T_Stream_18 ->
  [AgdaAny] ->
  MAlonzo.Code.Cubed.Data.Stream.Fin.T_Stream_18 ->
  MAlonzo.Code.Cubed.Data.Stream.Fin.T_Stream_18
d_rotate_36 v0 ~v1 = du_rotate_36 v0
du_rotate_36 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Data.Stream.Fin.T_Stream_18 ->
  [AgdaAny] ->
  MAlonzo.Code.Cubed.Data.Stream.Fin.T_Stream_18 ->
  MAlonzo.Code.Cubed.Data.Stream.Fin.T_Stream_18
du_rotate_36 v0
  = coe
      MAlonzo.Code.Cubed.Data.Stream.Fin.du_foldl_54 (coe v0) (coe v0)
      (coe
         (\ v1 v2 v3 v4 ->
            case coe v3 of
              []
                -> coe
                     MAlonzo.Code.Cubed.Data.Stream.Fin.du_cons_38 (coe v2)
                     (coe v1 v3 v4)
              (:) v5 v6
                -> coe
                     MAlonzo.Code.Cubed.Data.Stream.Fin.du_cons_38 (coe v2)
                     (coe
                        v1 v6
                        (coe
                           MAlonzo.Code.Cubed.Data.Stream.Fin.du_cons_38 (coe v5) (coe v4)))
              _ -> MAlonzo.RTE.mazUnreachableError))
      (coe
         (\ v1 ->
            coe
              MAlonzo.Code.Cubed.Data.Stream.Fin.du__'43''43'__80 (coe v0)
              (coe
                 MAlonzo.Code.Cubed.Data.Stream.Fin.du_from'45'list_66
                 (coe MAlonzo.Code.Cubed.Data.List.Base.du_reverse_144 v1))))
-- Cubed.Data.Queue.Real-time.Base.fixed
d_fixed_56 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Data.Stream.Fin.T_Stream_18 ->
  [AgdaAny] ->
  MAlonzo.Code.Cubed.Data.Stream.Fin.T_Stream_18 -> T_Queue_18
d_fixed_56 v0 ~v1 v2 v3 v4 = du_fixed_56 v0 v2 v3 v4
du_fixed_56 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Data.Stream.Fin.T_Stream_18 ->
  [AgdaAny] ->
  MAlonzo.Code.Cubed.Data.Stream.Fin.T_Stream_18 -> T_Queue_18
du_fixed_56 v0 v1 v2 v3
  = let v4
          = coe MAlonzo.Code.Cubed.Data.Stream.Fin.du_pop_78 (coe v3) in
    coe
      (case coe v4 of
         MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 v5
           -> case coe v5 of
                MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v6 v7
                  -> coe C_mk_34 (coe v1) (coe v2) (coe v7)
                _ -> MAlonzo.RTE.mazUnreachableError
         MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18
           -> coe
                C_mk_34
                (coe
                   du_rotate_36 v0 v1 v2
                   (coe MAlonzo.Code.Cubed.Data.Stream.Fin.du_empty_36))
                (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
                (coe
                   du_rotate_36 v0 v1 v2
                   (coe MAlonzo.Code.Cubed.Data.Stream.Fin.du_empty_36))
         _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Data.Queue.Real-time.Base.empty
d_empty_72 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> () -> T_Queue_18
d_empty_72 v0 ~v1 = du_empty_72 v0
du_empty_72 :: MAlonzo.Code.Agda.Primitive.T_Level_18 -> T_Queue_18
du_empty_72 v0
  = coe
      du_fixed_56 (coe v0)
      (coe MAlonzo.Code.Cubed.Data.Stream.Fin.du_empty_36)
      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
      (coe MAlonzo.Code.Cubed.Data.Stream.Fin.du_empty_36)
-- Cubed.Data.Queue.Real-time.Base.snoc
d_snoc_74 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> AgdaAny -> T_Queue_18 -> T_Queue_18
d_snoc_74 v0 ~v1 v2 v3 = du_snoc_74 v0 v2 v3
du_snoc_74 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  AgdaAny -> T_Queue_18 -> T_Queue_18
du_snoc_74 v0 v1 v2
  = coe
      du_fixed_56 (coe v0) (coe d_front_28 (coe v2))
      (coe
         MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v1)
         (coe d_back_30 (coe v2)))
      (coe d_schedule_32 (coe v2))
-- Cubed.Data.Queue.Real-time.Base.pop
d_pop_80 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Queue_18 -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_pop_80 v0 ~v1 v2 = du_pop_80 v0 v2
du_pop_80 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Queue_18 -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_pop_80 v0 v1
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
      (coe MAlonzo.Code.Cubed.Data.Maybe.Effectful.du_monad_14)
      (coe
         MAlonzo.Code.Cubed.Data.Stream.Fin.du_pop_78
         (coe d_front_28 (coe v1)))
      (\ v2 ->
         case coe v2 of
           MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v3 v4
             -> coe
                  MAlonzo.Code.Agda.Builtin.Maybe.C_just_16
                  (coe
                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v3)
                     (coe
                        du_fixed_56 (coe v0) (coe v4) (coe d_back_30 (coe v1))
                        (coe d_schedule_32 (coe v1))))
           _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Data.Queue.Real-time.Base.head
d_head_90 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Queue_18 -> Maybe AgdaAny
d_head_90 ~v0 ~v1 v2 = du_head_90 v2
du_head_90 :: T_Queue_18 -> Maybe AgdaAny
du_head_90 v0
  = coe
      MAlonzo.Code.Cubed.Data.Stream.Fin.du_head_74
      (coe d_front_28 (coe v0))
-- Cubed.Data.Queue.Real-time.Base.tail
d_tail_92 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Queue_18 -> Maybe T_Queue_18
d_tail_92 v0 ~v1 v2 = du_tail_92 v0 v2
du_tail_92 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Queue_18 -> Maybe T_Queue_18
du_tail_92 v0 v1
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
      (coe MAlonzo.Code.Cubed.Data.Maybe.Effectful.du_monad_14)
      (coe
         MAlonzo.Code.Cubed.Data.Stream.Fin.du_tail_76
         (coe d_front_28 (coe v1)))
      (\ v2 ->
         coe
           MAlonzo.Code.Agda.Builtin.Maybe.C_just_16
           (coe
              du_fixed_56 (coe v0) (coe v2) (coe d_back_30 (coe v1))
              (coe d_schedule_32 (coe v1))))
-- Cubed.Data.Queue.Real-time.Base.iqueue
d_iqueue_98 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24
d_iqueue_98 v0 ~v1 = du_iqueue_98 v0
du_iqueue_98 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24
du_iqueue_98 v0
  = coe
      MAlonzo.Code.Cubed.Data.QQueue.Base.C_IQueue'46'constructor_485
      (coe
         MAlonzo.Code.Cubed.Data.List.Base.du_foldr_108
         (coe du_snoc_74 (coe v0)) (coe du_empty_72 (coe v0)))
      (coe du_empty_72 (coe v0)) (coe du_snoc_74 (coe v0))
      (coe du_pop_80 (coe v0)) (coe du_head_90) (coe du_tail_92 (coe v0))
