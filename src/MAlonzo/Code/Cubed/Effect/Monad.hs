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

module MAlonzo.Code.Cubed.Effect.Monad where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Effect.Applicative

-- Cubed.Effect.Monad.Raw-monad
d_Raw'45'monad_24 a0 a1 a2 = ()
data T_Raw'45'monad_24
  = C_Raw'45'monad'46'constructor_311 MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22
                                      (() -> () -> AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny)
-- Cubed.Effect.Monad.Raw-monad.applicative
d_applicative_32 ::
  T_Raw'45'monad_24 ->
  MAlonzo.Code.Cubed.Effect.Applicative.T_Raw'45'applicative_22
d_applicative_32 v0
  = case coe v0 of
      C_Raw'45'monad'46'constructor_311 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Monad.Raw-monad.bind
d_bind_34 ::
  T_Raw'45'monad_24 ->
  () -> () -> AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
d_bind_34 v0
  = case coe v0 of
      C_Raw'45'monad'46'constructor_311 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Monad.Raw-monad._>>=_
d__'62''62''61'__36 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'monad_24 ->
  () -> () -> AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
d__'62''62''61'__36 ~v0 ~v1 ~v2 v3 ~v4 ~v5
  = du__'62''62''61'__36 v3
du__'62''62''61'__36 ::
  T_Raw'45'monad_24 -> AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
du__'62''62''61'__36 v0 = coe d_bind_34 v0 erased erased
-- Cubed.Effect.Monad.Raw-monad._>>_
d__'62''62'__38 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'monad_24 -> () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d__'62''62'__38 ~v0 ~v1 ~v2 v3 ~v4 ~v5 v6 v7
  = du__'62''62'__38 v3 v6 v7
du__'62''62'__38 ::
  T_Raw'45'monad_24 -> AgdaAny -> AgdaAny -> AgdaAny
du__'62''62'__38 v0 v1 v2
  = coe du__'62''62''61'__36 v0 v1 (\ v3 -> v2)
-- Cubed.Effect.Monad.Raw-monad._=<<_
d__'61''60''60'__44 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'monad_24 ->
  () -> () -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d__'61''60''60'__44 ~v0 ~v1 ~v2 v3 ~v4 ~v5 v6 v7
  = du__'61''60''60'__44 v3 v6 v7
du__'61''60''60'__44 ::
  T_Raw'45'monad_24 -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du__'61''60''60'__44 v0 v1 v2
  = coe d_bind_34 v0 erased erased v2 v1
-- Cubed.Effect.Monad.Raw-monad._>=>_
d__'62''61''62'__46 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'monad_24 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  () ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d__'62''61''62'__46 ~v0 ~v1 ~v2 v3 ~v4 ~v5 ~v6 ~v7 v8 v9 v10
  = du__'62''61''62'__46 v3 v8 v9 v10
du__'62''61''62'__46 ::
  T_Raw'45'monad_24 ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du__'62''61''62'__46 v0 v1 v2 v3
  = coe du__'62''62''61'__36 v0 (coe v1 v3) v2
-- Cubed.Effect.Monad.Raw-monad._<=<_
d__'60''61''60'__54 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'monad_24 ->
  () ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d__'60''61''60'__54 ~v0 ~v1 ~v2 v3 ~v4 ~v5 ~v6 ~v7 v8 v9
  = du__'60''61''60'__54 v3 v8 v9
du__'60''61''60'__54 ::
  T_Raw'45'monad_24 ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du__'60''61''60'__54 v0 v1 v2
  = coe du__'62''61''62'__46 (coe v0) (coe v2) (coe v1)
-- Cubed.Effect.Monad._._<=<_
d__'60''61''60'__58 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'monad_24 ->
  () ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d__'60''61''60'__58 ~v0 ~v1 ~v2 v3 = du__'60''61''60'__58 v3
du__'60''61''60'__58 ::
  T_Raw'45'monad_24 ->
  () ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du__'60''61''60'__58 v0 v1 v2 v3 v4 v5 v6
  = coe du__'60''61''60'__54 (coe v0) v5 v6
