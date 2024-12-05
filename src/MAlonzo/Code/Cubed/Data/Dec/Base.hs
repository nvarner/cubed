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

module MAlonzo.Code.Cubed.Data.Dec.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Data.Empty.Base

-- Cubed.Data.Dec.Base.Dec
d_Dec_18 a0 a1 = ()
data T_Dec_18 = C_yes_22 AgdaAny | C_no_24
-- Cubed.Data.Dec.Base.Is-discrete
d_Is'45'discrete_26 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> () -> ()
d_Is'45'discrete_26 = erased
-- Cubed.Data.Dec.Base.Decidable
d_Decidable_36 :: MAlonzo.Code.Agda.Primitive.T_Level_18 -> ()
d_Decidable_36 = erased
-- Cubed.Data.Dec.Base.Discrete
d_Discrete_42 :: MAlonzo.Code.Agda.Primitive.T_Level_18 -> ()
d_Discrete_42 = erased
-- Cubed.Data.Dec.Base.rec
d_rec_46 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  ((AgdaAny -> MAlonzo.Code.Cubed.Data.Empty.Base.T_Empty_10) ->
   AgdaAny) ->
  T_Dec_18 -> AgdaAny
d_rec_46 ~v0 ~v1 ~v2 ~v3 v4 v5 v6 = du_rec_46 v4 v5 v6
du_rec_46 ::
  (AgdaAny -> AgdaAny) ->
  ((AgdaAny -> MAlonzo.Code.Cubed.Data.Empty.Base.T_Empty_10) ->
   AgdaAny) ->
  T_Dec_18 -> AgdaAny
du_rec_46 v0 v1 v2
  = case coe v2 of
      C_yes_22 v3 -> coe v0 v3
      C_no_24 -> coe v1 erased
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Dec.Base.map
d_map_60 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  ((AgdaAny -> MAlonzo.Code.Cubed.Data.Empty.Base.T_Empty_10) ->
   AgdaAny -> MAlonzo.Code.Cubed.Data.Empty.Base.T_Empty_10) ->
  T_Dec_18 -> T_Dec_18
d_map_60 ~v0 ~v1 ~v2 ~v3 v4 ~v5 v6 = du_map_60 v4 v6
du_map_60 :: (AgdaAny -> AgdaAny) -> T_Dec_18 -> T_Dec_18
du_map_60 v0 v1
  = case coe v1 of
      C_yes_22 v2 -> coe C_yes_22 (coe v0 v2)
      C_no_24 -> coe C_no_24
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Dec.Base._≟_
d__'8799'__78 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  AgdaAny -> AgdaAny -> (AgdaAny -> AgdaAny -> T_Dec_18) -> T_Dec_18
d__'8799'__78 ~v0 ~v1 v2 v3 v4 = du__'8799'__78 v2 v3 v4
du__'8799'__78 ::
  AgdaAny -> AgdaAny -> (AgdaAny -> AgdaAny -> T_Dec_18) -> T_Dec_18
du__'8799'__78 v0 v1 v2 = coe v2 v0 v1
