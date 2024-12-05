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

module MAlonzo.Code.Cubed.Effect.Monad.Id where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Effect.Applicative
import qualified MAlonzo.Code.Cubed.Effect.Functor
import qualified MAlonzo.Code.Cubed.Effect.Monad

-- Cubed.Effect.Monad.Id.Id
d_Id_14 a0 a1 = ()
newtype T_Id_14 = C_mk_22 AgdaAny
-- Cubed.Effect.Monad.Id.Id.run
d_run_20 :: T_Id_14 -> AgdaAny
d_run_20 v0
  = case coe v0 of
      C_mk_22 v1 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Monad.Id.functor
d_functor_24 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20
d_functor_24 ~v0 = du_functor_24
du_functor_24 ::
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20
du_functor_24
  = coe
      MAlonzo.Code.Cubed.Effect.Functor.C_Raw'45'functor'46'constructor_209
      (coe (\ v0 v1 v2 v3 -> coe C_mk_22 (coe v2 (d_run_20 (coe v3)))))
-- Cubed.Effect.Monad.Id.applicative
d_applicative_30 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22
d_applicative_30 ~v0 = du_applicative_30
du_applicative_30 ::
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22
du_applicative_30
  = coe
      MAlonzo.Code.Cubed.Effect.Applicative.C_Raw'45'applicative'46'constructor_453
      (coe du_functor_24) (coe (\ v0 -> coe C_mk_22))
      (coe
         (\ v0 v1 v2 v3 ->
            coe C_mk_22 (coe d_run_20 v2 (d_run_20 (coe v3)))))
-- Cubed.Effect.Monad.Id.monad
d_monad_36 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24
d_monad_36 ~v0 = du_monad_36
du_monad_36 :: MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24
du_monad_36
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.C_Raw'45'monad'46'constructor_311
      (coe du_applicative_30)
      (coe (\ v0 v1 v2 v3 -> coe v3 (d_run_20 (coe v2))))
