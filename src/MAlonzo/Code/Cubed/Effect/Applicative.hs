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

module MAlonzo.Code.Cubed.Effect.Applicative where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Data.Dec.Base
import qualified MAlonzo.Code.Cubed.Effect.Functor
import qualified MAlonzo.Code.Cubed.Level

-- Cubed.Effect.Applicative.Raw-applicative
d_Raw'45'applicative_22 a0 a1 a2 = ()
data T_Raw'45'applicative_22
  = C_Raw'45'applicative'46'constructor_453 MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20
                                            (() -> AgdaAny -> AgdaAny)
                                            (() -> () -> AgdaAny -> AgdaAny -> AgdaAny)
-- Cubed.Effect.Applicative.Raw-applicative.functor
d_functor_32 ::
  T_Raw'45'applicative_22 ->
  MAlonzo.Code.Cubed.Effect.Functor.T_Raw'45'functor_20
d_functor_32 v0
  = case coe v0 of
      C_Raw'45'applicative'46'constructor_453 v1 v2 v3 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Applicative.Raw-applicative.pure
d_pure_34 :: T_Raw'45'applicative_22 -> () -> AgdaAny -> AgdaAny
d_pure_34 v0
  = case coe v0 of
      C_Raw'45'applicative'46'constructor_453 v1 v2 v3 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Applicative.Raw-applicative.seq
d_seq_36 ::
  T_Raw'45'applicative_22 ->
  () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d_seq_36 v0
  = case coe v0 of
      C_Raw'45'applicative'46'constructor_453 v1 v2 v3 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Applicative.Raw-applicative._<*>_
d__'60''42''62'__38 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'applicative_22 ->
  () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d__'60''42''62'__38 ~v0 ~v1 ~v2 v3 ~v4 ~v5
  = du__'60''42''62'__38 v3
du__'60''42''62'__38 ::
  T_Raw'45'applicative_22 -> AgdaAny -> AgdaAny -> AgdaAny
du__'60''42''62'__38 v0 = coe d_seq_36 v0 erased erased
-- Cubed.Effect.Applicative.Raw-applicative._<*_
d__'60''42'__40 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'applicative_22 ->
  () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d__'60''42'__40 ~v0 ~v1 ~v2 v3 ~v4 ~v5 v6 v7
  = du__'60''42'__40 v3 v6 v7
du__'60''42'__40 ::
  T_Raw'45'applicative_22 -> AgdaAny -> AgdaAny -> AgdaAny
du__'60''42'__40 v0 v1 v2
  = coe
      du__'60''42''62'__38 v0
      (coe
         MAlonzo.Code.Cubed.Effect.Functor.du__'60''36''62'__28
         (d_functor_32 (coe v0)) (\ v3 v4 -> v3) v1)
      v2
-- Cubed.Effect.Applicative.Raw-applicative._*>_
d__'42''62'__46 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'applicative_22 ->
  () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d__'42''62'__46 ~v0 ~v1 ~v2 v3 ~v4 ~v5 v6 v7
  = du__'42''62'__46 v3 v6 v7
du__'42''62'__46 ::
  T_Raw'45'applicative_22 -> AgdaAny -> AgdaAny -> AgdaAny
du__'42''62'__46 v0 v1 v2
  = coe
      du__'60''42''62'__38 v0
      (coe
         MAlonzo.Code.Cubed.Effect.Functor.du__'60''36''62'__28
         (d_functor_32 (coe v0)) (\ v3 v4 -> v4) v1)
      v2
-- Cubed.Effect.Applicative.Raw-applicative.zip-with
d_zip'45'with_52 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'applicative_22 ->
  () ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d_zip'45'with_52 ~v0 ~v1 ~v2 v3 ~v4 ~v5 ~v6 v7 v8 v9
  = du_zip'45'with_52 v3 v7 v8 v9
du_zip'45'with_52 ::
  T_Raw'45'applicative_22 ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du_zip'45'with_52 v0 v1 v2 v3
  = coe
      du__'60''42''62'__38 v0
      (coe du__'60''42''62'__38 v0 (coe d_pure_34 v0 erased v1) v2) v3
-- Cubed.Effect.Applicative.Raw-applicative.zip
d_zip_60 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'applicative_22 ->
  () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d_zip_60 ~v0 ~v1 ~v2 v3 ~v4 ~v5 = du_zip_60 v3
du_zip_60 ::
  T_Raw'45'applicative_22 -> AgdaAny -> AgdaAny -> AgdaAny
du_zip_60 v0
  = coe
      du_zip'45'with_52 (coe v0)
      (coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32)
-- Cubed.Effect.Applicative.Raw-applicative._<**>_
d__'60''42''42''62'__62 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'applicative_22 ->
  () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d__'60''42''42''62'__62 ~v0 ~v1 ~v2 v3 ~v4 ~v5
  = du__'60''42''42''62'__62 v3
du__'60''42''42''62'__62 ::
  T_Raw'45'applicative_22 -> AgdaAny -> AgdaAny -> AgdaAny
du__'60''42''42''62'__62 v0
  = coe du_zip'45'with_52 (coe v0) (coe (\ v1 v2 -> coe v2 v1))
-- Cubed.Effect.Applicative.Raw-applicative.when
d_when_64 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'applicative_22 ->
  () ->
  MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18 -> AgdaAny -> AgdaAny
d_when_64 ~v0 ~v1 ~v2 v3 ~v4 v5 v6 = du_when_64 v3 v5 v6
du_when_64 ::
  T_Raw'45'applicative_22 ->
  MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18 -> AgdaAny -> AgdaAny
