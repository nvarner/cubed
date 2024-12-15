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

module MAlonzo.Code.Cubed.Grammars.Maybe where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Grammars.Base

-- Cubed.Grammars.Maybe._._⊢_
d__'8866'__18 a0 a1 a2 a3 = ()
-- Cubed.Grammars.Maybe._.Lin
d_Lin_44 a0 a1 = ()
-- Cubed.Grammars.Maybe.Tag
d_Tag_258 a0 a1 = ()
data T_Tag_258 = C_'96'just_260 | C_'96'nothing_262
-- Cubed.Grammars.Maybe.Maybe
d_Maybe_264 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_Maybe_264 ~v0 ~v1 v2 = du_Maybe_264 v2
du_Maybe_264 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
du_Maybe_264 v0
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
      (\ v1 ->
         case coe v1 of
           C_'96'just_260 -> coe v0
           C_'96'nothing_262
             -> coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18
           _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Grammars.Maybe.just
d_just_270 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_just_270 ~v0 ~v1 v2 = du_just_270 v2
du_just_270 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_just_270 v0
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'in_150
      (\ v1 ->
         case coe v1 of
           C_'96'just_260 -> coe v0
           C_'96'nothing_262
             -> coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18
           _ -> MAlonzo.RTE.mazUnreachableError)
      (coe C_'96'just_260)
-- Cubed.Grammars.Maybe.nothing
d_nothing_272 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_nothing_272 ~v0 ~v1 v2 v3 = du_nothing_272 v2 v3
du_nothing_272 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_nothing_272 v0 v1
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134 (coe v0)
      (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18)
      (coe du_Maybe_264 (coe v1))
      (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868''45'in_136 (coe v0))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'in_150
         (\ v2 ->
            case coe v2 of
              C_'96'just_260 -> coe v1
              C_'96'nothing_262
                -> coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18
              _ -> MAlonzo.RTE.mazUnreachableError)
         (coe C_'96'nothing_262))
-- Cubed.Grammars.Maybe.elim
d_elim_274 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_elim_274 ~v0 ~v1 v2 v3 v4 v5 = du_elim_274 v2 v3 v4 v5
du_elim_274 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_elim_274 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'elim_154
      (\ v4 ->
         case coe v4 of
           C_'96'just_260 -> coe v0
           C_'96'nothing_262
             -> coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18
           _ -> MAlonzo.RTE.mazUnreachableError)
      v1
      (\ v4 ->
         case coe v4 of
           C_'96'just_260 -> coe v2
           C_'96'nothing_262 -> coe v3
           _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Grammars.Maybe.map
d_map_282 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_map_282 ~v0 ~v1 v2 v3 v4 = du_map_282 v2 v3 v4
du_map_282 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_map_282 v0 v1 v2
  = coe
      du_elim_274 (coe v0) (coe du_Maybe_264 (coe v1))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134 (coe v0) (coe v1)
         (coe du_Maybe_264 (coe v1)) (coe v2) (coe du_just_270 (coe v1)))
      (coe
         du_nothing_272 (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18)
         (coe v1))
-- Cubed.Grammars.Maybe.bind
d_bind_286 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_bind_286 ~v0 ~v1 v2 v3 v4 = du_bind_286 v2 v3 v4
du_bind_286 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_bind_286 v0 v1 v2
  = coe
      du_elim_274 (coe v0) (coe du_Maybe_264 (coe v1)) (coe v2)
      (coe
         du_nothing_272 (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18)
         (coe v1))
-- Cubed.Grammars.Maybe.⊗l
d_'8855'l_290 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_'8855'l_290 ~v0 ~v1 v2 v3 = du_'8855'l_290 v2 v3
du_'8855'l_290 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_'8855'l_290 v0 v1
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.du_'10204''45'in'8315'_236
      (coe du_Maybe_264 (coe v0))
      (coe
         du_Maybe_264
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0) (coe v1)))
      (coe v1)
      (coe
         du_elim_274 (coe v0)
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'10204'__36
            (coe
               du_Maybe_264
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0) (coe v1)))
            (coe v1))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C_'10204''45'in_198 (coe v0)
            (coe v1)
            (coe
               du_Maybe_264
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0) (coe v1)))
            (coe
               du_just_270
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0) (coe v1))))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C_'10204''45'in_198
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18) (coe v1)
            (coe
               du_Maybe_264
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0) (coe v1)))
            (coe
               du_nothing_272
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18) (coe v1))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                  (coe v1)))))
-- Cubed.Grammars.Maybe.⊗r
d_'8855'r_292 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_'8855'r_292 ~v0 ~v1 v2 v3 = du_'8855'r_292 v2 v3
du_'8855'r_292 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_'8855'r_292 v0 v1
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.du_'8888''45'in'8315'_232
      (coe du_Maybe_264 (coe v1)) (coe v0)
      (coe
         du_Maybe_264
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0) (coe v1)))
      (coe
         du_elim_274 (coe v1)
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8888'__34 (coe v0)
            (coe
               du_Maybe_264
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0) (coe v1))))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C_'8888''45'in_194 (coe v0)
            (coe v1)
            (coe
               du_Maybe_264
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0) (coe v1)))
            (coe
               du_just_270
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0) (coe v1))))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C_'8888''45'in_194 (coe v0)
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18)
            (coe
               du_Maybe_264
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0) (coe v1)))
            (coe
               du_nothing_272
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                  (coe v1)))))
