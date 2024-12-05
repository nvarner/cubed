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

module MAlonzo.Code.Cubed.Effect.Functor where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Level

-- Cubed.Effect.Functor.Raw-functor
d_Raw'45'functor_20 a0 a1 a2 = ()
newtype T_Raw'45'functor_20
  = C_Raw'45'functor'46'constructor_209 (() ->
                                         () -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny)
-- Cubed.Effect.Functor.Raw-functor.map
d_map_26 ::
  T_Raw'45'functor_20 ->
  () -> () -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d_map_26 v0
  = case coe v0 of
      C_Raw'45'functor'46'constructor_209 v1 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Functor.Raw-functor._<$>_
d__'60''36''62'__28 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'functor_20 ->
  () -> () -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d__'60''36''62'__28 ~v0 ~v1 ~v2 v3 ~v4 ~v5
  = du__'60''36''62'__28 v3
du__'60''36''62'__28 ::
  T_Raw'45'functor_20 -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du__'60''36''62'__28 v0 = coe d_map_26 v0 erased erased
-- Cubed.Effect.Functor.Raw-functor._<&>_
d__'60''38''62'__30 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'functor_20 ->
  () -> () -> AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
d__'60''38''62'__30 ~v0 ~v1 ~v2 v3 ~v4 ~v5 v6 v7
  = du__'60''38''62'__30 v3 v6 v7
du__'60''38''62'__30 ::
  T_Raw'45'functor_20 -> AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
du__'60''38''62'__30 v0 v1 v2 = coe d_map_26 v0 erased erased v2 v1
-- Cubed.Effect.Functor.Raw-functor._<$_
d__'60''36'__32 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'functor_20 -> () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d__'60''36'__32 ~v0 ~v1 ~v2 v3 ~v4 ~v5 v6 v7
  = du__'60''36'__32 v3 v6 v7
du__'60''36'__32 ::
  T_Raw'45'functor_20 -> AgdaAny -> AgdaAny -> AgdaAny
du__'60''36'__32 v0 v1 v2
  = coe du__'60''36''62'__28 v0 (\ v3 -> v1) v2
-- Cubed.Effect.Functor.Raw-functor._$>_
d__'36''62'__38 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'functor_20 -> () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d__'36''62'__38 ~v0 ~v1 ~v2 v3 ~v4 ~v5 v6 v7
  = du__'36''62'__38 v3 v6 v7
du__'36''62'__38 ::
  T_Raw'45'functor_20 -> AgdaAny -> AgdaAny -> AgdaAny
du__'36''62'__38 v0 v1 v2
  = coe du__'60''36'__32 (coe v0) (coe v2) (coe v1)
-- Cubed.Effect.Functor.Raw-functor.unzip
d_unzip_40 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'functor_20 ->
  () -> () -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_unzip_40 ~v0 ~v1 ~v2 v3 ~v4 ~v5 v6 = du_unzip_40 v3 v6
du_unzip_40 ::
  T_Raw'45'functor_20 ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_unzip_40 v0 v1
  = coe
      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
      (coe
         du__'60''36''62'__28 v0
         (\ v2 -> MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe v2)) v1)
      (coe
         du__'60''36''62'__28 v0
         (\ v2 -> MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe v2)) v1)
-- Cubed.Effect.Functor.Raw-functor.void
d_void_44 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) -> T_Raw'45'functor_20 -> () -> AgdaAny -> AgdaAny
d_void_44 ~v0 ~v1 ~v2 v3 ~v4 = du_void_44 v3
du_void_44 :: T_Raw'45'functor_20 -> AgdaAny -> AgdaAny
du_void_44 v0
  = coe
      du__'60''36'__32 (coe v0)
      (coe
         MAlonzo.Code.Cubed.Level.C_liftℓ_32
         (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
-- Cubed.Effect.Functor._._$>_
d__'36''62'__50 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'functor_20 -> () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d__'36''62'__50 ~v0 ~v1 ~v2 v3 = du__'36''62'__50 v3
du__'36''62'__50 ::
  T_Raw'45'functor_20 -> () -> () -> AgdaAny -> AgdaAny -> AgdaAny
du__'36''62'__50 v0 v1 v2 v3 v4
  = coe du__'36''62'__38 (coe v0) v3 v4
-- Cubed.Effect.Functor._._<$_
d__'60''36'__52 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'functor_20 -> () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d__'60''36'__52 ~v0 ~v1 ~v2 v3 = du__'60''36'__52 v3
du__'60''36'__52 ::
  T_Raw'45'functor_20 -> () -> () -> AgdaAny -> AgdaAny -> AgdaAny
du__'60''36'__52 v0 v1 v2 v3 v4
  = coe du__'60''36'__32 (coe v0) v3 v4
-- Cubed.Effect.Functor._._<$>_
d__'60''36''62'__54 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'functor_20 ->
  () -> () -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d__'60''36''62'__54 ~v0 ~v1 ~v2 v3 = du__'60''36''62'__54 v3
du__'60''36''62'__54 ::
  T_Raw'45'functor_20 ->
  () -> () -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du__'60''36''62'__54 v0 v1 v2 = coe du__'60''36''62'__28 (coe v0)
-- Cubed.Effect.Functor._._<&>_
d__'60''38''62'__56 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'functor_20 ->
  () -> () -> AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
d__'60''38''62'__56 ~v0 ~v1 ~v2 v3 = du__'60''38''62'__56 v3
du__'60''38''62'__56 ::
  T_Raw'45'functor_20 ->
  () -> () -> AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
du__'60''38''62'__56 v0 v1 v2 v3 v4
  = coe du__'60''38''62'__30 (coe v0) v3 v4
-- Cubed.Effect.Functor._.map
d_map_58 ::
  T_Raw'45'functor_20 ->
  () -> () -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d_map_58 v0 = coe d_map_26 (coe v0)
-- Cubed.Effect.Functor._.unzip
d_unzip_60 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'functor_20 ->
  () -> () -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_unzip_60 ~v0 ~v1 ~v2 v3 = du_unzip_60 v3
du_unzip_60 ::
  T_Raw'45'functor_20 ->
  () -> () -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_unzip_60 v0 v1 v2 v3 = coe du_unzip_40 (coe v0) v3
-- Cubed.Effect.Functor._.void
d_void_62 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) -> T_Raw'45'functor_20 -> () -> AgdaAny -> AgdaAny
d_void_62 ~v0 ~v1 ~v2 v3 = du_void_62 v3
du_void_62 :: T_Raw'45'functor_20 -> () -> AgdaAny -> AgdaAny
du_void_62 v0 v1 = coe du_void_44 (coe v0)
