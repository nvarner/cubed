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

module MAlonzo.Code.Cubed.Data.Char.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Char
import qualified MAlonzo.Code.Agda.Builtin.Maybe

-- Cubed.Data.Char.Base._≡ᵇ_
d__'8801''7495'__8 ::
  MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
  MAlonzo.Code.Agda.Builtin.Char.T_Char_6 -> Bool
d__'8801''7495'__8
  = coe MAlonzo.Code.Agda.Builtin.Char.d_primCharEquality_32
-- Cubed.Data.Char.Base.parse-digit
d_parse'45'digit_10 ::
  MAlonzo.Code.Agda.Builtin.Char.T_Char_6 -> Maybe Integer
d_parse'45'digit_10 v0
  = let v1 = coe MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18 in
    coe
      (case coe v0 of
         '0'
           -> coe
                MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe (0 :: Integer))
         '1'
           -> coe
                MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe (1 :: Integer))
         '2'
           -> coe
                MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe (2 :: Integer))
         '3'
           -> coe
                MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe (3 :: Integer))
         '4'
           -> coe
                MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe (4 :: Integer))
         '5'
           -> coe
                MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe (5 :: Integer))
         '6'
           -> coe
                MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe (6 :: Integer))
         '7'
           -> coe
                MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe (7 :: Integer))
         '8'
           -> coe
                MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe (8 :: Integer))
         '9'
           -> coe
                MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe (9 :: Integer))
         _ -> coe v1)
