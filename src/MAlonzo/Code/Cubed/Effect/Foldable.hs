{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE EmptyCase #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE QualifiedDo #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}

{-# OPTIONS_GHC -Wno-overlapping-patterns #-}

module MAlonzo.Code.Cubed.Effect.Foldable where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Data.List.Base
import qualified MAlonzo.Code.Cubed.Effect.Applicative
import qualified MAlonzo.Code.Cubed.Effect.Monad
import qualified MAlonzo.Code.Cubed.Effect.Monoid
import qualified MAlonzo.Code.Cubed.Effect.Semigroup
import qualified MAlonzo.Code.Cubed.Level

-- Cubed.Effect.Foldable.Raw-foldable
d_Raw'45'foldable_26 !a0 !a1 !a2 = ()
data T_Raw'45'foldable_26
  = C_Raw'45'foldable'46'constructor_447 !(() ->
                                           MAlonzo.Code.Agda.Primitive.T_Level_18 ->
                                           () ->
                                           (AgdaAny -> AgdaAny -> AgdaAny) ->
                                           AgdaAny -> AgdaAny -> AgdaAny)
                                         !(MAlonzo.Code.Agda.Primitive.T_Level_18 ->
                                           () ->
                                           () ->
                                           (AgdaAny -> AgdaAny -> AgdaAny) ->
                                           AgdaAny -> AgdaAny -> AgdaAny)
-- Cubed.Effect.Foldable.Raw-foldable.foldr
d_foldr_34 ::
  T_Raw'45'foldable_26 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d_foldr_34 !v0
  = case coe v0 of
      !(C_Raw'45'foldable'46'constructor_447 v1 v2) -> coe v1
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Foldable.Raw-foldable.foldl
d_foldl_36 ::
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d_foldl_36 !v0
  = case coe v0 of
      !(C_Raw'45'foldable'46'constructor_447 v1 v2) -> coe v2
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Foldable.Raw-foldable.fold
d_fold_38 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'foldable_26 ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monoid.T_Raw'45'monoid_12 ->
  AgdaAny -> AgdaAny
d_fold_38 !v0 ~v1 ~v2 !v3 ~v4 !v5 = du_fold_38 v0 v3 v5
du_fold_38 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Cubed.Effect.Monoid.T_Raw'45'monoid_12 ->
  AgdaAny -> AgdaAny
du_fold_38 !v0 !v1 !v2
  = coe
      d_foldr_34 v1 erased v0 erased
      (MAlonzo.Code.Cubed.Effect.Semigroup.d__'60''62'__18
         (coe MAlonzo.Code.Cubed.Effect.Monoid.d_semigroup_20 (coe v2)))
      (MAlonzo.Code.Cubed.Effect.Monoid.d_mempty_22 (coe v2))
-- Cubed.Effect.Foldable.Raw-foldable.fold-map
d_fold'45'map_40 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monoid.T_Raw'45'monoid_12 ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d_fold'45'map_40 ~v0 ~v1 ~v2 !v3 !v4 ~v5 ~v6 !v7 !v8
  = du_fold'45'map_40 v3 v4 v7 v8
du_fold'45'map_40 ::
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Monoid.T_Raw'45'monoid_12 ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du_fold'45'map_40 !v0 !v1 !v2 !v3
  = coe
      d_foldr_34 v0 erased v1 erased
      (\ !v4 ->
         coe
           MAlonzo.Code.Cubed.Effect.Semigroup.d__'60''62'__18
           (MAlonzo.Code.Cubed.Effect.Monoid.d_semigroup_20 (coe v2))
           (coe v3 v4))
      (MAlonzo.Code.Cubed.Effect.Monoid.d_mempty_22 (coe v2))
-- Cubed.Effect.Foldable.Raw-foldable.to-list
d_to'45'list_48 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) -> T_Raw'45'foldable_26 -> () -> AgdaAny -> [AgdaAny]
d_to'45'list_48 !v0 ~v1 ~v2 !v3 ~v4 = du_to'45'list_48 v0 v3
du_to'45'list_48 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Raw'45'foldable_26 -> AgdaAny -> [AgdaAny]
du_to'45'list_48 !v0 !v1
  = coe
      d_foldr_34 v1 erased v0 erased
      (coe MAlonzo.Code.Agda.Builtin.List.C__'8759'__22)
      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
-- Cubed.Effect.Foldable.Raw-foldable.length
d_length_50 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) -> T_Raw'45'foldable_26 -> () -> AgdaAny -> Integer
d_length_50 ~v0 ~v1 ~v2 !v3 ~v4 = du_length_50 v3
du_length_50 :: T_Raw'45'foldable_26 -> AgdaAny -> Integer
du_length_50 !v0
  = coe
      d_foldr_34 v0 erased () erased
      (\ !v1 !v2 -> addInt (coe (1 :: Integer)) (coe v2)) (0 :: Integer)
