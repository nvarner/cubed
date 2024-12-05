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

module MAlonzo.Code.Cubed.IO.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.IO
import qualified MAlonzo.Code.Agda.Builtin.String
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive

import qualified Data.Text.IO as Text
-- Cubed.IO.Base.pure
d_pure_10 ::
  forall xA'46'1.
    forall xA.
      MAlonzo.Code.Agda.Primitive.T_Level_18 ->
      () -> xA -> MAlonzo.Code.Agda.Builtin.IO.T_IO_8 xA'46'1 xA
d_pure_10 = \_ _ -> return
-- Cubed.IO.Base.bind
d_bind_12 ::
  forall xA'46'1.
    forall xA.
      forall xB'46'1.
        forall xB.
          MAlonzo.Code.Agda.Primitive.T_Level_18 ->
          () ->
          MAlonzo.Code.Agda.Primitive.T_Level_18 ->
          () ->
          MAlonzo.Code.Agda.Builtin.IO.T_IO_8 xA'46'1 xA ->
          (xA -> MAlonzo.Code.Agda.Builtin.IO.T_IO_8 xB'46'1 xB) ->
          MAlonzo.Code.Agda.Builtin.IO.T_IO_8 xB'46'1 xB
d_bind_12 = \_ _ _ _ -> (>>=)
-- Cubed.IO.Base.put-str-ln
d_put'45'str'45'ln_14 ::
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.Agda.Builtin.IO.T_IO_8
    () MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6
d_put'45'str'45'ln_14 = Text.putStrLn
-- Cubed.IO.Base.get-line
d_get'45'line_16 ::
  MAlonzo.Code.Agda.Builtin.IO.T_IO_8
    () MAlonzo.Code.Agda.Builtin.String.T_String_6
d_get'45'line_16 = Text.getLine
