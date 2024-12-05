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

module MAlonzo.Code.Cubed.Data.Nat.Properties where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive.Cubical
import qualified MAlonzo.Code.Cubed.Data.Empty.Base
import qualified MAlonzo.Code.Cubed.Data.Nat.Base
import qualified MAlonzo.Code.Cubed.Id.Base
import qualified MAlonzo.Code.Cubed.Path.Base

-- Cubed.Data.Nat.Properties.id-sys
d_id'45'sys_10 :: MAlonzo.Code.Cubed.Id.Base.T_Id'45'sys_18
d_id'45'sys_10
  = coe
      MAlonzo.Code.Cubed.Id.Base.C_Id'45'sys'46'constructor_487
      MAlonzo.Code.Cubed.Data.Nat.Base.d_refl''_72
      (\ v0 v1 v2 -> coe du_'8801''''8594''8801'_20 v0 v2)
      d_path'45'to'45'refl''_38
-- Cubed.Data.Nat.Properties._.≡'→≡
d_'8801''''8594''8801'_20 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Cubed.Data.Nat.Base.T__'8801'''__54 ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> Integer
d_'8801''''8594''8801'_20 v0 ~v1 v2
  = du_'8801''''8594''8801'_20 v0 v2
du_'8801''''8594''8801'_20 ::
  Integer ->
  MAlonzo.Code.Cubed.Data.Nat.Base.T__'8801'''__54 ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> Integer
du_'8801''''8594''8801'_20 v0 v1
  = case coe v0 of
      0 -> let v2 = 0 :: Integer in coe (coe (\ v3 -> v2))
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (case coe v1 of
                MAlonzo.Code.Cubed.Data.Nat.Base.C_s'8801'''s_58 v3 v4 v5
                  -> coe
                       MAlonzo.Code.Cubed.Path.Base.du_cong_208
                       (coe (\ v6 v7 -> addInt (coe (1 :: Integer)) (coe v7)))
                       (coe du_'8801''''8594''8801'_20 (coe v2) (coe v5))
                _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Data.Nat.Properties._.path-to-refl'
d_path'45'to'45'refl''_38 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Cubed.Data.Nat.Base.T__'8801'''__54 ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
  MAlonzo.Code.Cubed.Data.Nat.Base.T__'8801'''__54
d_path'45'to'45'refl''_38 v0 v1 v2
  = case coe v0 of
      0 -> coe
             seq (coe v2)
             (coe
                (\ v3 -> coe MAlonzo.Code.Cubed.Data.Nat.Base.C_z'8801'''z_56))
      _ -> let v3 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (let v4 = subInt (coe v1) (coe (1 :: Integer)) in
              coe
                (case coe v2 of
                   MAlonzo.Code.Cubed.Data.Nat.Base.C_s'8801'''s_58 v5 v6 v7
                     -> coe
                          MAlonzo.Code.Cubed.Path.Base.du_cong_208
                          (coe
                             (\ v8 ->
                                coe
                                  MAlonzo.Code.Cubed.Data.Nat.Base.C_s'8801'''s_58
                                  (coe du_'8801''''8594''8801'_20 v3 v7 v8) (coe v4)))
                          (coe d_path'45'to'45'refl''_38 (coe v3) (coe v4) (coe v7))
                   _ -> MAlonzo.RTE.mazUnreachableError))
-- Cubed.Data.Nat.Properties.znotsₛ
d_znots'8347'_46 ::
  Integer ->
  MAlonzo.Code.Cubed.Data.Nat.Base.T__'8801'''__54 ->
  MAlonzo.Code.Cubed.Data.Empty.Base.T_Empty_10
d_znots'8347'_46 = erased
-- Cubed.Data.Nat.Properties.znots
d_znots_48 ::
  Integer -> AgdaAny -> MAlonzo.Code.Cubed.Data.Empty.Base.T_Empty_10
d_znots_48 = erased
-- Cubed.Data.Nat.Properties.+-id-lₛ
d_'43''45'id'45'l'8347'_54 ::
  Integer -> MAlonzo.Code.Cubed.Data.Nat.Base.T__'8801'''__54
d_'43''45'id'45'l'8347'_54 v0
  = coe MAlonzo.Code.Cubed.Data.Nat.Base.d_refl''_72 (coe v0)
-- Cubed.Data.Nat.Properties.+-id-l
d_'43''45'id'45'l_60 ::
  Integer -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> Integer
d_'43''45'id'45'l_60 v0 ~v1 = du_'43''45'id'45'l_60 v0
du_'43''45'id'45'l_60 :: Integer -> Integer
du_'43''45'id'45'l_60 v0 = coe v0
-- Cubed.Data.Nat.Properties.+-id-rₛ
d_'43''45'id'45'r'8347'_66 ::
  Integer -> MAlonzo.Code.Cubed.Data.Nat.Base.T__'8801'''__54
d_'43''45'id'45'r'8347'_66
  = coe
      MAlonzo.Code.Cubed.Data.Nat.Base.du_elim_24
      (coe
         MAlonzo.Code.Cubed.Data.Nat.Base.d_refl''_72 (coe (0 :: Integer)))
      (coe
         (\ v0 ->
            coe
              MAlonzo.Code.Cubed.Data.Nat.Base.C_s'8801'''s_58 (coe v0)
              (coe v0)))
-- Cubed.Data.Nat.Properties.+-id-r
d_'43''45'id'45'r_72 ::
  Integer -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> Integer
d_'43''45'id'45'r_72
  = coe
      MAlonzo.Code.Cubed.Data.Nat.Base.du_elim_24
      (let v0 = 0 :: Integer in coe (coe (\ v1 -> v0)))
      (coe
         (\ v0 ->
            coe
              MAlonzo.Code.Cubed.Path.Base.du_cong_208
              (coe (\ v1 v2 -> addInt (coe (1 :: Integer)) (coe v2)))))
-- Cubed.Data.Nat.Properties.+-assocₛ
d_'43''45'assoc'8347'_82 ::
  Integer ->
  Integer ->
  Integer -> MAlonzo.Code.Cubed.Data.Nat.Base.T__'8801'''__54
d_'43''45'assoc'8347'_82
  = coe
      MAlonzo.Code.Cubed.Data.Nat.Base.du_elim_24
      (coe
         (\ v0 v1 ->
            MAlonzo.Code.Cubed.Data.Nat.Base.d_refl''_72
              (coe addInt (coe v0) (coe v1))))
      (coe
         (\ v0 v1 v2 v3 ->
            coe
              MAlonzo.Code.Cubed.Data.Nat.Base.C_s'8801'''s_58
              (coe addInt (coe addInt (coe v0) (coe v2)) (coe v3))
              (coe addInt (coe addInt (coe v0) (coe v2)) (coe v3))
              (coe v1 v2 v3)))
-- Cubed.Data.Nat.Properties.+-assoc
d_'43''45'assoc_102 ::
  Integer ->
  Integer ->
  Integer -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> Integer
d_'43''45'assoc_102
  = coe
      MAlonzo.Code.Cubed.Data.Nat.Base.du_elim_24
      (coe
         (\ v0 v1 -> let v2 = addInt (coe v0) (coe v1) in coe (\ v3 -> v2)))
      (coe
         (\ v0 v1 v2 v3 ->
            coe
              MAlonzo.Code.Cubed.Path.Base.du_cong_208
              (coe (\ v4 v5 -> addInt (coe (1 :: Integer)) (coe v5)))
              (coe v1 v2 v3)))
-- Cubed.Data.Nat.Properties.+-sucₛ
d_'43''45'suc'8347'_120 ::
  Integer ->
  Integer -> MAlonzo.Code.Cubed.Data.Nat.Base.T__'8801'''__54
d_'43''45'suc'8347'_120
  = coe
      MAlonzo.Code.Cubed.Data.Nat.Base.du_elim_24
      (coe
         (\ v0 ->
            MAlonzo.Code.Cubed.Data.Nat.Base.d_refl''_72
              (coe addInt (coe (1 :: Integer)) (coe v0))))
      (coe
         (\ v0 v1 v2 ->
            coe
              MAlonzo.Code.Cubed.Data.Nat.Base.C_s'8801'''s_58
              (coe addInt (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v2))
              (coe addInt (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v2))
              (coe v1 v2)))
-- Cubed.Data.Nat.Properties.+-suc
d_'43''45'suc_134 ::
  Integer ->
  Integer -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> Integer
d_'43''45'suc_134
  = coe
      MAlonzo.Code.Cubed.Data.Nat.Base.du_elim_24
      (coe
         (\ v0 ->
            let v1 = addInt (coe (1 :: Integer)) (coe v0) in coe (\ v2 -> v1)))
      (coe
         (\ v0 v1 v2 ->
            coe
              MAlonzo.Code.Cubed.Path.Base.du_cong_208
              (coe (\ v3 v4 -> addInt (coe (1 :: Integer)) (coe v4)))
              (coe v1 v2)))
-- Cubed.Data.Nat.Properties.+-commₛ
d_'43''45'comm'8347'_148 ::
  Integer ->
  Integer -> MAlonzo.Code.Cubed.Data.Nat.Base.T__'8801'''__54
d_'43''45'comm'8347'_148 v0
  = coe
      MAlonzo.Code.Cubed.Data.Nat.Base.du_elim_24
      (coe d_'43''45'id'45'r'8347'_66 v0)
      (coe
         (\ v1 v2 ->
            coe
              MAlonzo.Code.Cubed.Id.Base.du__'8729''8347'__152 (coe ())
              (coe d_id'45'sys_10)
              (coe addInt (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v1))
              (coe addInt (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v1))
              (coe addInt (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v1))
              (coe d_'43''45'suc'8347'_120 v0 v1)
              (coe
                 MAlonzo.Code.Cubed.Data.Nat.Base.C_s'8801'''s_58
                 (coe addInt (coe v0) (coe v1)) (coe addInt (coe v0) (coe v1))
                 (coe v2))))
-- Cubed.Data.Nat.Properties.+-comm
d_'43''45'comm_160 ::
  Integer ->
  Integer -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> Integer
d_'43''45'comm_160 v0
  = coe
      MAlonzo.Code.Cubed.Data.Nat.Base.du_elim_24
      (coe d_'43''45'id'45'r_72 v0)
      (coe
         (\ v1 v2 ->
            coe
              MAlonzo.Code.Cubed.Path.Base.du__'8729'__180 (coe ())
              (coe addInt (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v1))
              (coe d_'43''45'suc_134 v0 v1)
              (coe
                 MAlonzo.Code.Cubed.Path.Base.du_cong_208
                 (coe (\ v3 v4 -> addInt (coe (1 :: Integer)) (coe v4))) (coe v2))))
