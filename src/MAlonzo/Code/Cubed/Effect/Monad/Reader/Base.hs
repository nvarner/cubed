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

module MAlonzo.Code.Cubed.Effect.Monad.Reader.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Effect.Monad.Id
import qualified MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans

-- Cubed.Effect.Monad.Reader.Base.Reader
d_Reader_20 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> () -> () -> ()
d_Reader_20 = erased
-- Cubed.Effect.Monad.Reader.Base.run
d_run_24 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.T_ReaderT_62 ->
  AgdaAny -> AgdaAny
d_run_24 ~v0 ~v1 ~v2 v3 v4 = du_run_24 v3 v4
du_run_24 ::
  MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.T_ReaderT_62 ->
  AgdaAny -> AgdaAny
du_run_24 v0 v1
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.Id.d_run_20
      (coe MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.d_run_72 v0 v1)
