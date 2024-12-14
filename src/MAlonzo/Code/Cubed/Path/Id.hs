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

module MAlonzo.Code.Cubed.Path.Id where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Id.Base
import qualified MAlonzo.Code.Cubed.Path.Base

-- Cubed.Path.Id.id-sys
d_id'45'sys_8 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Id.Base.T_Id'45'sys_18
d_id'45'sys_8 v0 ~v1 = du_id'45'sys_8 v0
du_id'45'sys_8 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Id.Base.T_Id'45'sys_18
du_id'45'sys_8 v0
  = coe
      MAlonzo.Code.Cubed.Id.Base.C_Id'45'sys'46'constructor_487
      (\ v1 v2 -> v1) (\ v1 v2 v3 -> v3)
      (\ v1 v2 ->
         coe
           MAlonzo.Code.Cubed.Path.Base.du_path'45'to'45'refl_272 (coe v0) v1)
