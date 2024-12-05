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

module MAlonzo.Code.Cubed.Data.Nat.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Data.Dec.Base

-- Cubed.Data.Nat.Base.elim
d_elim_24 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (Integer -> ()) ->
  AgdaAny -> (Integer -> AgdaAny -> AgdaAny) -> Integer -> AgdaAny
d_elim_24 ~v0 ~v1 v2 v3 v4 = du_elim_24 v2 v3 v4
du_elim_24 ::
  AgdaAny -> (Integer -> AgdaAny -> AgdaAny) -> Integer -> AgdaAny
du_elim_24 v0 v1 v2
  = case coe v2 of
      0 -> coe v0
      _ -> let v3 = subInt (coe v2) (coe (1 :: Integer)) in
           coe (coe v1 v3 (coe du_elim_24 (coe v0) (coe v1) (coe v3)))
-- Cubed.Data.Nat.Base.rec
d_rec_38 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  AgdaAny -> (Integer -> AgdaAny -> AgdaAny) -> Integer -> AgdaAny
d_rec_38 ~v0 ~v1 = du_rec_38
du_rec_38 ::
  AgdaAny -> (Integer -> AgdaAny -> AgdaAny) -> Integer -> AgdaAny
du_rec_38 = coe du_elim_24
-- Cubed.Data.Nat.Base.case
d_case_40 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> AgdaAny -> AgdaAny -> Integer -> AgdaAny
d_case_40 ~v0 ~v1 v2 v3 v4 = du_case_40 v2 v3 v4
du_case_40 :: AgdaAny -> AgdaAny -> Integer -> AgdaAny
du_case_40 v0 v1 v2
  = case coe v2 of
      0 -> coe v0
      _ -> coe v1
-- Cubed.Data.Nat.Base.is-zeroᵇ
d_is'45'zero'7495'_52 :: Integer -> Bool
d_is'45'zero'7495'_52
  = coe
      du_case_40 (coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10)
      (coe MAlonzo.Code.Agda.Builtin.Bool.C_false_8)
-- Cubed.Data.Nat.Base._≡'_
d__'8801'''__54 a0 a1 = ()
data T__'8801'''__54
  = C_z'8801'''z_56 | C_s'8801'''s_58 Integer Integer T__'8801'''__54
-- Cubed.Data.Nat.Base.inst-s≡'s
d_inst'45's'8801'''s_60 ::
  Integer -> Integer -> T__'8801'''__54 -> T__'8801'''__54
d_inst'45's'8801'''s_60 v0 v1 v2
  = coe C_s'8801'''s_58 (coe v0) (coe v1) (coe v2)
-- Cubed.Data.Nat.Base.≡ᵇ→≡'
d_'8801''7495''8594''8801'''_62 ::
  Integer -> Integer -> AgdaAny -> T__'8801'''__54
d_'8801''7495''8594''8801'''_62 v0 v1 ~v2
  = du_'8801''7495''8594''8801'''_62 v0 v1
du_'8801''7495''8594''8801'''_62 ::
  Integer -> Integer -> T__'8801'''__54
du_'8801''7495''8594''8801'''_62 v0 v1
  = case coe v0 of
      0 -> coe C_z'8801'''z_56
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (let v3 = subInt (coe v1) (coe (1 :: Integer)) in
              coe
                (coe
                   C_s'8801'''s_58 (coe v2) (coe v3)
                   (coe du_'8801''7495''8594''8801'''_62 (coe v2) (coe v3))))
-- Cubed.Data.Nat.Base.refl'
d_refl''_72 :: Integer -> T__'8801'''__54
d_refl''_72 v0
  = case coe v0 of
      0 -> coe C_z'8801'''z_56
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (coe C_s'8801'''s_58 (coe v1) (coe v1) (coe d_refl''_72 (coe v1)))
-- Cubed.Data.Nat.Base._≤ᵇ_
d__'8804''7495'__76 :: Integer -> Integer -> Bool
d__'8804''7495'__76 v0 v1
  = case coe v0 of
      0 -> coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe (coe ltInt (coe v2) (coe v1))
-- Cubed.Data.Nat.Base._≤_
d__'8804'__84 a0 a1 = ()
data T__'8804'__84
  = C_z'8804'_86 Integer |
    C_s'8804's_88 Integer Integer T__'8804'__84
-- Cubed.Data.Nat.Base.s≤s⁻¹
d_s'8804's'8315''185'_90 ::
  Integer -> Integer -> T__'8804'__84 -> T__'8804'__84
d_s'8804's'8315''185'_90 ~v0 ~v1 v2 = du_s'8804's'8315''185'_90 v2
du_s'8804's'8315''185'_90 :: T__'8804'__84 -> T__'8804'__84
du_s'8804's'8315''185'_90 v0
  = case coe v0 of
      C_s'8804's_88 v1 v2 v3 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Nat.Base._≤?_
d__'8804''63'__98 ::
  Integer -> Integer -> MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18
d__'8804''63'__98 v0 v1
  = case coe v0 of
      0 -> coe
             MAlonzo.Code.Cubed.Data.Dec.Base.C_yes_22
             (coe C_z'8804'_86 (coe v1))
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (case coe v1 of
                0 -> coe MAlonzo.Code.Cubed.Data.Dec.Base.C_no_24
                _ -> let v3 = subInt (coe v1) (coe (1 :: Integer)) in
                     coe
                       (coe
                          MAlonzo.Code.Cubed.Data.Dec.Base.du_map_60
                          (coe C_s'8804's_88 (coe v2) (coe v3))
                          (coe d__'8804''63'__98 (coe v2) (coe v3))))
-- Cubed.Data.Nat.Base._<_
d__'60'__112 a0 a1 = ()
data T__'60'__112
  = C_z'60's_114 Integer | C_suc_116 Integer Integer T__'60'__112
-- Cubed.Data.Nat.Base.inst-z<s
d_inst'45'z'60's_118 :: Integer -> T__'60'__112
d_inst'45'z'60's_118 v0 = coe C_z'60's_114 (coe v0)
-- Cubed.Data.Nat.Base.inst-<-suc
d_inst'45''60''45'suc_120 ::
  Integer -> Integer -> T__'60'__112 -> T__'60'__112
d_inst'45''60''45'suc_120 v0 v1 v2
  = coe C_suc_116 (coe v0) (coe v1) (coe v2)
-- Cubed.Data.Nat.Base._>_
d__'62'__124 :: Integer -> Integer -> ()
d__'62'__124 = erased
-- Cubed.Data.Nat.Base.max
d_max_130 :: Integer -> Integer -> Integer
d_max_130 v0 v1
  = case coe v0 of
      0 -> coe v1
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (case coe v1 of
                0 -> coe v0
                _ -> let v3 = subInt (coe v1) (coe (1 :: Integer)) in
                     coe
                       (coe
                          addInt (coe (1 :: Integer)) (coe d_max_130 (coe v2) (coe v3))))
-- Cubed.Data.Nat.Base.safe-pred
d_safe'45'pred_140 :: Integer -> Integer
d_safe'45'pred_140 v0
  = case coe v0 of
      0 -> coe (0 :: Integer)
      _ -> coe subInt (coe v0) (coe (1 :: Integer))
-- Cubed.Data.Nat.Base.Is-zero
d_Is'45'zero_144 a0 = ()
data T_Is'45'zero_144 = C_zero_146
