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

module MAlonzo.Code.Cubed.Data.QQueue.Effectful where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Maybe
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Data.Maybe.Base
import qualified MAlonzo.Code.Cubed.Data.QQueue.Base
import qualified MAlonzo.Code.Cubed.Effect.Applicative
import qualified MAlonzo.Code.Cubed.Effect.Monad
import qualified MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base

-- Cubed.Data.Queue.Effectful._.snoc
d_snoc_30 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (() -> ()) ->
  MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24 ->
  MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.T_Raw'45'monad'45'state_30 ->
  AgdaAny -> AgdaAny
d_snoc_30 ~v0 ~v1 ~v2 ~v3 ~v4 !v5 !v6 !v7 = du_snoc_30 v5 v6 v7
du_snoc_30 ::
  MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24 ->
  MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.T_Raw'45'monad'45'state_30 ->
  AgdaAny -> AgdaAny
du_snoc_30 !v0 !v1 !v2
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.d_modify_42 v1
      (coe MAlonzo.Code.Cubed.Data.QQueue.Base.d_snoc_46 v0 v2)
-- Cubed.Data.Queue.Effectful._.pop
d_pop_34 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (() -> ()) ->
  MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24 ->
  MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.T_Raw'45'monad'45'state_30 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 -> AgdaAny
d_pop_34 ~v0 ~v1 ~v2 ~v3 ~v4 !v5 !v6 !v7 = du_pop_34 v5 v6 v7
du_pop_34 ::
  MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24 ->
  MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.T_Raw'45'monad'45'state_30 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 -> AgdaAny
du_pop_34 !v0 !v1 !v2
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36 v2
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_get_44
         (coe v1))
      (\ !v3 ->
         coe
           MAlonzo.Code.Cubed.Data.Maybe.Base.du_rec_12
           (coe
              MAlonzo.Code.Cubed.Effect.Applicative.d_pure_34
              (MAlonzo.Code.Cubed.Effect.Monad.d_applicative_32 (coe v2)) erased
              (coe MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18))
           (coe
              (\ !v4 ->
                 coe
                   MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38 (coe v2)
                   (coe
                      MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_put_46 (coe v1)
                      (coe MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe v4)))
                   (coe
                      MAlonzo.Code.Cubed.Effect.Applicative.d_pure_34
                      (MAlonzo.Code.Cubed.Effect.Monad.d_applicative_32 (coe v2)) erased
                      (coe
                         MAlonzo.Code.Agda.Builtin.Maybe.C_just_16
                         (coe MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe v4))))))
           (coe MAlonzo.Code.Cubed.Data.QQueue.Base.d_pop_48 v0 v3))
