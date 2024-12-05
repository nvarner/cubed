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

module MAlonzo.Code.Cubed.Effect.Monad.State.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Effect.Monad.Id
import qualified MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base

-- Cubed.Effect.Monad.State.Base.State
d_State_20 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> () -> () -> ()
d_State_20 = erased
-- Cubed.Effect.Monad.State.Base.run
d_run_24 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.T_StateT_68 ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_run_24 ~v0 ~v1 ~v2 v3 v4 = du_run_24 v3 v4
du_run_24 ::
  MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.T_StateT_68 ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_run_24 v0 v1
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.Id.d_run_20
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.d_run_78 v0 v1)
-- Cubed.Effect.Monad.State.Base.eval
d_eval_30 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.T_StateT_68 ->
  AgdaAny -> AgdaAny
d_eval_30 ~v0 ~v1 ~v2 v3 v4 = du_eval_30 v3 v4
du_eval_30 ::
  MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.T_StateT_68 ->
  AgdaAny -> AgdaAny
du_eval_30 v0 v1
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.Id.d_run_20
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_eval_82
         (coe MAlonzo.Code.Cubed.Effect.Monad.Id.du_functor_24) (coe v0)
         (coe v1))
-- Cubed.Effect.Monad.State.Base.exec
d_exec_36 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.T_StateT_68 ->
  AgdaAny -> AgdaAny
d_exec_36 ~v0 ~v1 ~v2 v3 v4 = du_exec_36 v3 v4
du_exec_36 ::
  MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.T_StateT_68 ->
  AgdaAny -> AgdaAny
du_exec_36 v0 v1
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.Id.d_run_20
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_exec_88
         (coe MAlonzo.Code.Cubed.Effect.Monad.Id.du_functor_24) (coe v0)
         (coe v1))
