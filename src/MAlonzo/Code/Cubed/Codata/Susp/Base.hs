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

module MAlonzo.Code.Cubed.Codata.Susp.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive

-- Cubed.Codata.Susp.Base.Susp
d_Susp_18 a0 a1 = ()
data T_Susp_18 = C_delay_26 AgdaAny
-- Cubed.Codata.Susp.Base.Susp.force
d_force_24 :: T_Susp_18 -> AgdaAny
d_force_24 v0
  = case coe v0 of
      C_delay_26 v1 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Codata.Susp.Base.rec
d_rec_28 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> (AgdaAny -> AgdaAny) -> T_Susp_18 -> AgdaAny
d_rec_28 ~v0 ~v1 ~v2 ~v3 v4 v5 = du_rec_28 v4 v5
du_rec_28 :: (AgdaAny -> AgdaAny) -> T_Susp_18 -> AgdaAny
du_rec_28 v0 v1 = coe v0 (d_force_24 (coe v1))
-- Cubed.Codata.Susp.Base.map
d_map_34 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> (AgdaAny -> AgdaAny) -> T_Susp_18 -> T_Susp_18
d_map_34 ~v0 ~v1 ~v2 ~v3 v4 v5 = du_map_34 v4 v5
du_map_34 :: (AgdaAny -> AgdaAny) -> T_Susp_18 -> T_Susp_18
du_map_34 v0 v1 = coe C_delay_26 (coe du_rec_28 (coe v0) (coe v1))
