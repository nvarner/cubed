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

module MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Data.Prod.Base
import qualified MAlonzo.Code.Cubed.Effect.Applicative
import qualified MAlonzo.Code.Cubed.Effect.Functor
import qualified MAlonzo.Code.Cubed.Effect.Monad
import qualified MAlonzo.Code.Cubed.Level

-- Cubed.Effect.Monad.State.Trans.Base.Raw-monad-state
d_Raw'45'monad'45'state_30 a0 a1 a2 a3 = ()
data T_Raw'45'monad'45'state_30
  = C_Raw'45'monad'45'state'46'constructor_291 (() ->
                                                (AgdaAny -> AgdaAny) -> AgdaAny)
                                               ((AgdaAny -> AgdaAny) -> AgdaAny)
-- Cubed.Effect.Monad.State.Trans.Base.Raw-monad-state.gets
d_gets_40 ::
  T_Raw'45'monad'45'state_30 -> () -> (AgdaAny -> AgdaAny) -> AgdaAny
d_gets_40 v0
  = case coe v0 of
      C_Raw'45'monad'45'state'46'constructor_291 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Monad.State.Trans.Base.Raw-monad-state.modify
d_modify_42 ::
  T_Raw'45'monad'45'state_30 -> (AgdaAny -> AgdaAny) -> AgdaAny
d_modify_42 v0
  = case coe v0 of
      C_Raw'45'monad'45'state'46'constructor_291 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Monad.State.Trans.Base.Raw-monad-state.get
d_get_44 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> (() -> ()) -> T_Raw'45'monad'45'state_30 -> AgdaAny
d_get_44 ~v0 ~v1 ~v2 ~v3 v4 = du_get_44 v4
du_get_44 :: T_Raw'45'monad'45'state_30 -> AgdaAny
du_get_44 v0 = coe d_gets_40 v0 erased (\ v1 -> v1)
-- Cubed.Effect.Monad.State.Trans.Base.Raw-monad-state.put
d_put_46 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (() -> ()) -> T_Raw'45'monad'45'state_30 -> AgdaAny -> AgdaAny
d_put_46 ~v0 ~v1 ~v2 ~v3 v4 v5 = du_put_46 v4 v5
du_put_46 :: T_Raw'45'monad'45'state_30 -> AgdaAny -> AgdaAny
du_put_46 v0 v1 = coe d_modify_42 v0 (\ v2 -> v1)
-- Cubed.Effect.Monad.State.Trans.Base._.get
d_get_50 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> (() -> ()) -> T_Raw'45'monad'45'state_30 -> AgdaAny
d_get_50 ~v0 ~v1 ~v2 ~v3 v4 = du_get_50 v4
du_get_50 :: T_Raw'45'monad'45'state_30 -> AgdaAny
du_get_50 v0 = coe du_get_44 (coe v0)
-- Cubed.Effect.Monad.State.Trans.Base._.gets
d_gets_52 ::
  T_Raw'45'monad'45'state_30 -> () -> (AgdaAny -> AgdaAny) -> AgdaAny
d_gets_52 v0 = coe d_gets_40 (coe v0)
-- Cubed.Effect.Monad.State.Trans.Base._.modify
d_modify_54 ::
  T_Raw'45'monad'45'state_30 -> (AgdaAny -> AgdaAny) -> AgdaAny
d_modify_54 v0 = coe d_modify_42 (coe v0)
-- Cubed.Effect.Monad.State.Trans.Base._.put
d_put_56 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (() -> ()) -> T_Raw'45'monad'45'state_30 -> AgdaAny -> AgdaAny
d_put_56 ~v0 ~v1 ~v2 ~v3 v4 = du_put_56 v4
du_put_56 :: T_Raw'45'monad'45'state_30 -> AgdaAny -> AgdaAny
du_put_56 v0 = coe du_put_46 (coe v0)
-- Cubed.Effect.Monad.State.Trans.Base.StateT
d_StateT_68 a0 a1 a2 a3 a4 = ()
newtype T_StateT_68 = C_mk_80 (AgdaAny -> AgdaAny)
-- Cubed.Effect.Monad.State.Trans.Base.StateT.run
d_run_78 :: T_StateT_68 -> AgdaAny -> AgdaAny
d_run_78 v0
  = case coe v0 of
      C_mk_80 v1 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Monad.State.Trans.Base.eval
d_eval_82 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20 ->
  T_StateT_68 -> AgdaAny -> AgdaAny
d_eval_82 ~v0 ~v1 ~v2 ~v3 ~v4 v5 v6 v7 = du_eval_82 v5 v6 v7
du_eval_82 ::
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20 ->
  T_StateT_68 -> AgdaAny -> AgdaAny
du_eval_82 v0 v1 v2
  = coe
      MAlonzo.Code.Cubed.Effect.Functor.du__'60''36''62'__28 v0
      (\ v3 -> MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe v3))
      (coe d_run_78 v1 v2)
-- Cubed.Effect.Monad.State.Trans.Base.exec
d_exec_88 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20 ->
  T_StateT_68 -> AgdaAny -> AgdaAny
d_exec_88 ~v0 ~v1 ~v2 ~v3 ~v4 v5 v6 v7 = du_exec_88 v5 v6 v7
du_exec_88 ::
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20 ->
  T_StateT_68 -> AgdaAny -> AgdaAny
du_exec_88 v0 v1 v2
  = coe
      MAlonzo.Code.Cubed.Effect.Functor.du__'60''36''62'__28 v0
      (\ v3 -> MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe v3))
      (coe d_run_78 v1 v2)
