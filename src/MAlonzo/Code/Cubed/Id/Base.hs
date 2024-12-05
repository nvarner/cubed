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

module MAlonzo.Code.Cubed.Id.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Agda.Primitive.Cubical
import qualified MAlonzo.Code.Cubed.Path.Base

-- Cubed.Id.Base.Id-sys
d_Id'45'sys_18 a0 a1 = ()
data T_Id'45'sys_18
  = C_Id'45'sys'46'constructor_487 (AgdaAny -> AgdaAny)
                                   (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny)
                                   (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny)
-- Cubed.Id.Base.Id-sys._≡ₛ_
d__'8801''8347'__46 :: T_Id'45'sys_18 -> AgdaAny -> AgdaAny -> ()
d__'8801''8347'__46 = erased
-- Cubed.Id.Base.Id-sys.reflₛ
d_refl'8347'_50 :: T_Id'45'sys_18 -> AgdaAny -> AgdaAny
d_refl'8347'_50 v0
  = case coe v0 of
      C_Id'45'sys'46'constructor_487 v2 v3 v4 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Id.Base.Id-sys.≡ₛ→≡
d_'8801''8347''8594''8801'_58 ::
  T_Id'45'sys_18 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
d_'8801''8347''8594''8801'_58 v0
  = case coe v0 of
      C_Id'45'sys'46'constructor_487 v2 v3 v4 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Id.Base.Id-sys.path-to-reflₛ
d_path'45'to'45'refl'8347'_68 ::
  T_Id'45'sys_18 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
d_path'45'to'45'refl'8347'_68 v0
  = case coe v0 of
      C_Id'45'sys'46'constructor_487 v2 v3 v4 -> coe v4
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Id.Base.Id-sys.≡→≡ₛ
d_'8801''8594''8801''8347'_76 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Id'45'sys_18 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d_'8801''8594''8801''8347'_76 v0 ~v1 v2 v3 ~v4
  = du_'8801''8594''8801''8347'_76 v0 v2 v3
du_'8801''8594''8801''8347'_76 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Id'45'sys_18 -> AgdaAny -> AgdaAny -> AgdaAny
du_'8801''8594''8801''8347'_76 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Cubed.Path.Base.du_J_256 (coe v0)
      (coe d_refl'8347'_50 v1 v2)
-- Cubed.Id.Base._._≡ₛ_
d__'8801''8347'__88 :: T_Id'45'sys_18 -> AgdaAny -> AgdaAny -> ()
d__'8801''8347'__88 = erased
-- Cubed.Id.Base._.path-to-reflₛ
d_path'45'to'45'refl'8347'_90 ::
  T_Id'45'sys_18 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
d_path'45'to'45'refl'8347'_90 v0
  = coe d_path'45'to'45'refl'8347'_68 (coe v0)
-- Cubed.Id.Base._.reflₛ
d_refl'8347'_92 :: T_Id'45'sys_18 -> AgdaAny -> AgdaAny
d_refl'8347'_92 v0 = coe d_refl'8347'_50 (coe v0)
-- Cubed.Id.Base._.≡ₛ→≡
d_'8801''8347''8594''8801'_94 ::
  T_Id'45'sys_18 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
d_'8801''8347''8594''8801'_94 v0
  = coe d_'8801''8347''8594''8801'_58 (coe v0)
-- Cubed.Id.Base._.≡→≡ₛ
d_'8801''8594''8801''8347'_96 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Id'45'sys_18 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d_'8801''8594''8801''8347'_96 v0 ~v1 v2
  = du_'8801''8594''8801''8347'_96 v0 v2
du_'8801''8594''8801''8347'_96 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Id'45'sys_18 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du_'8801''8594''8801''8347'_96 v0 v1 v2 v3
  = coe du_'8801''8594''8801''8347'_76 (coe v0) (coe v1) v2
-- Cubed.Id.Base.symₛ
d_sym'8347'_128 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Id'45'sys_18 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d_sym'8347'_128 v0 ~v1 v2 v3 v4 v5
  = du_sym'8347'_128 v0 v2 v3 v4 v5
du_sym'8347'_128 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Id'45'sys_18 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du_sym'8347'_128 v0 v1 v2 v3 v4
  = coe
      du_'8801''8594''8801''8347'_76 v0 v1 v3
      (coe
         MAlonzo.Code.Cubed.Path.Base.du_sym_142
         (coe d_'8801''8347''8594''8801'_58 v1 v2 v3 v4))
-- Cubed.Id.Base.congₛ
d_cong'8347'_140 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  T_Id'45'sys_18 ->
  T_Id'45'sys_18 ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d_cong'8347'_140 ~v0 ~v1 v2 ~v3 v4 v5 v6 v7 v8 v9
  = du_cong'8347'_140 v2 v4 v5 v6 v7 v8 v9
du_cong'8347'_140 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Id'45'sys_18 ->
  T_Id'45'sys_18 ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du_cong'8347'_140 v0 v1 v2 v3 v4 v5 v6
  = coe
      du_'8801''8594''8801''8347'_76 v0 v2 (coe v3 v4)
      (coe
         MAlonzo.Code.Cubed.Path.Base.du_cong_208 (coe (\ v7 -> v3))
         (coe d_'8801''8347''8594''8801'_58 v1 v4 v5 v6))
-- Cubed.Id.Base._∙ₛ_
d__'8729''8347'__152 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  T_Id'45'sys_18 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d__'8729''8347'__152 v0 ~v1 v2 v3 v4 v5 v6 v7
  = du__'8729''8347'__152 v0 v2 v3 v4 v5 v6 v7
du__'8729''8347'__152 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Id'45'sys_18 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du__'8729''8347'__152 v0 v1 v2 v3 v4 v5 v6
  = coe
      du_'8801''8594''8801''8347'_76 v0 v1 v2
      (coe
         MAlonzo.Code.Cubed.Path.Base.du__'8729'__180 (coe v0) (coe v2)
         (coe d_'8801''8347''8594''8801'_58 v1 v2 v3 v5)
         (coe d_'8801''8347''8594''8801'_58 v1 v3 v4 v6))
