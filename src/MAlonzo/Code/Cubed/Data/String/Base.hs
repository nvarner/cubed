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

module MAlonzo.Code.Cubed.Data.String.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Char
import qualified MAlonzo.Code.Agda.Builtin.String
import qualified MAlonzo.Code.Cubed.Data.List.Base

-- Cubed.Data.String.Base._≡ᵇ_
d__'8801''7495'__8 ::
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6 -> Bool
d__'8801''7495'__8
  = coe MAlonzo.Code.Agda.Builtin.String.d_primStringEquality_18
-- Cubed.Data.String.Base._++_
d__'43''43'__10 ::
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6
d__'43''43'__10
  = coe MAlonzo.Code.Agda.Builtin.String.d_primStringAppend_16
-- Cubed.Data.String.Base.split-byᵇ
d_split'45'by'7495'_12 ::
  (MAlonzo.Code.Agda.Builtin.Char.T_Char_6 -> Bool) ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  [MAlonzo.Code.Agda.Builtin.String.T_String_6]
d_split'45'by'7495'_12 v0 v1
  = coe
      MAlonzo.Code.Cubed.Data.List.Base.du_map_40
      (coe MAlonzo.Code.Agda.Builtin.String.d_primStringFromList_14)
      (coe
         MAlonzo.Code.Cubed.Data.List.Base.du_split'45'by'7495'_242 (coe v0)
         (coe MAlonzo.Code.Agda.Builtin.String.d_primStringToList_12 v1))
