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

module MAlonzo.Code.Cubed.Grammars.Semantics where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Maybe
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Agda.Primitive.Cubical
import qualified MAlonzo.Code.Cubed.Data.List.Base
import qualified MAlonzo.Code.Cubed.Data.List.Properties
import qualified MAlonzo.Code.Cubed.Data.Maybe.Base
import qualified MAlonzo.Code.Cubed.Data.Prod.Base
import qualified MAlonzo.Code.Cubed.Grammars.Base
import qualified MAlonzo.Code.Cubed.Grammars.Maybe
import qualified MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator
import qualified MAlonzo.Code.Cubed.Grammars.SemZ45Zact
import qualified MAlonzo.Code.Cubed.Level
import qualified MAlonzo.Code.Cubed.Path.Base

-- Cubed.Grammars.Semantics._._⊢_
d__'8866'__18 a0 a1 a2 a3 = ()
-- Cubed.Grammars.Semantics._.*-tag
d_'42''45'tag_36 a0 a1 = ()
-- Cubed.Grammars.Semantics._.Functor
d_Functor_40 a0 a1 a2 = ()
-- Cubed.Grammars.Semantics._.F⟦_⟧
d_F'10214'_'10215'_42 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Functor_14 ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10) ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_F'10214'_'10215'_42 ~v0 ~v1 = du_F'10214'_'10215'_42
du_F'10214'_'10215'_42 ::
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Functor_14 ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10) ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
du_F'10214'_'10215'_42 v0 v1 v2
  = coe MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62 v1 v2
-- Cubed.Grammars.Semantics._.Lin
d_Lin_44 a0 a1 = ()
-- Cubed.Grammars.Semantics._.String
d_String_48 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_String_48 ~v0 ~v1 = du_String_48
du_String_48 :: MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
du_String_48 = coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128
-- Cubed.Grammars.Semantics._.Weak-parser
d_Weak'45'parser_262 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 -> ()
d_Weak'45'parser_262 = erased
-- Cubed.Grammars.Semantics.Sem-act.Δ
d_Δ_312 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> () -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_Δ_312 ~v0 ~v1 = du_Δ_312
du_Δ_312 :: () -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
du_Δ_312 v0 = coe MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_Δ_302
-- Cubed.Grammars.Semantics.Grammar
d_Grammar_326 :: MAlonzo.Code.Agda.Primitive.T_Level_18 -> () -> ()
d_Grammar_326 = erased
-- Cubed.Grammars.Semantics.Parser
d_Parser_328 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> ([AgdaAny] -> ()) -> ([AgdaAny] -> ()) -> ()
d_Parser_328 = erased
-- Cubed.Grammars.Semantics.Split
d_Split_338 a0 a1 a2 = ()
data T_Split_338 = C_mk_354 [AgdaAny] [AgdaAny] AgdaAny
-- Cubed.Grammars.Semantics.Split.left
d_left_348 :: T_Split_338 -> [AgdaAny]
d_left_348 v0
  = case coe v0 of
      C_mk_354 v1 v2 v3 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Grammars.Semantics.Split.right
d_right_350 :: T_Split_338 -> [AgdaAny]
d_right_350 v0
  = case coe v0 of
      C_mk_354 v1 v2 v3 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Grammars.Semantics.Split.is-split
d_is'45'split_352 ::
  T_Split_338 ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> [AgdaAny]
d_is'45'split_352 v0
  = case coe v0 of
      C_mk_354 v1 v2 v3 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Grammars.Semantics.split-right