-- Cubed.Effect.Monad.State.Trans.Base.functor
d_functor_94 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20 ->
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20
d_functor_94 ~v0 ~v1 ~v2 ~v3 v4 = du_functor_94 v4
du_functor_94 ::
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20 ->
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20
du_functor_94 v0
  = coe
      MAlonzo.Code.Cubed.Effect.Functor.C_Raw'45'functor'46'constructor_209
      (coe
         (\ v1 v2 v3 v4 ->
            coe
              C_mk_80
              (coe
                 (\ v5 ->
                    coe
                      MAlonzo.Code.Cubed.Effect.Functor.du__'60''36''62'__28 v0
                      (coe
                         MAlonzo.Code.Cubed.Data.Prod.Base.du_map'45'snd_46
                         (coe (\ v6 -> v3)))
                      (coe d_run_78 v4 v5)))))
-- Cubed.Effect.Monad.State.Trans.Base.applicative
d_applicative_102 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22
d_applicative_102 ~v0 ~v1 ~v2 ~v3 v4 = du_applicative_102 v4
du_applicative_102 ::
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22
du_applicative_102 v0
  = coe
      MAlonzo.Code.Cubed.Effect.Applicative.C_Raw'45'applicative'46'constructor_453
      (coe
         du_functor_94
         (coe
            MAlonzo.Code.Cubed.Effect.Applicative.d_functor_32
            (coe MAlonzo.Code.Cubed.Effect.Monad.d_applicative_32 (coe v0))))
      (coe
         (\ v1 v2 ->
            coe
              C_mk_80
              (coe
                 (\ v3 ->
                    coe
                      MAlonzo.Code.Cubed.Effect.Applicative.d_pure_34
                      (MAlonzo.Code.Cubed.Effect.Monad.d_applicative_32 (coe v0)) erased
                      (coe
                         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v3) (coe v2))))))
      (coe
         (\ v1 v2 v3 v4 ->
            coe
              C_mk_80
              (coe
                 (\ v5 ->
                    coe
                      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36 v0
                      (coe d_run_78 v3 v5)
                      (\ v6 ->
                         case coe v6 of
                           MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v7 v8
                             -> coe
                                  MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36 v0
                                  (coe d_run_78 v4 v7)
                                  (\ v9 ->
                                     case coe v9 of
                                       MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v10 v11
                                         -> coe
                                              MAlonzo.Code.Cubed.Effect.Applicative.d_pure_34
                                              (MAlonzo.Code.Cubed.Effect.Monad.d_applicative_32
                                                 (coe v0))
                                              erased
                                              (coe
                                                 MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                 (coe v10) (coe v8 v11))
                                       _ -> MAlonzo.RTE.mazUnreachableError)
                           _ -> MAlonzo.RTE.mazUnreachableError)))))
-- Cubed.Effect.Monad.State.Trans.Base.monad
d_monad_126 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24
d_monad_126 ~v0 ~v1 ~v2 ~v3 v4 = du_monad_126 v4
du_monad_126 ::
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24
du_monad_126 v0
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.C_Raw'45'monad'46'constructor_311
      (coe du_applicative_102 (coe v0))
      (coe
         (\ v1 v2 v3 v4 ->
            coe
              C_mk_80
              (coe
                 (\ v5 ->
                    coe
                      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36 v0
                      (coe d_run_78 v3 v5)
                      (\ v6 ->
                         case coe v6 of
                           MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v7 v8
                             -> coe d_run_78 (coe v4 v8) v7
                           _ -> MAlonzo.RTE.mazUnreachableError)))))
-- Cubed.Effect.Monad.State.Trans.Base.monadT
d_monadT_140 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (() -> ()) ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monadTd_94
d_monadT_140 ~v0 ~v1 ~v2 ~v3 v4 = du_monadT_140 v4
du_monadT_140 ::
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monadTd_94
du_monadT_140 v0
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.C_Raw'45'monadTd'46'constructor_5079
      (coe v0)
      (coe
         (\ v1 v2 ->
            coe
              C_mk_80
              (coe
                 (\ v3 ->
                    coe
                      MAlonzo.Code.Cubed.Effect.Functor.du__'60''36''62'__28
                      (MAlonzo.Code.Cubed.Effect.Applicative.d_functor_32
                         (coe MAlonzo.Code.Cubed.Effect.Monad.d_applicative_32 (coe v0)))
                      (\ v4 ->
                         coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v3) (coe v4))
                      v2))))
-- Cubed.Effect.Monad.State.Trans.Base.monad-state
d_monad'45'state_148 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  T_Raw'45'monad'45'state_30
d_monad'45'state_148 ~v0 ~v1 ~v2 ~v3 v4 = du_monad'45'state_148 v4
du_monad'45'state_148 ::
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  T_Raw'45'monad'45'state_30
du_monad'45'state_148 v0
  = coe
      C_Raw'45'monad'45'state'46'constructor_291
      (coe
         (\ v1 v2 ->
            coe
              C_mk_80
              (coe
                 (\ v3 ->
                    coe
                      MAlonzo.Code.Cubed.Effect.Applicative.d_pure_34
                      (MAlonzo.Code.Cubed.Effect.Monad.d_applicative_32 (coe v0)) erased
                      (coe
                         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v3)
                         (coe v2 v3))))))
      (coe
         (\ v1 ->
            coe
              C_mk_80
              (coe
                 (\ v2 ->
                    coe
                      MAlonzo.Code.Cubed.Effect.Applicative.d_pure_34
                      (MAlonzo.Code.Cubed.Effect.Monad.d_applicative_32 (coe v0)) erased
                      (coe
                         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v1 v2)
                         (coe
                            MAlonzo.Code.Cubed.Level.C_liftℓ_32
                            (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))))))
