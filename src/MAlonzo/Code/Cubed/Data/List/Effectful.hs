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

module MAlonzo.Code.Cubed.Data.List.Effectful where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Data.List.Base
import qualified MAlonzo.Code.Cubed.Effect.Applicative
import qualified MAlonzo.Code.Cubed.Effect.Foldable
import qualified MAlonzo.Code.Cubed.Effect.Functor
import qualified MAlonzo.Code.Cubed.Effect.Monad
import qualified MAlonzo.Code.Cubed.Effect.Monoid
import qualified MAlonzo.Code.Cubed.Effect.Semigroup
import qualified MAlonzo.Code.Cubed.Effect.Traversable

-- Cubed.Data.List.Effectful.semigroup
d_semigroup_12 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Effect.Semigroup.T_Raw'45'semigroup_12
d_semigroup_12 ~v0 ~v1 = du_semigroup_12
du_semigroup_12 ::
  MAlonzo.Code.Cubed.Effect.Semigroup.T_Raw'45'semigroup_12
du_semigroup_12
  = coe
      MAlonzo.Code.Cubed.Effect.Semigroup.C_Raw'45'semigroup'46'constructor_33
      (coe MAlonzo.Code.Cubed.Data.List.Base.du__'43''43'__84)
-- Cubed.Data.List.Effectful.monoid
d_monoid_14 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Effect.Monoid.T_Raw'45'monoid_12
d_monoid_14 ~v0 ~v1 = du_monoid_14
du_monoid_14 :: MAlonzo.Code.Cubed.Effect.Monoid.T_Raw'45'monoid_12
du_monoid_14
  = coe
      MAlonzo.Code.Cubed.Effect.Monoid.C_Raw'45'monoid'46'constructor_45
      (coe du_semigroup_12)
      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
-- Cubed.Data.List.Effectful.functor
d_functor_16 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20
d_functor_16 ~v0 = du_functor_16
du_functor_16 ::
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20
du_functor_16
  = coe
      MAlonzo.Code.Cubed.Effect.Functor.C_Raw'45'functor'46'constructor_209
      (coe
         (\ !v0 !v1 !v2 !v3 ->
            coe MAlonzo.Code.Cubed.Data.List.Base.du_map_40 v2 v3))
-- Cubed.Data.List.Effectful.applicative
d_applicative_18 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22
d_applicative_18 ~v0 = du_applicative_18
du_applicative_18 ::
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22
du_applicative_18
  = coe
      MAlonzo.Code.Cubed.Effect.Applicative.C_Raw'45'applicative'46'constructor_453
      (coe du_functor_16)
      (coe
         (\ !v0 !v1 ->
            coe
              MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v1)
              (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)))
      (coe
         (\ !v0 !v1 !v2 !v3 ->
            coe MAlonzo.Code.Cubed.Data.List.Base.du_seq_130 v2 v3))
-- Cubed.Data.List.Effectful.monad
d_monad_20 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24
d_monad_20 ~v0 = du_monad_20
du_monad_20 :: MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24
du_monad_20
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.C_Raw'45'monad'46'constructor_311
      (coe du_applicative_18)
      (coe
         (\ !v0 !v1 !v2 !v3 ->
            coe MAlonzo.Code.Cubed.Data.List.Base.du_bind_128 v2 v3))
-- Cubed.Data.List.Effectful.foldable
d_foldable_22 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Foldable.T_Raw'45'foldable_26
d_foldable_22 ~v0 = du_foldable_22
du_foldable_22 ::
  MAlonzo.Code.Cubed.Effect.Foldable.T_Raw'45'foldable_26
du_foldable_22
  = coe
      MAlonzo.Code.Cubed.Effect.Foldable.C_Raw'45'foldable'46'constructor_447
      (\ !v0 !v1 !v2 !v3 !v4 !v5 ->
         coe MAlonzo.Code.Cubed.Data.List.Base.du_foldr_108 v3 v4 v5)
      (coe
         (\ !v0 !v1 !v2 !v3 !v4 !v5 ->
            coe MAlonzo.Code.Cubed.Data.List.Base.du_foldl_94 v3 v4 v5))
-- Cubed.Data.List.Effectful.traversable
d_traversable_24 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Traversable.T_Raw'45'traversable_20
d_traversable_24 ~v0 = du_traversable_24
du_traversable_24 ::
  MAlonzo.Code.Cubed.Effect.Traversable.T_Raw'45'traversable_20
du_traversable_24
  = coe
      MAlonzo.Code.Cubed.Effect.Traversable.C_Raw'45'traversable'46'constructor_493
      (coe du_functor_16) (coe du_foldable_22)
      (coe
         (\ !v0 !v1 !v2 !v3 !v4 !v5 ->
            coe
              MAlonzo.Code.Cubed.Data.List.Base.du_foldr_108
              (coe
                 (\ !v6 ->
                    coe
                      MAlonzo.Code.Cubed.Effect.Applicative.du__'60''42''62'__38 v4
                      (coe
                         MAlonzo.Code.Cubed.Effect.Applicative.du__'60''42''62'__38 v4
                         (coe
                            MAlonzo.Code.Cubed.Effect.Applicative.d_pure_34 v4 erased
                            (coe MAlonzo.Code.Agda.Builtin.List.C__'8759'__22))
                         (coe v5 v6))))
              (coe
                 MAlonzo.Code.Cubed.Effect.Applicative.d_pure_34 v4 erased
                 (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16))))
