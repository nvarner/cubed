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

module MAlonzo.Code.Cubed.Path.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Cubical.Sub
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Agda.Primitive.Cubical

-- Cubed.Path.Base.Path
d_Path_30 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> AgdaAny -> AgdaAny -> ()
d_Path_30 = erased
-- Cubed.Path.Base._≡_
d__'8801'__44 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> AgdaAny -> AgdaAny -> ()
d__'8801'__44 = erased
-- Cubed.Path.Base._[_↦_]
d__'91'_'8614'_'93'_56 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
  (AgdaAny -> AgdaAny) -> ()
d__'91'_'8614'_'93'_56 = erased
-- Cubed.Path.Base.hfill
d_hfill_80 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
  (MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
   AgdaAny -> AgdaAny) ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
d_hfill_80 v0 ~v1 v2 v3 v4 v5 = du_hfill_80 v0 v2 v3 v4 v5
du_hfill_80 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
  (MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
   AgdaAny -> AgdaAny) ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
du_hfill_80 v0 v1 v2 v3 v4
  = coe
      MAlonzo.Code.Agda.Primitive.Cubical.d_primHComp_104 v0 erased
      (coe
         MAlonzo.Code.Agda.Primitive.Cubical.d_primIMax_16 v1
         (coe MAlonzo.Code.Agda.Primitive.Cubical.d_primINeg_18 v4))
      (\ v5 ->
         let v6
               = case coe v4 of
                   MAlonzo.Code.Agda.Primitive.Cubical.C_i0_10
                     -> coe
                          (\ v6 ->
                             coe
                               MAlonzo.Code.Agda.Builtin.Cubical.Sub.d_primSubOut_30 v0 erased v1
                               (coe v2 v4) v3)
                   _ -> erased in
         coe
           (case coe v1 of
              MAlonzo.Code.Agda.Primitive.Cubical.C_i1_12
                -> coe
                     (\ v7 ->
                        coe
                          v2 (coe MAlonzo.Code.Agda.Primitive.Cubical.d_primIMin_14 v4 v5)
                          erased)
              _ -> coe v6))
      (coe
         MAlonzo.Code.Agda.Builtin.Cubical.Sub.d_primSubOut_30 v0 erased v1
         (coe v2 (coe MAlonzo.Code.Agda.Primitive.Cubical.C_i0_10)) v3)
-- Cubed.Path.Base.fill
d_fill_110 ::
  (MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
   MAlonzo.Code.Agda.Primitive.T_Level_18) ->
  (MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> ()) ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
  (MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
   AgdaAny -> AgdaAny) ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
d_fill_110 v0 ~v1 v2 v3 v4 v5 = du_fill_110 v0 v2 v3 v4 v5
du_fill_110 ::
  (MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
   MAlonzo.Code.Agda.Primitive.T_Level_18) ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
  (MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
   AgdaAny -> AgdaAny) ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
du_fill_110 v0 v1 v2 v3 v4
  = coe
      MAlonzo.Code.Agda.Primitive.Cubical.d_primComp_78
      (\ v5 ->
         coe
           v0 (coe MAlonzo.Code.Agda.Primitive.Cubical.d_primIMin_14 v4 v5))
      erased
      (coe
         MAlonzo.Code.Agda.Primitive.Cubical.d_primIMax_16 v1
         (coe MAlonzo.Code.Agda.Primitive.Cubical.d_primINeg_18 v4))
      (\ v5 ->
         let v6
               = case coe v4 of
                   MAlonzo.Code.Agda.Primitive.Cubical.C_i0_10
                     -> coe
                          (\ v6 ->
                             coe
                               MAlonzo.Code.Agda.Builtin.Cubical.Sub.d_primSubOut_30 (coe v0 v4)
                               erased v1 (coe v2 v4) v3)
                   _ -> erased in
         coe
           (case coe v1 of
              MAlonzo.Code.Agda.Primitive.Cubical.C_i1_12
                -> coe
                     (\ v7 ->
                        coe
                          v2 (coe MAlonzo.Code.Agda.Primitive.Cubical.d_primIMin_14 v4 v5)
                          erased)
              _ -> coe v6))
      (coe
         MAlonzo.Code.Agda.Builtin.Cubical.Sub.d_primSubOut_30
         (coe v0 (coe MAlonzo.Code.Agda.Primitive.Cubical.C_i0_10)) erased
         v1 (coe v2 (coe MAlonzo.Code.Agda.Primitive.Cubical.C_i0_10)) v3)
