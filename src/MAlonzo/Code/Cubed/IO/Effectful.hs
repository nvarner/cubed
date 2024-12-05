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

module MAlonzo.Code.Cubed.IO.Effectful where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Effect.Applicative
import qualified MAlonzo.Code.Cubed.Effect.Functor
import qualified MAlonzo.Code.Cubed.Effect.Monad
import qualified MAlonzo.Code.Cubed.IO.Base

-- Cubed.IO.Effectful.functor
d_functor_8 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20
d_functor_8 v0
  = coe
      MAlonzo.Code.Cubed.Effect.Functor.C_Raw'45'functor'46'constructor_209
      (coe
         (\ v1 v2 v3 v4 ->
            coe
              MAlonzo.Code.Cubed.IO.Base.d_bind_12 v0 erased v0 erased v4
              (\ v5 ->
                 coe MAlonzo.Code.Cubed.IO.Base.d_pure_10 v0 erased (coe v3 v5))))
-- Cubed.IO.Effectful.applicative
d_applicative_14 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22
d_applicative_14 v0
  = coe
      MAlonzo.Code.Cubed.Effect.Applicative.C_Raw'45'applicative'46'constructor_453
      (coe d_functor_8 (coe v0))
      (coe MAlonzo.Code.Cubed.IO.Base.d_pure_10 v0)
      (coe
         (\ v1 v2 v3 v4 ->
            coe
              MAlonzo.Code.Cubed.IO.Base.d_bind_12 v0 erased v0 erased v4
              (\ v5 ->
                 coe
                   MAlonzo.Code.Cubed.IO.Base.d_bind_12 v0 erased v0 erased v3
                   (\ v6 ->
                      coe MAlonzo.Code.Cubed.IO.Base.d_pure_10 v0 erased (coe v6 v5)))))
-- Cubed.IO.Effectful.monad
d_monad_24 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24
d_monad_24 v0
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.C_Raw'45'monad'46'constructor_311
      (coe d_applicative_14 (coe v0))
      (coe
         (\ v1 -> coe MAlonzo.Code.Cubed.IO.Base.d_bind_12 v0 erased v0))
