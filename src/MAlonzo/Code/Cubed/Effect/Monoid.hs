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

module MAlonzo.Code.Cubed.Effect.Monoid where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Data.List.Base
import qualified MAlonzo.Code.Cubed.Effect.Semigroup

-- Cubed.Effect.Monoid.Raw-monoid
d_Raw'45'monoid_12 a0 a1 = ()
data T_Raw'45'monoid_12
  = C_Raw'45'monoid'46'constructor_45 MAlonzo.Code.Cubed.Effect.Semigroup.T_Raw'45'semigroup_12
                                      AgdaAny
-- Cubed.Effect.Monoid.Raw-monoid.semigroup
d_semigroup_20 ::
  T_Raw'45'monoid_12 ->
  MAlonzo.Code.Cubed.Effect.Semigroup.T_Raw'45'semigroup_12
d_semigroup_20 v0
  = case coe v0 of
      C_Raw'45'monoid'46'constructor_45 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Monoid.Raw-monoid.mempty
d_mempty_22 :: T_Raw'45'monoid_12 -> AgdaAny
d_mempty_22 v0
  = case coe v0 of
      C_Raw'45'monoid'46'constructor_45 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Monoid.Raw-monoid.mconcat
d_mconcat_24 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Raw'45'monoid_12 -> [AgdaAny] -> AgdaAny
d_mconcat_24 ~v0 ~v1 v2 = du_mconcat_24 v2
du_mconcat_24 :: T_Raw'45'monoid_12 -> [AgdaAny] -> AgdaAny
du_mconcat_24 v0
  = coe
      MAlonzo.Code.Cubed.Data.List.Base.du_foldr_108
      (coe
         MAlonzo.Code.Cubed.Effect.Semigroup.d__'60''62'__18
         (coe d_semigroup_20 (coe v0)))
      (coe d_mempty_22 (coe v0))
-- Cubed.Effect.Monoid._.mconcat
d_mconcat_28 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Raw'45'monoid_12 -> [AgdaAny] -> AgdaAny
d_mconcat_28 ~v0 ~v1 v2 = du_mconcat_28 v2
du_mconcat_28 :: T_Raw'45'monoid_12 -> [AgdaAny] -> AgdaAny
du_mconcat_28 v0 = coe du_mconcat_24 (coe v0)
-- Cubed.Effect.Monoid._.mempty
d_mempty_30 :: T_Raw'45'monoid_12 -> AgdaAny
d_mempty_30 v0 = coe d_mempty_22 (coe v0)
