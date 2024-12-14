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

module MAlonzo.Code.Cubed.Data.Bool.Properties where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Cubed.Data.Dec.Base
import qualified MAlonzo.Code.Cubed.Data.Empty.Base

-- Cubed.Data.Bool.Properties.¬true≡false
d_'172'true'8801'false_8 ::
  AgdaAny -> MAlonzo.Code.Cubed.Data.Empty.Base.T_Empty_10
d_'172'true'8801'false_8 = erased
-- Cubed.Data.Bool.Properties.is-discrete
d_is'45'discrete_12 ::
  Bool -> Bool -> MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18
d_is'45'discrete_12 v0 v1
  = if coe v0
      then if coe v1
             then coe
                    MAlonzo.Code.Cubed.Data.Dec.Base.C_yes_22 (coe (\ v2 -> v1))
             else coe MAlonzo.Code.Cubed.Data.Dec.Base.C_no_24
      else (if coe v1
              then coe MAlonzo.Code.Cubed.Data.Dec.Base.C_no_24
              else coe
                     MAlonzo.Code.Cubed.Data.Dec.Base.C_yes_22 (coe (\ v2 -> v1)))