du_when_64 v0 v1 v2
  = coe
      MAlonzo.Code.Cubed.Data.Dec.Base.du_rec_46
      (coe
         (\ v3 ->
            coe du__'60''42''62'__38 v0 v2 (coe d_pure_34 v0 erased v3)))
      (let v3
             = coe
                 d_pure_34 v0 erased
                 (coe
                    MAlonzo.Code.Cubed.Level.C_liftℓ_32
                    (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)) in
       coe (coe (\ v4 -> v3)))
      (coe v1)
-- Cubed.Effect.Applicative.Raw-applicative.unless
d_unless_72 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'applicative_22 ->
  () ->
  MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18 -> AgdaAny -> AgdaAny
d_unless_72 ~v0 ~v1 ~v2 v3 ~v4 v5 v6 = du_unless_72 v3 v5 v6
du_unless_72 ::
  T_Raw'45'applicative_22 ->
  MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18 -> AgdaAny -> AgdaAny
du_unless_72 v0 v1 v2
  = coe
      MAlonzo.Code.Cubed.Data.Dec.Base.du_rec_46
      (let v3
             = coe
                 d_pure_34 v0 erased
                 (coe
                    MAlonzo.Code.Cubed.Level.C_liftℓ_32
                    (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)) in
       coe (coe (\ v4 -> v3)))
      (coe
         (\ v3 ->
            coe du__'60''42''62'__38 v0 v2 (coe d_pure_34 v0 erased v3)))
      (coe v1)
-- Cubed.Effect.Applicative._._*>_
d__'42''62'__82 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'applicative_22 ->
  () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d__'42''62'__82 ~v0 ~v1 ~v2 v3 = du__'42''62'__82 v3
du__'42''62'__82 ::
  T_Raw'45'applicative_22 ->
  () -> () -> AgdaAny -> AgdaAny -> AgdaAny
du__'42''62'__82 v0 v1 v2 v3 v4
  = coe du__'42''62'__46 (coe v0) v3 v4
-- Cubed.Effect.Applicative._._<*_
d__'60''42'__84 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'applicative_22 ->
  () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d__'60''42'__84 ~v0 ~v1 ~v2 v3 = du__'60''42'__84 v3
du__'60''42'__84 ::
  T_Raw'45'applicative_22 ->
  () -> () -> AgdaAny -> AgdaAny -> AgdaAny
du__'60''42'__84 v0 v1 v2 v3 v4
  = coe du__'60''42'__40 (coe v0) v3 v4
-- Cubed.Effect.Applicative._._<**>_
d__'60''42''42''62'__86 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'applicative_22 ->
  () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d__'60''42''42''62'__86 ~v0 ~v1 ~v2 v3
  = du__'60''42''42''62'__86 v3
du__'60''42''42''62'__86 ::
  T_Raw'45'applicative_22 ->
  () -> () -> AgdaAny -> AgdaAny -> AgdaAny
du__'60''42''42''62'__86 v0 v1 v2
  = coe du__'60''42''42''62'__62 (coe v0)
-- Cubed.Effect.Applicative._._<*>_
d__'60''42''62'__88 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'applicative_22 ->
  () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d__'60''42''62'__88 ~v0 ~v1 ~v2 v3 = du__'60''42''62'__88 v3
du__'60''42''62'__88 ::
  T_Raw'45'applicative_22 ->
  () -> () -> AgdaAny -> AgdaAny -> AgdaAny
du__'60''42''62'__88 v0 v1 v2 = coe du__'60''42''62'__38 (coe v0)
-- Cubed.Effect.Applicative._.pure
d_pure_90 :: T_Raw'45'applicative_22 -> () -> AgdaAny -> AgdaAny
d_pure_90 v0 = coe d_pure_34 (coe v0)
-- Cubed.Effect.Applicative._.seq
d_seq_92 ::
  T_Raw'45'applicative_22 ->
  () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d_seq_92 v0 = coe d_seq_36 (coe v0)
-- Cubed.Effect.Applicative._.unless
d_unless_94 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'applicative_22 ->
  () ->
  MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18 -> AgdaAny -> AgdaAny
d_unless_94 ~v0 ~v1 ~v2 v3 = du_unless_94 v3
du_unless_94 ::
  T_Raw'45'applicative_22 ->
  () ->
  MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18 -> AgdaAny -> AgdaAny
du_unless_94 v0 v1 v2 v3 = coe du_unless_72 (coe v0) v2 v3
-- Cubed.Effect.Applicative._.when
d_when_96 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'applicative_22 ->
  () ->
  MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18 -> AgdaAny -> AgdaAny
d_when_96 ~v0 ~v1 ~v2 v3 = du_when_96 v3
du_when_96 ::
  T_Raw'45'applicative_22 ->
  () ->
  MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18 -> AgdaAny -> AgdaAny
du_when_96 v0 v1 v2 v3 = coe du_when_64 (coe v0) v2 v3
-- Cubed.Effect.Applicative._.zip
d_zip_98 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'applicative_22 ->
  () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d_zip_98 ~v0 ~v1 ~v2 v3 = du_zip_98 v3
du_zip_98 ::
  T_Raw'45'applicative_22 ->
  () -> () -> AgdaAny -> AgdaAny -> AgdaAny
du_zip_98 v0 v1 v2 = coe du_zip_60 (coe v0)
-- Cubed.Effect.Applicative._.zip-with
d_zip'45'with_100 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'applicative_22 ->
  () ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d_zip'45'with_100 ~v0 ~v1 ~v2 v3 = du_zip'45'with_100 v3
du_zip'45'with_100 ::
  T_Raw'45'applicative_22 ->
  () ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du_zip'45'with_100 v0 v1 v2 v3 v4 v5 v6
  = coe du_zip'45'with_52 (coe v0) v4 v5 v6
