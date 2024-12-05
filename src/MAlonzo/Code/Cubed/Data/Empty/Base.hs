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

module MAlonzo.Code.Cubed.Data.Empty.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive

-- Cubed.Data.Empty.Base.Empty
d_Empty_10 = ()
data T_Empty_10
-- Cubed.Data.Empty.Base.rec
d_rec_12 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Empty_10 -> AgdaAny
d_rec_12 ~v0 ~v1 ~v2 = du_rec_12
du_rec_12 :: AgdaAny
du_rec_12 = MAlonzo.RTE.mazUnreachableError
