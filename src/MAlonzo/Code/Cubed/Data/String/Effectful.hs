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

module MAlonzo.Code.Cubed.Data.String.Effectful where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Cubed.Data.String.Base
import qualified MAlonzo.Code.Cubed.Effect.Monoid
import qualified MAlonzo.Code.Cubed.Effect.Semigroup

-- Cubed.Data.String.Effectful.semigroup
d_semigroup_8 ::
  MAlonzo.Code.Cubed.Effect.Semigroup.T_Raw'45'semigroup_12
d_semigroup_8
  = coe
      MAlonzo.Code.Cubed.Effect.Semigroup.C_Raw'45'semigroup'46'constructor_33
      (coe MAlonzo.Code.Cubed.Data.String.Base.d__'43''43'__10)
-- Cubed.Data.String.Effectful.monoid
d_monoid_10 :: MAlonzo.Code.Cubed.Effect.Monoid.T_Raw'45'monoid_12
d_monoid_10
  = coe
      MAlonzo.Code.Cubed.Effect.Monoid.C_Raw'45'monoid'46'constructor_45
      (coe d_semigroup_8) (coe ("" :: Data.Text.Text))
