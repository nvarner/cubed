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

module MAlonzo.Code.Cubed.Data.Char.Properties where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Agda.Builtin.Char
import qualified MAlonzo.Code.Cubed.Data.Bool.Properties
import qualified MAlonzo.Code.Cubed.Data.Char.Base
import qualified MAlonzo.Code.Cubed.Data.Dec.Base

-- Cubed.Data.Char.Properties.char-is-discrete
d_char'45'is'45'discrete_8 ::
  MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
  MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
  MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18
d_char'45'is'45'discrete_8 v0 v1
  = coe
      MAlonzo.Code.Cubed.Data.Dec.Base.du_map_60 (coe (\ v2 v3 -> v0))
      (coe
         MAlonzo.Code.Cubed.Data.Dec.Base.du__'8799'__78
         (coe MAlonzo.Code.Cubed.Data.Char.Base.d__'8801''7495'__8 v0 v1)
         (coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10)
         (coe MAlonzo.Code.Cubed.Data.Bool.Properties.d_is'45'discrete_12))
