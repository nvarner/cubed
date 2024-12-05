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

module MAlonzo.Code.Cubed.Data.Maybe.Effectful where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Maybe
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Data.Maybe.Base
import qualified MAlonzo.Code.Cubed.Effect.Applicative
import qualified MAlonzo.Code.Cubed.Effect.Functor
import qualified MAlonzo.Code.Cubed.Effect.Monad

-- Cubed.Data.Maybe.Effectful.functor
d_functor_10 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20
d_functor_10 ~v0 = du_functor_10
du_functor_10 ::
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20
du_functor_10
  = coe
      MAlonzo.Code.Cubed.Effect.Functor.C_Raw'45'functor'46'constructor_209
      (coe
         (\ v0 v1 v2 v3 ->
            coe MAlonzo.Code.Cubed.Data.Maybe.Base.du_map_24 v2 v3))
-- Cubed.Data.Maybe.Effectful.applicative
d_applicative_12 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22
d_applicative_12 ~v0 = du_applicative_12
du_applicative_12 ::
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22
du_applicative_12
  = coe
      MAlonzo.Code.Cubed.Effect.Applicative.C_Raw'45'applicative'46'constructor_453
      (coe du_functor_10)
      (coe (\ v0 -> coe MAlonzo.Code.Agda.Builtin.Maybe.C_just_16))
      (coe
         (\ v0 v1 v2 v3 ->
            coe MAlonzo.Code.Cubed.Data.Maybe.Base.du_seq_48 v2 v3))
-- Cubed.Data.Maybe.Effectful.monad
d_monad_14 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24
d_monad_14 ~v0 = du_monad_14
du_monad_14 :: MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24
du_monad_14
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.C_Raw'45'monad'46'constructor_311
      (coe du_applicative_12)
      (coe
         (\ v0 v1 v2 v3 ->
            coe MAlonzo.Code.Cubed.Data.Maybe.Base.du_bind_40 v2 v3))
