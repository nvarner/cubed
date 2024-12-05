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

module MAlonzo.Code.Cubed.Effect.Semigroup where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive

-- Cubed.Effect.Semigroup.Raw-semigroup
d_Raw'45'semigroup_12 a0 a1 = ()
newtype T_Raw'45'semigroup_12
  = C_Raw'45'semigroup'46'constructor_33 (AgdaAny ->
                                          AgdaAny -> AgdaAny)
-- Cubed.Effect.Semigroup.Raw-semigroup._<>_
d__'60''62'__18 ::
  T_Raw'45'semigroup_12 -> AgdaAny -> AgdaAny -> AgdaAny
d__'60''62'__18 v0
  = case coe v0 of
      C_Raw'45'semigroup'46'constructor_33 v1 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Effect.Semigroup._._<>_
d__'60''62'__22 ::
  T_Raw'45'semigroup_12 -> AgdaAny -> AgdaAny -> AgdaAny
d__'60''62'__22 v0 = coe d__'60''62'__18 (coe v0)
