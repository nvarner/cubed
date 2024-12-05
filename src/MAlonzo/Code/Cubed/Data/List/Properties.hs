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

module MAlonzo.Code.Cubed.Data.List.Properties where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Agda.Primitive.Cubical
import qualified MAlonzo.Code.Cubed.Data.List.Base
import qualified MAlonzo.Code.Cubed.Id.Base
import qualified MAlonzo.Code.Cubed.Level
import qualified MAlonzo.Code.Cubed.Path.Id

-- Cubed.Data.List.Properties._.id-sys
d_id'45'sys_18 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Id.Base.T_Id'45'sys_86 ->
  MAlonzo.Code.Cubed.Id.Base.T_Id'45'sys_86
d_id'45'sys_18 ~v0 ~v1 v2 = du_id'45'sys_18 v2
du_id'45'sys_18 ::
  MAlonzo.Code.Cubed.Id.Base.T_Id'45'sys_86 ->
  MAlonzo.Code.Cubed.Id.Base.T_Id'45'sys_86
du_id'45'sys_18 v0
  = coe
      MAlonzo.Code.Cubed.Id.Base.C_Id'45'sys'46'constructor_1485
      (\ v1 ->
         coe MAlonzo.Code.Cubed.Data.List.Base.du_refl_64 (coe v0) (coe v1))
      (coe
         MAlonzo.Code.Cubed.Id.Base.C_Is'45'id'45'sys'46'constructor_457
         (coe
            MAlonzo.Code.Cubed.Data.List.Base.du_elim_22
            (coe
               (\ v1 v2 ->
                  seq
                    (coe v1)
                    (coe (\ v3 -> coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16))))
            (coe
               (\ v1 v2 v3 v4 v5 v6 ->
                  case coe v4 of
                    (:) v7 v8
                      -> case coe v5 of
                           MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v9 v10
                             -> coe
                                  MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                                  (coe MAlonzo.Code.Cubed.Id.Base.du_ext_158 v0 v1 v7 v9 v6)
                                  (coe v3 v8 v10 v6)
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError)))
         (coe
            MAlonzo.Code.Cubed.Data.List.Base.du_elim_22
            (coe
               (\ v1 v2 ->
                  seq
                    (coe v1)
                    (coe
                       (\ v3 ->
                          coe
                            MAlonzo.Code.Cubed.Level.C_lift_32
                            (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))))
            (\ v1 v2 v3 v4 v5 v6 ->
               coe du_'46'extendedlambda3_46 (coe v0) v1 v3 v4 v5 v6)))
-- Cubed.Data.List.Properties._..extendedlambda3
d_'46'extendedlambda3_46 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Id.Base.T_Id'45'sys_86 ->
  AgdaAny ->
  [AgdaAny] ->
  ([AgdaAny] -> AgdaAny -> AgdaAny) ->
  [AgdaAny] ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
d_'46'extendedlambda3_46 ~v0 ~v1 v2 v3 ~v4 v5 v6 v7 v8
  = du_'46'extendedlambda3_46 v2 v3 v5 v6 v7 v8
du_'46'extendedlambda3_46 ::
  MAlonzo.Code.Cubed.Id.Base.T_Id'45'sys_86 ->
  AgdaAny ->
  ([AgdaAny] -> AgdaAny -> AgdaAny) ->
  [AgdaAny] ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
du_'46'extendedlambda3_46 v0 v1 v2 v3 v4 v5
  = case coe v3 of
      (:) v6 v7
        -> case coe v4 of
             MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v8 v9
               -> coe
                    MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                    (coe
                       MAlonzo.Code.Cubed.Id.Base.d_path'45'to'45'refl'8347'_64
                       (MAlonzo.Code.Cubed.Id.Base.d_is'45'id'45'sys_104 (coe v0)) v1 v6
                       v8 v5)
                    (coe v2 v7 v9 v5)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Properties._.++-id-rₛ
d_'43''43''45'id'45'r'8347'_66 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Id.Base.T_Id'45'sys_86 -> [AgdaAny] -> AgdaAny
d_'43''43''45'id'45'r'8347'_66 ~v0 ~v1 v2 v3
  = du_'43''43''45'id'45'r'8347'_66 v2 v3
du_'43''43''45'id'45'r'8347'_66 ::
  MAlonzo.Code.Cubed.Id.Base.T_Id'45'sys_86 -> [AgdaAny] -> AgdaAny
du_'43''43''45'id'45'r'8347'_66 v0 v1
  = case coe v1 of
      []
        -> coe
             MAlonzo.Code.Cubed.Level.C_lift_32
             (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
      (:) v2 v3
        -> coe
             MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
             (coe MAlonzo.Code.Cubed.Id.Base.d_refl'8347'_102 v0 v2)
             (coe du_'43''43''45'id'45'r'8347'_66 (coe v0) (coe v3))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Properties.++-id-r
d_'43''43''45'id'45'r_74 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  [AgdaAny] -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> [AgdaAny]
d_'43''43''45'id'45'r_74 v0 ~v1 v2
  = du_'43''43''45'id'45'r_74 v0 v2
du_'43''43''45'id'45'r_74 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  [AgdaAny] -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> [AgdaAny]
du_'43''43''45'id'45'r_74 v0 v1
  = coe
      MAlonzo.Code.Cubed.Id.Base.du_ext_158
      (coe
         du_id'45'sys_18
         (coe MAlonzo.Code.Cubed.Path.Id.du_id'45'sys_8 (coe v0)))
      (coe
         MAlonzo.Code.Cubed.Data.List.Base.du__'43''43'__70 (coe v1)
         (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16))
      v1
      (coe
         du_'43''43''45'id'45'r'8347'_66
         (coe MAlonzo.Code.Cubed.Path.Id.du_id'45'sys_8 (coe v0)) (coe v1))
