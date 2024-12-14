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

module MAlonzo.Code.Cubed.Data.Eq.Unsafe where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Primitive

-- Cubed.Data.Eq.Unsafe.primEraseEquality
d_primEraseEquality_16 = erased
-- Cubed.Data.Eq.Unsafe.prim-erase-equality
d_prim'45'erase'45'equality_26 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_prim'45'erase'45'equality_26 = erased
-- Cubed.Data.Eq.Unsafe.prim-trust-me
d_prim'45'trust'45'me_36 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_prim'45'trust'45'me_36 = erased
-- Cubed.Data.Eq.Unsafe._.unsafe-prim-trust-me
d_unsafe'45'prim'45'trust'45'me_46
  = error
      "MAlonzo Runtime Error: postulate evaluated: Cubed.Data.Eq.Unsafe._.unsafe-prim-trust-me"