-- Cubed.Effect.Foldable.Raw-foldable.foldrM
d_foldrM_54 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d_foldrM_54 ~v0 ~v1 ~v2 !v3 ~v4 ~v5 ~v6 ~v7 ~v8 !v9 !v10 !v11 !v12
  = du_foldrM_54 v3 v9 v10 v11 v12
du_foldrM_54 ::
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du_foldrM_54 !v0 !v1 !v2 !v3 !v4
  = coe
      d_foldl_36 v0 () erased erased
      (\ !v5 !v6 ->
         coe
           MAlonzo.Code.Cubed.Effect.Monad.du__'62''61''62'__46 (coe v1)
           (coe v5) (coe v2 v6))
      (coe
         MAlonzo.Code.Cubed.Effect.Applicative.d_pure_34
         (MAlonzo.Code.Cubed.Effect.Monad.d_applicative_32 (coe v1)) erased)
      v4 v3
-- Cubed.Effect.Foldable.Raw-foldable.foldlM
d_foldlM_66 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d_foldlM_66 ~v0 ~v1 ~v2 !v3 ~v4 ~v5 ~v6 ~v7 ~v8 !v9 !v10 !v11 !v12
  = du_foldlM_66 v3 v9 v10 v11 v12
du_foldlM_66 ::
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du_foldlM_66 !v0 !v1 !v2 !v3 !v4
  = coe
      d_foldr_34 v0 erased () erased
      (\ !v5 ->
         coe
           MAlonzo.Code.Cubed.Effect.Monad.du__'62''61''62'__46 (coe v1)
           (coe (\ !v6 -> coe v2 v6 v5)))
      (coe
         MAlonzo.Code.Cubed.Effect.Applicative.d_pure_34
         (MAlonzo.Code.Cubed.Effect.Monad.d_applicative_32 (coe v1)) erased)
      v4 v3
-- Cubed.Effect.Foldable.Raw-foldable.traverse-
d_traverse'45'_78 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22 ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d_traverse'45'_78 ~v0 ~v1 ~v2 !v3 ~v4 !v5 ~v6 ~v7 ~v8 !v9 !v10
  = du_traverse'45'_78 v3 v5 v9 v10
