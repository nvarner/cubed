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

module MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Effect.Applicative
import qualified MAlonzo.Code.Cubed.Effect.Functor
import qualified MAlonzo.Code.Cubed.Effect.Monad

-- Cubed.Effect.Monad.Reader.Trans.Raw-monad-reader
d_Raw'45'monad'45'reader_28 a0 a1 a2 a3 = ()
data T_Raw'45'monad'45'reader_28
  = C_Raw'45'monad'45'reader'46'constructor_347 (() ->
                                                 (AgdaAny -> AgdaAny) -> AgdaAny)
                                                (() -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny)
-- Cubed.Effect.Monad.Reader.Trans.Raw-monad-reader.reader
d_reader_38 ::
  T_Raw'45'monad'45'reader_28 ->
  () -> (AgdaAny -> AgdaAny) -> AgdaAny
d_reader_38 v0
  = case coe v0 of
      C_Raw'45'monad'45'reader'46'constructor_347 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Monad.Reader.Trans.Raw-monad-reader.local
d_local_40 ::
  T_Raw'45'monad'45'reader_28 ->
  () -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d_local_40 v0
  = case coe v0 of
      C_Raw'45'monad'45'reader'46'constructor_347 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Monad.Reader.Trans.Raw-monad-reader.ask
d_ask_42 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> (() -> ()) -> T_Raw'45'monad'45'reader_28 -> AgdaAny
d_ask_42 ~v0 ~v1 ~v2 ~v3 v4 = du_ask_42 v4
du_ask_42 :: T_Raw'45'monad'45'reader_28 -> AgdaAny
du_ask_42 v0 = coe d_reader_38 v0 erased (\ v1 -> v1)
-- Cubed.Effect.Monad.Reader.Trans._.ask
d_ask_46 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> (() -> ()) -> T_Raw'45'monad'45'reader_28 -> AgdaAny
d_ask_46 ~v0 ~v1 ~v2 ~v3 v4 = du_ask_46 v4
du_ask_46 :: T_Raw'45'monad'45'reader_28 -> AgdaAny
du_ask_46 v0 = coe du_ask_42 (coe v0)
-- Cubed.Effect.Monad.Reader.Trans._.local
d_local_48 ::
  T_Raw'45'monad'45'reader_28 ->
  () -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d_local_48 v0 = coe d_local_40 (coe v0)
-- Cubed.Effect.Monad.Reader.Trans._.reader
d_reader_50 ::
  T_Raw'45'monad'45'reader_28 ->
  () -> (AgdaAny -> AgdaAny) -> AgdaAny
d_reader_50 v0 = coe d_reader_38 (coe v0)
-- Cubed.Effect.Monad.Reader.Trans.ReaderT
d_ReaderT_62 a0 a1 a2 a3 a4 = ()
newtype T_ReaderT_62 = C_mk_74 (AgdaAny -> AgdaAny)
-- Cubed.Effect.Monad.Reader.Trans.ReaderT.run
d_run_72 :: T_ReaderT_62 -> AgdaAny -> AgdaAny
d_run_72 v0
  = case coe v0 of
      C_mk_74 v1 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Monad.Reader.Trans.functor
d_functor_76 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20 ->
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20
d_functor_76 ~v0 ~v1 ~v2 ~v3 v4 = du_functor_76 v4
du_functor_76 ::
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20 ->
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20
du_functor_76 v0
  = coe
      MAlonzo.Code.Cubed.Effect.Functor.C_Raw'45'functor'46'constructor_209
      (coe
         (\ v1 v2 v3 v4 ->
            coe
              C_mk_74
              (coe
                 (\ v5 ->
                    coe
                      MAlonzo.Code.Cubed.Effect.Functor.du__'60''36''62'__28 v0 v3
                      (coe d_run_72 v4 v5)))))
-- Cubed.Effect.Monad.Reader.Trans.applicative
d_applicative_84 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22
d_applicative_84 ~v0 ~v1 ~v2 ~v3 v4 = du_applicative_84 v4
du_applicative_84 ::
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22
du_applicative_84 v0
  = coe
      MAlonzo.Code.Cubed.Effect.Applicative.C_Raw'45'applicative'46'constructor_453
      (coe
         du_functor_76
         (coe
            MAlonzo.Code.Cubed.Effect.Applicative.d_functor_32
            (coe MAlonzo.Code.Cubed.Effect.Monad.d_applicative_32 (coe v0))))
      (coe
         (\ v1 v2 ->
            coe
              C_mk_74
              (coe
                 (\ v3 ->
                    coe
                      MAlonzo.Code.Cubed.Effect.Applicative.d_pure_34
                      (MAlonzo.Code.Cubed.Effect.Monad.d_applicative_32 (coe v0)) erased
                      v2))))
      (coe
         (\ v1 v2 v3 v4 ->
            coe
              C_mk_74
              (coe
                 (\ v5 ->
                    coe
                      MAlonzo.Code.Cubed.Effect.Applicative.du__'60''42''62'__38
                      (MAlonzo.Code.Cubed.Effect.Monad.d_applicative_32 (coe v0))
                      (coe d_run_72 v3 v5) (coe d_run_72 v4 v5)))))
-- Cubed.Effect.Monad.Reader.Trans.monad
d_monad_92 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24
d_monad_92 ~v0 ~v1 ~v2 ~v3 v4 = du_monad_92 v4
du_monad_92 ::
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24
du_monad_92 v0
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.C_Raw'45'monad'46'constructor_311
      (coe du_applicative_84 (coe v0))
      (coe
         (\ v1 v2 v3 v4 ->
            coe
              C_mk_74
              (coe
                 (\ v5 ->
                    coe
                      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36 v0
                      (coe d_run_72 v3 v5) (\ v6 -> coe d_run_72 (coe v4 v6) v5)))))
-- Cubed.Effect.Monad.Reader.Trans.monadT
d_monadT_102 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (() -> ()) ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monadTd_94
d_monadT_102 ~v0 ~v1 ~v2 ~v3 v4 = du_monadT_102 v4
du_monadT_102 ::
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monadTd_94
du_monadT_102 v0
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.C_Raw'45'monadTd'46'constructor_5081
      (coe v0) (coe (\ v1 v2 -> coe C_mk_74 (coe (\ v3 -> v2))))
-- Cubed.Effect.Monad.Reader.Trans.monad-reader
d_monad'45'reader_104 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  T_Raw'45'monad'45'reader_28
d_monad'45'reader_104 ~v0 ~v1 ~v2 ~v3 v4
  = du_monad'45'reader_104 v4
du_monad'45'reader_104 ::
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  T_Raw'45'monad'45'reader_28
du_monad'45'reader_104 v0
  = coe
      C_Raw'45'monad'45'reader'46'constructor_347
      (coe
         (\ v1 v2 ->
            coe
              C_mk_74
              (coe
                 (\ v3 ->
                    coe
                      MAlonzo.Code.Cubed.Effect.Applicative.d_pure_34
                      (MAlonzo.Code.Cubed.Effect.Monad.d_applicative_32 (coe v0)) erased
                      (coe v2 v3)))))
      (coe
         (\ v1 v2 v3 ->
            coe C_mk_74 (coe (\ v4 -> coe d_run_72 v3 (coe v2 v4)))))
