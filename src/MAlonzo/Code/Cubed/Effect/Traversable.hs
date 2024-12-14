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

module MAlonzo.Code.Cubed.Effect.Traversable where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Effect.Applicative
import qualified MAlonzo.Code.Cubed.Effect.Foldable
import qualified MAlonzo.Code.Cubed.Effect.Functor
import qualified MAlonzo.Code.Cubed.Effect.Monad

-- Cubed.Effect.Traversable.Raw-traversable
d_Raw'45'traversable_20 a0 a1 = ()
data T_Raw'45'traversable_20
  = C_Raw'45'traversable'46'constructor_493 MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20
                                            MAlonzo.Code.Cubed.Effect.Foldable.T_Raw'45'foldable_26
                                            (MAlonzo.Code.Agda.Primitive.T_Level_18 ->
                                             (() -> ()) ->
                                             () ->
                                             () ->
                                             MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22 ->
                                             (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny)
-- Cubed.Effect.Traversable.Raw-traversable.functor
d_functor_30 ::
  T_Raw'45'traversable_20 ->
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20
d_functor_30 v0
  = case coe v0 of
      C_Raw'45'traversable'46'constructor_493 v1 v2 v3 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Traversable.Raw-traversable.foldable
d_foldable_32 ::
  T_Raw'45'traversable_20 ->
  MAlonzo.Code.Cubed.Effect.Foldable.T_Raw'45'foldable_26
d_foldable_32 v0
  = case coe v0 of
      C_Raw'45'traversable'46'constructor_493 v1 v2 v3 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Traversable.Raw-traversable.traverse
d_traverse_34 ::
  T_Raw'45'traversable_20 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22 ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d_traverse_34 v0
  = case coe v0 of
      C_Raw'45'traversable'46'constructor_493 v1 v2 v3 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Traversable.Raw-traversable.sequenceA
d_sequenceA_36 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'traversable_20 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22 ->
  AgdaAny -> AgdaAny
d_sequenceA_36 v0 ~v1 v2 ~v3 ~v4 v5 = du_sequenceA_36 v0 v2 v5
du_sequenceA_36 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Raw'45'traversable_20 ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22 ->
  AgdaAny -> AgdaAny
du_sequenceA_36 v0 v1 v2
  = coe d_traverse_34 v1 v0 erased erased erased v2 (\ v3 -> v3)
-- Cubed.Effect.Traversable.Raw-traversable.mapM
d_mapM_38 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'traversable_20 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d_mapM_38 ~v0 ~v1 v2 v3 ~v4 ~v5 ~v6 v7 = du_mapM_38 v2 v3 v7
du_mapM_38 ::
  T_Raw'45'traversable_20 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du_mapM_38 v0 v1 v2
  = coe
      d_traverse_34 v0 v1 erased erased erased
      (MAlonzo.Code.Cubed.Effect.Monad.d_applicative_32 (coe v2))
-- Cubed.Effect.Traversable.Raw-traversable.forM
d_forM_40 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'traversable_20 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
d_forM_40 ~v0 ~v1 v2 v3 ~v4 ~v5 ~v6 v7 v8 v9
  = du_forM_40 v2 v3 v7 v8 v9
du_forM_40 ::
  T_Raw'45'traversable_20 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
du_forM_40 v0 v1 v2 v3 v4 = coe du_mapM_38 v0 v1 v2 v4 v3
-- Cubed.Effect.Traversable.Raw-traversable.sequence
d_sequence_42 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'traversable_20 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  AgdaAny -> AgdaAny
d_sequence_42 v0 ~v1 v2 ~v3 ~v4 v5 = du_sequence_42 v0 v2 v5
du_sequence_42 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Raw'45'traversable_20 ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  AgdaAny -> AgdaAny
du_sequence_42 v0 v1 v2
  = coe
      d_traverse_34 v1 v0 erased erased erased
      (MAlonzo.Code.Cubed.Effect.Monad.d_applicative_32 (coe v2))
      (\ v3 -> v3)
-- Cubed.Effect.Traversable._.forM
d_forM_46 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'traversable_20 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
d_forM_46 ~v0 ~v1 v2 = du_forM_46 v2
du_forM_46 ::
  T_Raw'45'traversable_20 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
du_forM_46 v0 v1 v2 v3 v4 v5 v6 v7
  = coe du_forM_40 (coe v0) v1 v5 v6 v7
-- Cubed.Effect.Traversable._.mapM
d_mapM_48 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'traversable_20 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d_mapM_48 ~v0 ~v1 v2 = du_mapM_48 v2
du_mapM_48 ::
  T_Raw'45'traversable_20 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du_mapM_48 v0 v1 v2 v3 v4 v5 = coe du_mapM_38 (coe v0) v1 v5
-- Cubed.Effect.Traversable._.sequence
d_sequence_50 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'traversable_20 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  AgdaAny -> AgdaAny
d_sequence_50 v0 ~v1 v2 = du_sequence_50 v0 v2
du_sequence_50 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Raw'45'traversable_20 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Cubed.Effect.Monad.T_Raw'45'monad_24 ->
  AgdaAny -> AgdaAny
du_sequence_50 v0 v1 v2 v3 v4
  = coe du_sequence_42 (coe v0) (coe v1) v4
-- Cubed.Effect.Traversable._.sequenceA
d_sequenceA_52 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'traversable_20 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22 ->
  AgdaAny -> AgdaAny
d_sequenceA_52 v0 ~v1 v2 = du_sequenceA_52 v0 v2
du_sequenceA_52 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Raw'45'traversable_20 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22 ->
  AgdaAny -> AgdaAny
du_sequenceA_52 v0 v1 v2 v3 v4
  = coe du_sequenceA_36 (coe v0) (coe v1) v4
-- Cubed.Effect.Traversable._.traverse
d_traverse_54 ::
  T_Raw'45'traversable_20 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22 ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d_traverse_54 v0 = coe d_traverse_34 (coe v0)
