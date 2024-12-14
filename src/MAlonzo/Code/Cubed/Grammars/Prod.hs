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

module MAlonzo.Code.Cubed.Grammars.Prod where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Grammars.Base

-- Cubed.Grammars.Prod._._⊢_
d__'8866'__18 a0 a1 a2 a3 = ()
-- Cubed.Grammars.Prod._.Lin
d_Lin_44 a0 a1 = ()
-- Cubed.Grammars.Prod.Tag
d_Tag_238 a0 a1 = ()
data T_Tag_238 = C_'96'fst_240 | C_'96'snd_242
-- Cubed.Grammars.Prod._&_
d__'38'__244 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d__'38'__244 ~v0 ~v1 v2 v3 = du__'38'__244 v2 v3
du__'38'__244 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
du__'38'__244 v0 v1
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C_'38''7472'_26
      (\ v2 ->
         case coe v2 of
           C_'96'fst_240 -> coe v0
           C_'96'snd_242 -> coe v1
           _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Grammars.Prod._,&_
d__'44''38'__252 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d__'44''38'__252 ~v0 ~v1 v2 v3 v4 v5 v6
  = du__'44''38'__252 v2 v3 v4 v5 v6
du__'44''38'__252 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du__'44''38'__252 v0 v1 v2 v3 v4
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C_'38''7472''45'in_142 v0
      (\ v5 ->
         case coe v5 of
           C_'96'fst_240 -> coe v1
           C_'96'snd_242 -> coe v2
           _ -> MAlonzo.RTE.mazUnreachableError)
      (\ v5 ->
         case coe v5 of
           C_'96'fst_240 -> coe v3
           C_'96'snd_242 -> coe v4
           _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Grammars.Prod.fst
d_fst_260 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_fst_260 ~v0 ~v1 v2 v3 = du_fst_260 v2 v3
du_fst_260 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_fst_260 v0 v1
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C_'38''7472''45'π_146
      (\ v2 ->
         case coe v2 of
           C_'96'fst_240 -> coe v0
           C_'96'snd_242 -> coe v1
           _ -> MAlonzo.RTE.mazUnreachableError)
      (coe C_'96'fst_240)
-- Cubed.Grammars.Prod.snd
d_snd_262 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_snd_262 ~v0 ~v1 v2 v3 = du_snd_262 v2 v3
du_snd_262 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_snd_262 v0 v1
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C_'38''7472''45'π_146
      (\ v2 ->
         case coe v2 of
           C_'96'fst_240 -> coe v0
           C_'96'snd_242 -> coe v1
           _ -> MAlonzo.RTE.mazUnreachableError)
      (coe C_'96'snd_242)
-- Cubed.Grammars.Prod.bimap
d_bimap_264 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_bimap_264 ~v0 ~v1 v2 v3 v4 v5 v6 v7
  = du_bimap_264 v2 v3 v4 v5 v6 v7
du_bimap_264 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_bimap_264 v0 v1 v2 v3 v4 v5
  = coe
      du__'44''38'__252 (coe du__'38'__244 (coe v0) (coe v2)) (coe v1)
      (coe v3)
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
         (coe du__'38'__244 (coe v0) (coe v2)) (coe v0) (coe v1)
         (coe du_fst_260 (coe v0) (coe v2)) (coe v4))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
         (coe du__'38'__244 (coe v0) (coe v2)) (coe v2) (coe v3)
         (coe du_snd_262 (coe v0) (coe v2)) (coe v5))
-- Cubed.Grammars.Prod.map-fst
d_map'45'fst_270 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_map'45'fst_270 ~v0 ~v1 v2 v3 v4 v5
  = du_map'45'fst_270 v2 v3 v4 v5
du_map'45'fst_270 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_map'45'fst_270 v0 v1 v2 v3
  = coe
      du_bimap_264 (coe v0) (coe v1) (coe v2) (coe v2) (coe v3)
      (coe MAlonzo.Code.Cubed.Grammars.Base.C_id_132 (coe v2))
-- Cubed.Grammars.Prod.map-snd
d_map'45'snd_274 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_map'45'snd_274 ~v0 ~v1 v2 v3 v4 v5
  = du_map'45'snd_274 v2 v3 v4 v5
du_map'45'snd_274 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_map'45'snd_274 v0 v1 v2 v3
  = coe
      du_bimap_264 (coe v2) (coe v2) (coe v0) (coe v1)
      (coe MAlonzo.Code.Cubed.Grammars.Base.C_id_132 (coe v2)) (coe v3)