-- Cubed.Effect.Monad._._=<<_
d__'61''60''60'__60 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'monad_24 ->
  () -> () -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d__'61''60''60'__60 ~v0 ~v1 ~v2 v3 = du__'61''60''60'__60 v3
du__'61''60''60'__60 ::
  T_Raw'45'monad_24 ->
  () -> () -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du__'61''60''60'__60 v0 v1 v2 v3 v4
  = coe du__'61''60''60'__44 (coe v0) v3 v4
-- Cubed.Effect.Monad._._>=>_
d__'62''61''62'__62 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'monad_24 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  () ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d__'62''61''62'__62 ~v0 ~v1 ~v2 v3 = du__'62''61''62'__62 v3
du__'62''61''62'__62 ::
  T_Raw'45'monad_24 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  () ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du__'62''61''62'__62 v0 v1 v2 v3 v4 v5 v6 v7
  = coe du__'62''61''62'__46 (coe v0) v5 v6 v7
-- Cubed.Effect.Monad._._>>_
d__'62''62'__64 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'monad_24 -> () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d__'62''62'__64 ~v0 ~v1 ~v2 v3 = du__'62''62'__64 v3
du__'62''62'__64 ::
  T_Raw'45'monad_24 -> () -> () -> AgdaAny -> AgdaAny -> AgdaAny
du__'62''62'__64 v0 v1 v2 v3 v4
  = coe du__'62''62'__38 (coe v0) v3 v4
-- Cubed.Effect.Monad._._>>=_
d__'62''62''61'__66 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  T_Raw'45'monad_24 ->
  () -> () -> AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
d__'62''62''61'__66 ~v0 ~v1 ~v2 v3 = du__'62''62''61'__66 v3
du__'62''62''61'__66 ::
  T_Raw'45'monad_24 ->
  () -> () -> AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
du__'62''62''61'__66 v0 v1 v2 = coe du__'62''62''61'__36 (coe v0)
-- Cubed.Effect.Monad._.bind
d_bind_68 ::
  T_Raw'45'monad_24 ->
  () -> () -> AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
d_bind_68 v0 = coe d_bind_34 (coe v0)
-- Cubed.Effect.Monad._.join
d_join_80 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) -> T_Raw'45'monad_24 -> () -> AgdaAny -> AgdaAny
d_join_80 ~v0 ~v1 v2 ~v3 v4 = du_join_80 v2 v4
du_join_80 :: T_Raw'45'monad_24 -> AgdaAny -> AgdaAny
du_join_80 v0 v1 = coe du__'62''62''61'__36 v0 v1 (\ v2 -> v2)
-- Cubed.Effect.Monad.Raw-monadTd
d_Raw'45'monadTd_94 a0 a1 a2 a3 a4 = ()
data T_Raw'45'monadTd_94
  = C_Raw'45'monadTd'46'constructor_5081 T_Raw'45'monad_24
                                         (() -> AgdaAny -> AgdaAny)
-- Cubed.Effect.Monad.Raw-monadTd.monad
d_monad_104 :: T_Raw'45'monadTd_94 -> T_Raw'45'monad_24
d_monad_104 v0
  = case coe v0 of
      C_Raw'45'monadTd'46'constructor_5081 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Monad.Raw-monadTd.liftM
d_liftM_106 :: T_Raw'45'monadTd_94 -> () -> AgdaAny -> AgdaAny
d_liftM_106 v0
  = case coe v0 of
      C_Raw'45'monadTd'46'constructor_5081 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Monad._.liftM
d_liftM_110 :: T_Raw'45'monadTd_94 -> () -> AgdaAny -> AgdaAny
d_liftM_110 v0 = coe d_liftM_106 (coe v0)
-- Cubed.Effect.Monad.Raw-monadT
d_Raw'45'monadT_112 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  ((() -> ()) -> () -> ()) -> ()
d_Raw'45'monadT_112 = erased