-- Cubed.Path.Base.refl
d_refl_128 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
d_refl_128 ~v0 ~v1 v2 ~v3 = du_refl_128 v2
du_refl_128 :: AgdaAny -> AgdaAny
du_refl_128 v0 = coe v0
-- Cubed.Path.Base.sym
d_sym_142 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> ()) ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
d_sym_142 ~v0 ~v1 ~v2 ~v3 v4 v5 = du_sym_142 v4 v5
du_sym_142 ::
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
du_sym_142 v0 v1
  = coe v0 (coe MAlonzo.Code.Agda.Primitive.Cubical.d_primINeg_18 v1)
-- Cubed.Path.Base._.faces
d_faces_166 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny -> AgdaAny
d_faces_166 ~v0 ~v1 v2 ~v3 ~v4 v5 v6 = du_faces_166 v2 v5 v6
du_faces_166 ::
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny -> AgdaAny
du_faces_166 v0 v1 v2
  = case coe v2 of
      MAlonzo.Code.Agda.Primitive.Cubical.C_i0_10 -> coe (\ v3 v4 -> v0)
      MAlonzo.Code.Agda.Primitive.Cubical.C_i1_12
        -> coe (\ v3 v4 -> coe v1 v3)
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Path.Base._._∙_
d__'8729'__180 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
d__'8729'__180 v0 ~v1 v2 ~v3 ~v4 v5 v6 v7
  = du__'8729'__180 v0 v2 v5 v6 v7
du__'8729'__180 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
du__'8729'__180 v0 v1 v2 v3 v4
  = coe
      MAlonzo.Code.Agda.Primitive.Cubical.d_primHComp_104 v0 erased
      (coe
         MAlonzo.Code.Agda.Primitive.Cubical.d_primIMax_16 v4
         (coe MAlonzo.Code.Agda.Primitive.Cubical.d_primINeg_18 v4))
      (coe du_faces_166 (coe v1) (coe v3) (coe v4)) (coe v2 v4)
-- Cubed.Path.Base.cong
d_cong_208 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> ()) ->
  (MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny -> ()) ->
  (MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
   AgdaAny -> AgdaAny) ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
d_cong_208 ~v0 ~v1 ~v2 ~v3 v4 ~v5 ~v6 v7 v8 = du_cong_208 v4 v7 v8
du_cong_208 ::
  (MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
   AgdaAny -> AgdaAny) ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
du_cong_208 v0 v1 v2 = coe v0 v2 (coe v1 v2)
-- Cubed.Path.Base.transport
d_transport_220 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> () -> AgdaAny -> AgdaAny -> AgdaAny
d_transport_220 v0 ~v1 ~v2 ~v3 = du_transport_220 v0
du_transport_220 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> AgdaAny -> AgdaAny
du_transport_220 v0
  = coe
      MAlonzo.Code.Agda.Primitive.Cubical.d_primTransp_90 (\ v1 -> v0)
      erased (coe MAlonzo.Code.Agda.Primitive.Cubical.C_i0_10)
-- Cubed.Path.Base.subst
d_subst_234 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (AgdaAny -> ()) ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d_subst_234 ~v0 ~v1 v2 ~v3 ~v4 ~v5 ~v6 = du_subst_234 v2
du_subst_234 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> AgdaAny -> AgdaAny
du_subst_234 v0 = coe du_transport_220 (coe v0)
-- Cubed.Path.Base._.J
d_J_256 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  AgdaAny ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d_J_256 ~v0 ~v1 ~v2 v3 ~v4 v5 ~v6 ~v7 = du_J_256 v3 v5
du_J_256 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> AgdaAny -> AgdaAny
du_J_256 v0 v1 = coe du_transport_220 v0 v1
-- Cubed.Path.Base.path-to-refl
d_path'45'to'45'refl_272 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
d_path'45'to'45'refl_272 v0 ~v1 v2 ~v3
  = du_path'45'to'45'refl_272 v0 v2
du_path'45'to'45'refl_272 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
du_path'45'to'45'refl_272 v0 v1 v2
  = coe
      du_J_256 (coe v0) (let v3 = \ v3 -> v1 in coe (coe (\ v4 -> v3)))