d_split'45'right_358 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> T_Split_338
d_split'45'right_358 ~v0 ~v1 v2 = du_split'45'right_358 v2
du_split'45'right_358 :: [AgdaAny] -> T_Split_338
du_split'45'right_358 v0
  = coe
      C_mk_354 (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
      (coe v0)
      (let v1
             = coe
                 MAlonzo.Code.Cubed.Data.List.Base.du__'43''43'__130
                 (coe d_left_348 (coe du_split'45'right_358 (coe v0)))
                 (coe d_right_350 (coe du_split'45'right_358 (coe v0))) in
       coe (coe (\ v2 -> v1)))
-- Cubed.Grammars.Semantics.split-left
d_split'45'left_368 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> T_Split_338
d_split'45'left_368 ~v0 ~v1 v2 = du_split'45'left_368 v2
du_split'45'left_368 :: [AgdaAny] -> T_Split_338
du_split'45'left_368 v0
  = coe
      C_mk_354 (coe v0)
      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
      (coe
         MAlonzo.Code.Cubed.Data.List.Properties.du_'43''43''45'id'45'r_28
         (coe v0))
-- Cubed.Grammars.Semantics.split-++
d_split'45''43''43'_380 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> [AgdaAny] -> T_Split_338
d_split'45''43''43'_380 ~v0 ~v1 v2 v3
  = du_split'45''43''43'_380 v2 v3
du_split'45''43''43'_380 :: [AgdaAny] -> [AgdaAny] -> T_Split_338
du_split'45''43''43'_380 v0 v1
  = coe
      C_mk_354 (coe v0) (coe v1)
      (let v2
             = coe
                 MAlonzo.Code.Cubed.Data.List.Base.du__'43''43'__130
                 (coe d_left_348 (coe du_split'45''43''43'_380 (coe v0) (coe v1)))
                 (coe
                    d_right_350 (coe du_split'45''43''43'_380 (coe v0) (coe v1))) in
       coe (coe (\ v3 -> v2)))
-- Cubed.Grammars.Semantics.G⟦_⟧
d_G'10214'_'10215'_394 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 -> [AgdaAny] -> ()
d_G'10214'_'10215'_394 = erased
-- Cubed.Grammars.Semantics.μ'
d_μ''_402 a0 a1 a2 a3 a4 a5 = ()
data T_μ''_402 = C_roll_410 [AgdaAny] AgdaAny
-- Cubed.Grammars.Semantics.internalize
d_internalize_476 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> T_μ''_402
d_internalize_476 ~v0 ~v1 v2 = du_internalize_476 v2
du_internalize_476 :: [AgdaAny] -> T_μ''_402
du_internalize_476 v0
  = case coe v0 of
      []
        -> coe
             C_roll_410 (coe v0)
             (coe
                MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                (coe MAlonzo.Code.Cubed.Grammars.Base.C_'96'nil_112)
                (coe
                   MAlonzo.Code.Cubed.Level.C_liftℓ_32
                   (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
      (:) v1 v2
        -> coe
             C_roll_410 (coe v0)
             (coe
                MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                (coe MAlonzo.Code.Cubed.Grammars.Base.C_'96'cons_114)
                (coe
                   MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                   (coe
                      du_split'45''43''43'_380
                      (coe
                         MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v1)
                         (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16))
                      (coe v2))
                   (coe
                      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                      (coe
                         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v1)
                         (coe (\ v3 -> v1)))
                      (coe du_internalize_476 (coe v2)))))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Grammars.Semantics.t⟦_⟧
d_t'10214'_'10215'_488 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  [AgdaAny] -> AgdaAny -> AgdaAny
d_t'10214'_'10215'_488 v0 ~v1 ~v2 ~v3 v4 v5
  = du_t'10214'_'10215'_488 v0 v4 v5
du_t'10214'_'10215'_488 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  [AgdaAny] -> AgdaAny -> AgdaAny
du_t'10214'_'10215'_488 v0 v1 v2
  = case coe v1 of
      MAlonzo.Code.Cubed.Grammars.Base.C_id_132 v3 -> coe (\ v4 -> v4)
      MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134 v3 v4 v5 v6 v7
        -> coe
             (\ v8 ->
                coe
                  du_t'10214'_'10215'_488 v0 v7 v2
                  (coe du_t'10214'_'10215'_488 v0 v6 v2 v8))
      MAlonzo.Code.Cubed.Grammars.Base.C_'8868''45'in_136 v3
        -> coe
             (\ v4 ->
                coe
                  MAlonzo.Code.Cubed.Level.C_liftℓ_32
                  (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
      MAlonzo.Code.Cubed.Grammars.Base.C_'8869''45'elim_138 v3
        -> coe (\ v4 -> MAlonzo.RTE.mazUnreachableError)
      MAlonzo.Code.Cubed.Grammars.Base.C_'38''7472''45'in_142 v4 v5 v6
        -> coe
             (\ v7 v8 -> coe du_t'10214'_'10215'_488 v0 (coe v6 v8) v2 v7)
      MAlonzo.Code.Cubed.Grammars.Base.C_'38''7472''45'π_146 v4 v5
        -> coe (\ v6 -> coe v6 v5)
      MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'in_150 v4 v5
        -> coe
             (\ v6 ->
                coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v5) (coe v6))
      MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'elim_154 v4 v5 v6
        -> coe
             (\ v7 ->
                case coe v7 of
                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v8 v9
                    -> coe du_t'10214'_'10215'_488 v0 (coe v6 v8) v2 v9
                  _ -> MAlonzo.RTE.mazUnreachableError)
      MAlonzo.Code.Cubed.Grammars.Base.C__'44''8855'__156 v3 v4 v5 v6 v7 v8
        -> coe
             (\ v9 ->
                case coe v9 of
                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v10 v11
                    -> case coe v11 of
                         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v12 v13
                           -> coe
                                MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v10)
                                (coe
                                   MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                   (coe du_t'10214'_'10215'_488 v0 v7 (d_left_348 (coe v10)) v12)
                                   (coe du_t'10214'_'10215'_488 v0 v8 (d_right_350 (coe v10)) v13))
                         _ -> MAlonzo.RTE.mazUnreachableError
                  _ -> MAlonzo.RTE.mazUnreachableError)
      MAlonzo.Code.Cubed.Grammars.Base.C_'8855''45'unit'45'l_158 v3
        -> coe
             (\ v4 ->
                case coe v4 of
                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v5 v6
                    -> case coe v5 of
                         C_mk_354 v7 v8 v9
                           -> coe
                                seq (coe v7)
                                (case coe v6 of
                                   MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v10 v11
                                     -> coe MAlonzo.Code.Cubed.Path.Base.du_subst_234 v0 v11
                                   _ -> MAlonzo.RTE.mazUnreachableError)
                         _ -> MAlonzo.RTE.mazUnreachableError
                  _ -> MAlonzo.RTE.mazUnreachableError)
      MAlonzo.Code.Cubed.Grammars.Base.C_'8855''45'unit'45'l'8315'_160 v3
        -> coe
             (\ v4 ->
                coe
                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                  (coe du_split'45'right_358 (coe v2))
                  (coe
                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                     (coe
                        MAlonzo.Code.Cubed.Level.C_liftℓ_32
                        (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                     (coe v4)))
      MAlonzo.Code.Cubed.Grammars.Base.C_'8855''45'unit'45'r_162 v3
        -> coe
             (\ v4 ->
                case coe v4 of
                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v5 v6
                    -> case coe v5 of
                         C_mk_354 v7 v8 v9
                           -> coe
                                seq (coe v8)
                                (case coe v6 of
                                   MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v10 v11
                                     -> coe MAlonzo.Code.Cubed.Path.Base.du_subst_234 v0 v10
                                   _ -> MAlonzo.RTE.mazUnreachableError)
                         _ -> MAlonzo.RTE.mazUnreachableError
                  _ -> MAlonzo.RTE.mazUnreachableError)
      MAlonzo.Code.Cubed.Grammars.Base.C_'8855''45'unit'45'r'8315'_164 v3
        -> coe
             (\ v4 ->
                coe
                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                  (coe du_split'45'left_368 (coe v2))
                  (coe
                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v4)
                     (coe
                        MAlonzo.Code.Cubed.Level.C_liftℓ_32
                        (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))))
      MAlonzo.Code.Cubed.Grammars.Base.C_'8855''45'assoc_166 v3 v4 v5
        -> coe
             (\ v6 ->
                case coe v6 of
                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v7 v8
                    -> case coe v7 of
                         C_mk_354 v9 v10 v11
                           -> case coe v8 of
                                MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v12 v13
                                  -> case coe v13 of
                                       MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v14 v15
                                         -> case coe v14 of
                                              C_mk_354 v16 v17 v18
                                                -> case coe v15 of
                                                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v19 v20
                                                       -> coe
                                                            MAlonzo.Code.Cubed.Path.Base.du_subst_234
                                                            v0
                                                            (coe
                                                               MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                               (coe
                                                                  du_split'45''43''43'_380
                                                                  (coe
                                                                     MAlonzo.Code.Cubed.Data.List.Base.du__'43''43'__130
                                                                     (coe v9) (coe v16))
                                                                  (coe v17))
                                                               (coe
                                                                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                                  (coe
                                                                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                                     (coe
                                                                        du_split'45''43''43'_380
                                                                        (coe v9) (coe v16))
                                                                     (coe
                                                                        MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                                        (coe v12) (coe v19)))
                                                                  (coe v20)))
                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                              _ -> MAlonzo.RTE.mazUnreachableError
                                       _ -> MAlonzo.RTE.mazUnreachableError
                                _ -> MAlonzo.RTE.mazUnreachableError
                         _ -> MAlonzo.RTE.mazUnreachableError
                  _ -> MAlonzo.RTE.mazUnreachableError)
      MAlonzo.Code.Cubed.Grammars.Base.C_'8855''45'assoc'8315'_168 v3 v4 v5
        -> coe
             (\ v6 ->
                case coe v6 of
                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v7 v8
                    -> case coe v7 of
                         C_mk_354 v9 v10 v11
                           -> case coe v8 of
                                MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v12 v13
                                  -> case coe v12 of
                                       MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v14 v15
                                         -> case coe v14 of
                                              C_mk_354 v16 v17 v18
                                                -> case coe v15 of
                                                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v19 v20
                                                       -> coe
                                                            MAlonzo.Code.Cubed.Path.Base.du_subst_234
                                                            v0
                                                            (coe
                                                               MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                               (coe
                                                                  du_split'45''43''43'_380 (coe v16)
                                                                  (coe
                                                                     MAlonzo.Code.Cubed.Data.List.Base.du__'43''43'__130
                                                                     (coe v17) (coe v10)))
                                                               (coe
                                                                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                                  (coe v19)
                                                                  (coe
                                                                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                                     (coe
                                                                        du_split'45''43''43'_380
                                                                        (coe v17) (coe v10))
                                                                     (coe
                                                                        MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                                        (coe v20) (coe v13)))))
                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                              _ -> MAlonzo.RTE.mazUnreachableError
                                       _ -> MAlonzo.RTE.mazUnreachableError
                                _ -> MAlonzo.RTE.mazUnreachableError
                         _ -> MAlonzo.RTE.mazUnreachableError
                  _ -> MAlonzo.RTE.mazUnreachableError)
      MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'dist'45'l_174 v4 v5
        -> coe
             (\ v6 ->
                case coe v6 of
                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v7 v8
                    -> case coe v8 of
                         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v9 v10
                           -> case coe v9 of
                                MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v11 v12
                                  -> coe
                                       MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v11)
                                       (coe
                                          MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v7)
                                          (coe
                                             MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v12)
                                             (coe v10)))
                                _ -> MAlonzo.RTE.mazUnreachableError
                         _ -> MAlonzo.RTE.mazUnreachableError
                  _ -> MAlonzo.RTE.mazUnreachableError)
      MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'dist'45'l'8315'_180 v4 v5
        -> coe
             (\ v6 ->
                case coe v6 of
                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v7 v8
                    -> case coe v8 of
                         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v9 v10
                           -> case coe v10 of
                                MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v11 v12
                                  -> coe
                                       MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v9)
                                       (coe
                                          MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                          (coe
                                             MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v7)
                                             (coe v11))
                                          (coe v12))
                                _ -> MAlonzo.RTE.mazUnreachableError
                         _ -> MAlonzo.RTE.mazUnreachableError
                  _ -> MAlonzo.RTE.mazUnreachableError)
      MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'dist'45'r_186 v3 v5
        -> coe
             (\ v6 ->
                case coe v6 of
                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v7 v8
                    -> case coe v8 of
                         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v9 v10
                           -> case coe v10 of
                                MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v11 v12
                                  -> coe
                                       MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v11)
                                       (coe
                                          MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v7)
                                          (coe
                                             MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v9)
                                             (coe v12)))
                                _ -> MAlonzo.RTE.mazUnreachableError
                         _ -> MAlonzo.RTE.mazUnreachableError
                  _ -> MAlonzo.RTE.mazUnreachableError)
      MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'dist'45'r'8315'_192 v4 v5
        -> coe
             (\ v6 ->
                case coe v6 of
                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v7 v8
                    -> case coe v8 of
                         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v9 v10
                           -> case coe v10 of
                                MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v11 v12
                                  -> coe
                                       MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v9)
                                       (coe
                                          MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v11)
                                          (coe
                                             MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v7)
                                             (coe v12)))
                                _ -> MAlonzo.RTE.mazUnreachableError
                         _ -> MAlonzo.RTE.mazUnreachableError
                  _ -> MAlonzo.RTE.mazUnreachableError)
      MAlonzo.Code.Cubed.Grammars.Base.C_'8888''45'in_194 v3 v4 v5 v6
        -> coe
             (\ v7 v8 v9 ->
                coe
                  du_t'10214'_'10215'_488 v0 v6
                  (coe
                     MAlonzo.Code.Cubed.Data.List.Base.du__'43''43'__130 (coe v8)
                     (coe v2))
                  (coe
                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                     (coe du_split'45''43''43'_380 (coe v8) (coe v2))
                     (coe
                        MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v9) (coe v7))))
      MAlonzo.Code.Cubed.Grammars.Base.C_'8888''45'app_196 v3 v4
        -> coe
             (\ v5 ->
                case coe v5 of
                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v6 v7
                    -> case coe v6 of
                         C_mk_354 v8 v9 v10
                           -> case coe v7 of
                                MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v11 v12
                                  -> coe
                                       MAlonzo.Code.Cubed.Path.Base.du_subst_234 v0 (coe v12 v8 v11)
                                _ -> MAlonzo.RTE.mazUnreachableError
                         _ -> MAlonzo.RTE.mazUnreachableError
                  _ -> MAlonzo.RTE.mazUnreachableError)
      MAlonzo.Code.Cubed.Grammars.Base.C_'10204''45'in_198 v3 v4 v5 v6
        -> coe
             (\ v7 v8 v9 ->
                coe
                  du_t'10214'_'10215'_488 v0 v6
                  (coe
                     MAlonzo.Code.Cubed.Data.List.Base.du__'43''43'__130 (coe v2)
                     (coe v8))
                  (coe
                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                     (coe du_split'45''43''43'_380 (coe v2) (coe v8))
                     (coe
                        MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v7) (coe v9))))
      MAlonzo.Code.Cubed.Grammars.Base.C_'10204''45'app_200 v3 v4
        -> coe
             (\ v5 ->
                case coe v5 of
                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v6 v7
                    -> case coe v6 of
                         C_mk_354 v8 v9 v10
                           -> case coe v7 of
                                MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v11 v12
                                  -> coe
                                       MAlonzo.Code.Cubed.Path.Base.du_subst_234 v0 (coe v11 v9 v12)
                                _ -> MAlonzo.RTE.mazUnreachableError
                         _ -> MAlonzo.RTE.mazUnreachableError
                  _ -> MAlonzo.RTE.mazUnreachableError)
      MAlonzo.Code.Cubed.Grammars.Base.C_roll_206 v4 v5
        -> coe (\ v6 -> coe C_roll_410 (coe v2) (coe v6))
      MAlonzo.Code.Cubed.Grammars.Base.C_rec_214 v4 v5 v6 v7
        -> coe
             (\ v8 ->
                case coe v8 of
                  C_roll_410 v9 v10
                    -> coe
                         du_t'10214'_'10215'_488 v0 (coe v6 v7) v2
                         (coe
                            du_t'10214'_'10215'_488 v0
                            (coe
                               MAlonzo.Code.Cubed.Grammars.Base.du_map_244
                               (coe MAlonzo.Code.Cubed.Grammars.Base.C_μ_42 (coe v5)) (coe v4)
                               (coe v5 v7)
                               (coe
                                  MAlonzo.Code.Cubed.Grammars.Base.C_rec_214 (coe v4) (coe v5)
                                  (coe v6)))
                            v2 v10)
                  _ -> MAlonzo.RTE.mazUnreachableError)
      MAlonzo.Code.Cubed.Grammars.Base.C_read_216
        -> coe (\ v3 -> coe du_internalize_476 (coe v2))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Grammars.Semantics.run-parser
