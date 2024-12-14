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

module MAlonzo.Code.Cubed.Grammars.Sum where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Grammars.Base

-- Cubed.Grammars.Sum._._⊢_
d__'8866'__18 a0 a1 a2 a3 = ()
-- Cubed.Grammars.Sum._.Lin
d_Lin_44 a0 a1 = ()
-- Cubed.Grammars.Sum.Tag
d_Tag_234 a0 a1 = ()
data T_Tag_234 = C_'96'inl_236 | C_'96'inr_238
-- Cubed.Grammars.Sum._⊕_
d__'8853'__240 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d__'8853'__240 ~v0 ~v1 v2 v3 = du__'8853'__240 v2 v3
du__'8853'__240 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
du__'8853'__240 v0 v1
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
      (\ v2 ->
         case coe v2 of
           C_'96'inl_236 -> coe v0
           C_'96'inr_238 -> coe v1
           _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Grammars.Sum.elim
d_elim_252 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_elim_252 ~v0 ~v1 v2 v3 v4 v5 v6 = du_elim_252 v2 v3 v4 v5 v6
du_elim_252 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_elim_252 v0 v1 v2 v3 v4
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'elim_154
      (\ v5 ->
         case coe v5 of
           C_'96'inl_236 -> coe v0
           C_'96'inr_238 -> coe v2
           _ -> MAlonzo.RTE.mazUnreachableError)
      v1
      (\ v5 ->
         case coe v5 of
           C_'96'inl_236 -> coe v3
           C_'96'inr_238 -> coe v4
           _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Grammars.Sum.bimap
d_bimap_260 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_bimap_260 ~v0 ~v1 v2 v3 v4 v5 v6 v7
  = du_bimap_260 v2 v3 v4 v5 v6 v7
du_bimap_260 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_bimap_260 v0 v1 v2 v3 v4 v5
  = coe
      du_elim_252 (coe v0) (coe du__'8853'__240 (coe v1) (coe v3))
      (coe v2)
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134 (coe v0) (coe v1)
         (coe du__'8853'__240 (coe v1) (coe v3)) (coe v4)
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'in_150
            (\ v6 ->
               case coe v6 of
                 C_'96'inl_236 -> coe v1
                 C_'96'inr_238 -> coe v3
                 _ -> MAlonzo.RTE.mazUnreachableError)
            (coe C_'96'inl_236)))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134 (coe v2) (coe v3)
         (coe du__'8853'__240 (coe v1) (coe v3)) (coe v5)
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'in_150
            (\ v6 ->
               case coe v6 of
                 C_'96'inl_236 -> coe v1
                 C_'96'inr_238 -> coe v3
                 _ -> MAlonzo.RTE.mazUnreachableError)
            (coe C_'96'inr_238)))
-- Cubed.Grammars.Sum.map-l
d_map'45'l_266 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_map'45'l_266 ~v0 ~v1 v2 v3 v4 v5 = du_map'45'l_266 v2 v3 v4 v5
du_map'45'l_266 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_map'45'l_266 v0 v1 v2 v3
  = coe
      du_bimap_260 (coe v0) (coe v1) (coe v2) (coe v2) (coe v3)
      (coe MAlonzo.Code.Cubed.Grammars.Base.C_id_132 (coe v2))
-- Cubed.Grammars.Sum.map-r
d_map'45'r_270 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_map'45'r_270 ~v0 ~v1 v2 v3 v4 v5 = du_map'45'r_270 v2 v3 v4 v5
du_map'45'r_270 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_map'45'r_270 v0 v1 v2 v3
  = coe
      du_bimap_260 (coe v2) (coe v2) (coe v0) (coe v1)
      (coe MAlonzo.Code.Cubed.Grammars.Base.C_id_132 (coe v2)) (coe v3)
-- Cubed.Grammars.Sum.bind-l
d_bind'45'l_274 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_bind'45'l_274 ~v0 ~v1 v2 v3 v4 v5 = du_bind'45'l_274 v2 v3 v4 v5
du_bind'45'l_274 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_bind'45'l_274 v0 v1 v2 v3
  = coe
      du_elim_252 (coe v0) (coe du__'8853'__240 (coe v1) (coe v2))
      (coe v2) (coe v3)
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'in_150
         (\ v4 ->
            case coe v4 of
              C_'96'inl_236 -> coe v1
              C_'96'inr_238 -> coe v2
              _ -> MAlonzo.RTE.mazUnreachableError)
         (coe C_'96'inr_238))
-- Cubed.Grammars.Sum.bind-r
d_bind'45'r_278 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_bind'45'r_278 ~v0 ~v1 v2 v3 v4 v5 = du_bind'45'r_278 v2 v3 v4 v5
du_bind'45'r_278 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_bind'45'r_278 v0 v1 v2 v3
  = coe
      du_elim_252 (coe v1) (coe du__'8853'__240 (coe v1) (coe v2))
      (coe v0)
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'in_150
         (\ v4 ->
            case coe v4 of
              C_'96'inl_236 -> coe v1
              C_'96'inr_238 -> coe v2
              _ -> MAlonzo.RTE.mazUnreachableError)
         (coe C_'96'inl_236))
      (coe v3)
