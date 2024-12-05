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

module MAlonzo.Code.Cubed.Data.Maybe.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Maybe
import qualified MAlonzo.Code.Agda.Primitive

-- Cubed.Data.Maybe.Base.rec
d_rec_12 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> AgdaAny -> (AgdaAny -> AgdaAny) -> Maybe AgdaAny -> AgdaAny
d_rec_12 ~v0 ~v1 ~v2 ~v3 v4 v5 v6 = du_rec_12 v4 v5 v6
du_rec_12 ::
  AgdaAny -> (AgdaAny -> AgdaAny) -> Maybe AgdaAny -> AgdaAny
du_rec_12 v0 v1 v2
  = case coe v2 of
      MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 v3 -> coe v1 v3
      MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18 -> coe v0
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Maybe.Base.map
d_map_24 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> (AgdaAny -> AgdaAny) -> Maybe AgdaAny -> Maybe AgdaAny
d_map_24 ~v0 ~v1 ~v2 ~v3 v4 v5 = du_map_24 v4 v5
du_map_24 :: (AgdaAny -> AgdaAny) -> Maybe AgdaAny -> Maybe AgdaAny
du_map_24 v0 v1
  = case coe v1 of
      MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 v2
        -> coe MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe v0 v2)
      MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Maybe.Base.from-maybe
d_from'45'maybe_32 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> AgdaAny -> Maybe AgdaAny -> AgdaAny
d_from'45'maybe_32 ~v0 ~v1 v2 v3 = du_from'45'maybe_32 v2 v3
du_from'45'maybe_32 :: AgdaAny -> Maybe AgdaAny -> AgdaAny
du_from'45'maybe_32 v0 v1
  = case coe v1 of
      MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 v2 -> coe v2
      MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18 -> coe v0
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Maybe.Base.bind
d_bind_40 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Maybe AgdaAny -> (AgdaAny -> Maybe AgdaAny) -> Maybe AgdaAny
d_bind_40 ~v0 ~v1 ~v2 ~v3 v4 v5 = du_bind_40 v4 v5
du_bind_40 ::
  Maybe AgdaAny -> (AgdaAny -> Maybe AgdaAny) -> Maybe AgdaAny
du_bind_40 v0 v1
  = case coe v0 of
      MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 v2 -> coe v1 v2
      MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18 -> coe v0
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Maybe.Base.seq
d_seq_48 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Maybe (AgdaAny -> AgdaAny) -> Maybe AgdaAny -> Maybe AgdaAny
d_seq_48 ~v0 ~v1 ~v2 ~v3 v4 v5 = du_seq_48 v4 v5
du_seq_48 ::
  Maybe (AgdaAny -> AgdaAny) -> Maybe AgdaAny -> Maybe AgdaAny
du_seq_48 v0 v1
  = let v2 = coe MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18 in
    coe
      (case coe v0 of
         MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 v3
           -> case coe v1 of
                MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 v4
                  -> coe MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe v3 v4)
                _ -> coe v2
         _ -> coe v2)
