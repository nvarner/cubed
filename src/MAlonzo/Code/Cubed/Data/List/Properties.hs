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
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Agda.Primitive.Cubical
import qualified MAlonzo.Code.Cubed.Data.Dec.Base
import qualified MAlonzo.Code.Cubed.Data.Empty.Base
import qualified MAlonzo.Code.Cubed.Data.List.Base
import qualified MAlonzo.Code.Cubed.Id.Base
import qualified MAlonzo.Code.Cubed.Path.Base

-- Cubed.Data.List.Properties.id-sys
d_id'45'sys_14 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Id.Base.T_Id'45'sys_18
d_id'45'sys_14 v0 ~v1 = du_id'45'sys_14 v0
du_id'45'sys_14 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Id.Base.T_Id'45'sys_18
du_id'45'sys_14 v0
  = coe
      MAlonzo.Code.Cubed.Id.Base.C_Id'45'sys'46'constructor_487
      (\ v1 -> coe MAlonzo.Code.Cubed.Data.List.Base.du_refl_76 (coe v1))
      (\ v1 v2 ->
         coe
           MAlonzo.Code.Cubed.Data.List.Base.du_'8801''8594'Path_86 (coe v1)
           (coe v2))
      (\ v1 v2 ->
         coe
           MAlonzo.Code.Cubed.Data.List.Base.du_path'45'to'45'refl_112
           (coe v0) (coe v1) (coe v2))
-- Cubed.Data.List.Properties.++-id-rₛ
d_'43''43''45'id'45'r'8347'_18 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> AgdaAny
d_'43''43''45'id'45'r'8347'_18 ~v0 ~v1 v2
  = du_'43''43''45'id'45'r'8347'_18 v2
du_'43''43''45'id'45'r'8347'_18 :: [AgdaAny] -> AgdaAny
du_'43''43''45'id'45'r'8347'_18 v0
  = case coe v0 of
      [] -> coe MAlonzo.Code.Cubed.Data.List.Base.du_refl_76 (coe v0)
      (:) v1 v2
        -> coe
             MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe (\ v3 -> v1))
             (coe du_'43''43''45'id'45'r'8347'_18 (coe v2))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Properties.++-id-r
d_'43''43''45'id'45'r_28 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  [AgdaAny] -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> [AgdaAny]
d_'43''43''45'id'45'r_28 ~v0 ~v1 v2 = du_'43''43''45'id'45'r_28 v2
du_'43''43''45'id'45'r_28 ::
  [AgdaAny] -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> [AgdaAny]
du_'43''43''45'id'45'r_28 v0
  = coe
      MAlonzo.Code.Cubed.Data.List.Base.du_'8801''8594'Path_86
      (coe
         MAlonzo.Code.Cubed.Data.List.Base.du__'43''43'__130 (coe v0)
         (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16))
      (coe v0) (coe du_'43''43''45'id'45'r'8347'_18 (coe v0))
-- Cubed.Data.List.Properties.++-assoc
d_'43''43''45'assoc_38 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  [AgdaAny] ->
  [AgdaAny] ->
  [AgdaAny] -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> [AgdaAny]
d_'43''43''45'assoc_38 ~v0 ~v1 v2 v3 v4
  = du_'43''43''45'assoc_38 v2 v3 v4
du_'43''43''45'assoc_38 ::
  [AgdaAny] ->
  [AgdaAny] ->
  [AgdaAny] -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> [AgdaAny]
du_'43''43''45'assoc_38 v0 v1 v2
  = case coe v0 of
      []
        -> let v3
                 = coe
                     MAlonzo.Code.Cubed.Data.List.Base.du__'43''43'__130 (coe v0)
                     (coe
                        MAlonzo.Code.Cubed.Data.List.Base.du__'43''43'__130 (coe v1)
                        (coe v2)) in
           coe (coe (\ v4 -> v3))
      (:) v3 v4
        -> coe
             MAlonzo.Code.Cubed.Path.Base.du_cong_208
             (coe
                (\ v5 ->
                   coe MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v3)))
             (coe du_'43''43''45'assoc_38 (coe v4) (coe v1) (coe v2))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Properties.elt-dec
d_elt'45'dec_58 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny ->
   AgdaAny -> MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  AgdaAny -> [AgdaAny] -> MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18
d_elt'45'dec_58 v0 ~v1 v2 v3 v4 = du_elt'45'dec_58 v0 v2 v3 v4
du_elt'45'dec_58 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (AgdaAny ->
   AgdaAny -> MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  AgdaAny -> [AgdaAny] -> MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18
du_elt'45'dec_58 v0 v1 v2 v3
  = case coe v3 of
      [] -> coe MAlonzo.Code.Cubed.Data.Dec.Base.C_no_24
      (:) v4 v5
        -> coe
             MAlonzo.Code.Cubed.Data.Dec.Base.du_rec_46
             (\ v6 ->
                coe
                  MAlonzo.Code.Cubed.Path.Base.du_J_256 (coe v0)
                  (coe
                     MAlonzo.Code.Cubed.Data.Dec.Base.C_yes_22
                     (coe
                        MAlonzo.Code.Cubed.Data.List.Base.C_here_318 (coe v4) (coe v5))))
             (coe
                (\ v6 ->
                   coe
                     MAlonzo.Code.Cubed.Data.Dec.Base.du_map_60
                     (coe
                        MAlonzo.Code.Cubed.Data.List.Base.C_there_326 (coe v4) (coe v2)
                        (coe v5))
                     (coe du_elt'45'dec_58 (coe v0) (coe v1) (coe v2) (coe v5))))
             (coe
                MAlonzo.Code.Cubed.Data.Dec.Base.du__'8799'__78 (coe v4) (coe v2)
                (coe v1))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Properties..extendedlambda0
d_'46'extendedlambda0_74 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny ->
   AgdaAny -> MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  AgdaAny ->
  AgdaAny ->
  [AgdaAny] ->
  (AgdaAny -> MAlonzo.Code.Cubed.Data.Empty.Base.T_Empty_10) ->
  (MAlonzo.Code.Cubed.Data.List.Base.T_Elt_310 ->
   MAlonzo.Code.Cubed.Data.Empty.Base.T_Empty_10) ->
  MAlonzo.Code.Cubed.Data.List.Base.T_Elt_310 ->
  MAlonzo.Code.Cubed.Data.Empty.Base.T_Empty_10
d_'46'extendedlambda0_74 = erased