d_run'45'parser_738 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  [AgdaAny] -> AgdaAny
d_run'45'parser_738 v0 ~v1 ~v2 v3 v4
  = du_run'45'parser_738 v0 v3 v4
du_run'45'parser_738 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  [AgdaAny] -> AgdaAny
du_run'45'parser_738 v0 v1 v2
  = coe
      du_t'10214'_'10215'_488 v0 v1 v2 (coe du_internalize_476 (coe v2))
-- Cubed.Grammars.Semantics.run-weak-parser
d_run'45'weak'45'parser_746 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  [AgdaAny] -> Maybe AgdaAny
d_run'45'weak'45'parser_746 v0 ~v1 v2 v3 v4
  = du_run'45'weak'45'parser_746 v0 v2 v3 v4
du_run'45'weak'45'parser_746 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  [AgdaAny] -> Maybe AgdaAny
du_run'45'weak'45'parser_746 v0 v1 v2 v3
  = let v4
          = coe
              du_run'45'parser_738 (coe v0)
              (coe
                 MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_finish_310
                 (coe v1) (coe v2))
              (coe v3) in
    coe
      (case coe v4 of
         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v5 v6
           -> case coe v5 of
                MAlonzo.Code.Cubed.Grammars.Maybe.C_'96'just_260
                  -> coe MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe v6)
                MAlonzo.Code.Cubed.Grammars.Maybe.C_'96'nothing_262
                  -> coe MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18
                _ -> MAlonzo.RTE.mazUnreachableError
         _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Grammars.Semantics.run-weak-parser-partial
