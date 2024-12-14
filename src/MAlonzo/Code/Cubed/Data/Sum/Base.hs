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

module MAlonzo.Code.Cubed.Data.Sum.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive

-- Cubed.Data.Sum.Base._⊎_
d__'8846'__24 a0 a1 a2 a3 = ()
data T__'8846'__24 = C_inl_30 AgdaAny | C_inr_32 AgdaAny
-- Cubed.Data.Sum.Base.[_,_]
d_'91'_'44'_'93'_42 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (T__'8846'__24 -> ()) ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> T__'8846'__24 -> AgdaAny
d_'91'_'44'_'93'_42 ~v0 ~v1 ~v2 ~v3 ~v4 ~v5 v6 v7 v8
  = du_'91'_'44'_'93'_42 v6 v7 v8
du_'91'_'44'_'93'_42 ::
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> T__'8846'__24 -> AgdaAny
du_'91'_'44'_'93'_42 v0 v1 v2
  = case coe v2 of
      C_inl_30 v3 -> coe v0 v3
      C_inr_32 v3 -> coe v1 v3
      _ -> MAlonzo.RTE.mazUnreachableError