du_traverse'45'_78 ::
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22 ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du_traverse'45'_78 !v0 !v1 !v2 !v3
  = coe
      d_foldr_34 v0 erased v1 erased
      (\ !v4 ->
         coe
           MAlonzo.Code.Cubed.Effect.Applicative.du__'42''62'__46 (coe v2)
           (coe v3 v4))
      (coe
         MAlonzo.Code.Cubed.Effect.Applicative.d_pure_34 v2 erased
         (coe
            MAlonzo.Code.Cubed.Level.C_liftℓ_32
            (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
-- Cubed.Effect.Foldable.Raw-foldable.for-
d_for'45'_86 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22 ->
  AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
d_for'45'_86 ~v0 ~v1 ~v2 !v3 ~v4 !v5 ~v6 ~v7 ~v8 !v9 !v10 !v11
  = du_for'45'_86 v3 v5 v9 v10 v11
du_for'45'_86 ::
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22 ->
  AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
du_for'45'_86 !v0 !v1 !v2 !v3 !v4
  = coe du_traverse'45'_78 v0 v1 v2 v4 v3
-- Cubed.Effect.Foldable.Raw-foldable.concat
d_concat_88 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) -> T_Raw'45'foldable_26 -> () -> AgdaAny -> [AgdaAny]
d_concat_88 !v0 ~v1 ~v2 !v3 ~v4 = du_concat_88 v0 v3
du_concat_88 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Raw'45'foldable_26 -> AgdaAny -> [AgdaAny]
du_concat_88 !v0 !v1
  = coe
      d_foldr_34 v1 erased v0 erased
      (coe MAlonzo.Code.Cubed.Data.List.Base.du__'43''43'__84)
      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
-- Cubed.Effect.Foldable.Raw-foldable.concat-map
d_concat'45'map_90 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'foldable_26 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> (AgdaAny -> [AgdaAny]) -> AgdaAny -> [AgdaAny]
d_concat'45'map_90 ~v0 ~v1 ~v2 !v3 ~v4 !v5 ~v6 !v7
  = du_concat'45'map_90 v3 v5 v7
du_concat'45'map_90 ::
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (AgdaAny -> [AgdaAny]) -> AgdaAny -> [AgdaAny]
du_concat'45'map_90 !v0 !v1 !v2
  = coe
      d_foldr_34 v0 erased v1 erased
      (\ !v3 ->
         coe MAlonzo.Code.Cubed.Data.List.Base.du__'43''43'__84 (coe v2 v3))
      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
-- Cubed.Effect.Foldable._.concat
d_concat_100 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) -> T_Raw'45'foldable_26 -> () -> AgdaAny -> [AgdaAny]
d_concat_100 !v0 ~v1 ~v2 !v3 = du_concat_100 v0 v3
du_concat_100 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Raw'45'foldable_26 -> () -> AgdaAny -> [AgdaAny]
du_concat_100 !v0 !v1 !v2 = coe du_concat_88 (coe v0) (coe v1)
-- Cubed.Effect.Foldable._.concat-map
d_concat'45'map_102 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'foldable_26 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> (AgdaAny -> [AgdaAny]) -> AgdaAny -> [AgdaAny]
d_concat'45'map_102 ~v0 ~v1 ~v2 !v3 = du_concat'45'map_102 v3
du_concat'45'map_102 ::
  T_Raw'45'foldable_26 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> (AgdaAny -> [AgdaAny]) -> AgdaAny -> [AgdaAny]
du_concat'45'map_102 !v0 !v1 !v2 !v3 !v4
  = coe du_concat'45'map_90 (coe v0) v2 v4
-- Cubed.Effect.Foldable._.fold
d_fold_104 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'foldable_26 ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monoid.T_Raw'45'monoid_12 ->
  AgdaAny -> AgdaAny
d_fold_104 !v0 ~v1 ~v2 !v3 = du_fold_104 v0 v3
du_fold_104 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Raw'45'foldable_26 ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monoid.T_Raw'45'monoid_12 ->
  AgdaAny -> AgdaAny
du_fold_104 !v0 !v1 !v2 !v3 = coe du_fold_38 (coe v0) (coe v1) v3
-- Cubed.Effect.Foldable._.fold-map
d_fold'45'map_106 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monoid.T_Raw'45'monoid_12 ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d_fold'45'map_106 ~v0 ~v1 ~v2 !v3 = du_fold'45'map_106 v3
du_fold'45'map_106 ::
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monoid.T_Raw'45'monoid_12 ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du_fold'45'map_106 !v0 !v1 !v2 !v3 !v4 !v5
  = coe du_fold'45'map_40 (coe v0) v1 v4 v5
-- Cubed.Effect.Foldable._.foldl
d_foldl_108 ::
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d_foldl_108 !v0 = coe d_foldl_36 (coe v0)
-- Cubed.Effect.Foldable._.foldlM
d_foldlM_110 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d_foldlM_110 ~v0 ~v1 ~v2 !v3 = du_foldlM_110 v3
du_foldlM_110 ::
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du_foldlM_110 !v0 !v1 !v2 !v3 !v4 !v5 !v6 !v7 !v8 !v9
  = coe du_foldlM_66 (coe v0) v6 v7 v8 v9
-- Cubed.Effect.Foldable._.foldr
d_foldr_112 ::
  T_Raw'45'foldable_26 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d_foldr_112 !v0 = coe d_foldr_34 (coe v0)
-- Cubed.Effect.Foldable._.foldrM
d_foldrM_114 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d_foldrM_114 ~v0 ~v1 ~v2 !v3 = du_foldrM_114 v3
du_foldrM_114 ::
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du_foldrM_114 !v0 !v1 !v2 !v3 !v4 !v5 !v6 !v7 !v8 !v9
  = coe du_foldrM_54 (coe v0) v6 v7 v8 v9
-- Cubed.Effect.Foldable._.for-
d_for'45'_116 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22 ->
  AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
d_for'45'_116 ~v0 ~v1 ~v2 !v3 = du_for'45'_116 v3
du_for'45'_116 ::
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22 ->
  AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
du_for'45'_116 !v0 !v1 !v2 !v3 !v4 !v5 !v6 !v7 !v8
  = coe du_for'45'_86 (coe v0) v2 v6 v7 v8
-- Cubed.Effect.Foldable._.length
d_length_118 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) -> T_Raw'45'foldable_26 -> () -> AgdaAny -> Integer
d_length_118 ~v0 ~v1 ~v2 !v3 = du_length_118 v3
du_length_118 :: T_Raw'45'foldable_26 -> () -> AgdaAny -> Integer
du_length_118 !v0 !v1 = coe du_length_50 (coe v0)
-- Cubed.Effect.Foldable._.to-list
d_to'45'list_120 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) -> T_Raw'45'foldable_26 -> () -> AgdaAny -> [AgdaAny]
d_to'45'list_120 !v0 ~v1 ~v2 !v3 = du_to'45'list_120 v0 v3
du_to'45'list_120 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Raw'45'foldable_26 -> () -> AgdaAny -> [AgdaAny]
du_to'45'list_120 !v0 !v1 !v2
  = coe du_to'45'list_48 (coe v0) (coe v1)
-- Cubed.Effect.Foldable._.traverse-
d_traverse'45'_122 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22 ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d_traverse'45'_122 ~v0 ~v1 ~v2 !v3 = du_traverse'45'_122 v3
du_traverse'45'_122 ::
  T_Raw'45'foldable_26 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22 ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du_traverse'45'_122 !v0 !v1 !v2 !v3 !v4 !v5 !v6 !v7
  = coe du_traverse'45'_78 (coe v0) v2 v6 v7
