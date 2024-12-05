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

module MAlonzo.Code.Cubed.Fun.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive

-- Cubed.Fun.Base.id
d_id_32 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> () -> AgdaAny -> AgdaAny
d_id_32 ~v0 ~v1 v2 = du_id_32 v2
du_id_32 :: AgdaAny -> AgdaAny
du_id_32 v0 = coe v0
-- Cubed.Fun.Base.const
d_const_36 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> AgdaAny -> AgdaAny -> AgdaAny
d_const_36 ~v0 ~v1 ~v2 ~v3 v4 ~v5 = du_const_36 v4
du_const_36 :: AgdaAny -> AgdaAny
du_const_36 v0 = coe v0
-- Cubed.Fun.Base.flip
d_flip_54 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d_flip_54 ~v0 ~v1 ~v2 ~v3 ~v4 ~v5 v6 v7 v8 = du_flip_54 v6 v7 v8
du_flip_54 ::
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du_flip_54 v0 v1 v2 = coe v0 v2 v1
-- Cubed.Fun.Base.curry'
d_curry''_62 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny) ->
  AgdaAny -> AgdaAny -> AgdaAny
d_curry''_62 ~v0 ~v1 ~v2 ~v3 ~v4 ~v5 v6 v7 v8
  = du_curry''_62 v6 v7 v8
du_curry''_62 ::
  (MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny) ->
  AgdaAny -> AgdaAny -> AgdaAny
du_curry''_62 v0 v1 v2
  = coe
      v0
      (coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v1) (coe v2))
-- Cubed.Fun.Base.uncurry'
d_uncurry''_70 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_uncurry''_70 ~v0 ~v1 ~v2 ~v3 ~v4 ~v5 v6 v7
  = du_uncurry''_70 v6 v7
du_uncurry''_70 ::
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
du_uncurry''_70 v0 v1
  = case coe v1 of
      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v2 v3 -> coe v0 v2 v3
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Fun.Base._∘_
d__'8728'__90 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> MAlonzo.Code.Agda.Primitive.T_Level_18) ->
  (AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Primitive.T_Level_18) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d__'8728'__90 ~v0 ~v1 ~v2 ~v3 ~v4 ~v5 v6 v7 v8
  = du__'8728'__90 v6 v7 v8
du__'8728'__90 ::
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du__'8728'__90 v0 v1 v2 = coe v0 v2 (coe v1 v2)
-- Cubed.Fun.Base._∘'_
d__'8728'''__98 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d__'8728'''__98 ~v0 ~v1 ~v2 ~v3 ~v4 ~v5 v6 v7 v8
  = du__'8728'''__98 v6 v7 v8
du__'8728'''__98 ::
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du__'8728'''__98 v0 v1 v2 = coe v0 (coe v1 v2)
-- Cubed.Fun.Base._∘₂_
d__'8728''8322'__124 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> MAlonzo.Code.Agda.Primitive.T_Level_18) ->
  (AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Primitive.T_Level_18) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny ->
   AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Primitive.T_Level_18) ->
  (AgdaAny -> AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d__'8728''8322'__124 ~v0 ~v1 ~v2 ~v3 ~v4 ~v5 ~v6 ~v7 v8 v9 v10 v11
  = du__'8728''8322'__124 v8 v9 v10 v11
du__'8728''8322'__124 ::
  (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du__'8728''8322'__124 v0 v1 v2 v3 = coe v0 v2 v3 (coe v1 v2 v3)
-- Cubed.Fun.Base._$_
d__'36'__140 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> MAlonzo.Code.Agda.Primitive.T_Level_18) ->
  (AgdaAny -> ()) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d__'36'__140 ~v0 ~v1 ~v2 ~v3 v4 v5 = du__'36'__140 v4 v5
du__'36'__140 :: (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du__'36'__140 v0 v1 = coe v0 v1
-- Cubed.Fun.Base._|>_
d__'124''62'__152 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> MAlonzo.Code.Agda.Primitive.T_Level_18) ->
  (AgdaAny -> ()) -> AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
d__'124''62'__152 ~v0 ~v1 ~v2 ~v3 v4 v5 = du__'124''62'__152 v4 v5
du__'124''62'__152 :: AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
du__'124''62'__152 v0 v1 = coe v1 v0
-- Cubed.Fun.Base._$-
d__'36''45'_164 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> MAlonzo.Code.Agda.Primitive.T_Level_18) ->
  (AgdaAny -> ()) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d__'36''45'_164 ~v0 ~v1 ~v2 ~v3 v4 v5 = du__'36''45'_164 v4 v5
du__'36''45'_164 :: (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du__'36''45'_164 v0 v1 = coe v0 v1
-- Cubed.Fun.Base.λ-
d_λ'45'_174 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> MAlonzo.Code.Agda.Primitive.T_Level_18) ->
  (AgdaAny -> ()) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d_λ'45'_174 ~v0 ~v1 ~v2 ~v3 v4 v5 = du_λ'45'_174 v4 v5
du_λ'45'_174 :: (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du_λ'45'_174 v0 v1 = coe v0 v1
-- Cubed.Fun.Base.it
d_it_180 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> () -> AgdaAny -> AgdaAny
d_it_180 ~v0 ~v1 v2 = du_it_180 v2
du_it_180 :: AgdaAny -> AgdaAny
du_it_180 v0 = coe v0