d_run'45'weak'45'parser'45'partial_758 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_run'45'weak'45'parser'45'partial_758 v0 ~v1 ~v2 v3 v4
  = du_run'45'weak'45'parser'45'partial_758 v0 v3 v4
du_run'45'weak'45'parser'45'partial_758 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_run'45'weak'45'parser'45'partial_758 v0 v1 v2
  = let v3 = coe du_run'45'parser_738 (coe v0) (coe v1) (coe v2) in
    coe
      (case coe v3 of
         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v4 v5
           -> case coe v4 of
                MAlonzo.Code.Cubed.Grammars.Maybe.C_'96'just_260
                  -> case coe v5 of
                       MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v6 v7
                         -> case coe v7 of
                              MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v8 v9
                                -> coe
                                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                     (coe
                                        MAlonzo.Code.Agda.Builtin.Maybe.C_just_16
                                        (coe
                                           MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                           (coe d_left_348 (coe v6)) (coe v8)))
                                     (coe d_right_350 (coe v6))
                              _ -> MAlonzo.RTE.mazUnreachableError
                       _ -> MAlonzo.RTE.mazUnreachableError
                MAlonzo.Code.Cubed.Grammars.Maybe.C_'96'nothing_262
                  -> coe
                       MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                       (coe MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18) (coe v2)
                _ -> MAlonzo.RTE.mazUnreachableError
         _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Grammars.Semantics.run-weak-parser-Δ
d_run'45'weak'45'parser'45'Δ_774 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  [AgdaAny] -> Maybe AgdaAny
d_run'45'weak'45'parser'45'Δ_774 v0 ~v1 ~v2 v3 v4
  = du_run'45'weak'45'parser'45'Δ_774 v0 v3 v4
du_run'45'weak'45'parser'45'Δ_774 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  [AgdaAny] -> Maybe AgdaAny
du_run'45'weak'45'parser'45'Δ_774 v0 v1 v2
  = coe
      MAlonzo.Code.Cubed.Data.Maybe.Base.du_map_24
      (coe (\ v3 -> MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe v3)))
      (coe
         du_run'45'weak'45'parser_746 (coe v0)
         (coe MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_Δ_302) (coe v1)
         (coe v2))
-- Cubed.Grammars.Semantics.run-weak-parser-Δ-partial
d_run'45'weak'45'parser'45'Δ'45'partial_780 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_run'45'weak'45'parser'45'Δ'45'partial_780 v0 ~v1 ~v2 v3 v4
  = du_run'45'weak'45'parser'45'Δ'45'partial_780 v0 v3 v4
du_run'45'weak'45'parser'45'Δ'45'partial_780 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_run'45'weak'45'parser'45'Δ'45'partial_780 v0 v1 v2
  = coe
      MAlonzo.Code.Cubed.Data.Prod.Base.du_map'45'fst_36
      (coe
         MAlonzo.Code.Cubed.Data.Maybe.Base.du_map_24
         (coe
            (\ v3 ->
               MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28
                 (coe MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe v3)))))
      (coe
         du_run'45'weak'45'parser'45'partial_758 (coe v0) (coe v1) (coe v2))
