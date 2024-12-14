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

module MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Data.Dec.Base
import qualified MAlonzo.Code.Cubed.Data.List.Properties
import qualified MAlonzo.Code.Cubed.Grammars.Base
import qualified MAlonzo.Code.Cubed.Grammars.Maybe
import qualified MAlonzo.Code.Cubed.Grammars.Sum
import qualified MAlonzo.Code.Cubed.Level
import qualified MAlonzo.Code.Cubed.Path.Base

-- Cubed.Grammars.Parser-combinator._._*
d__'42'_12 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d__'42'_12 ~v0 ~v1 = du__'42'_12
du__'42'_12 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
du__'42'_12 = coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
-- Cubed.Grammars.Parser-combinator._._⊢_
d__'8866'__18 a0 a1 a2 a3 = ()
-- Cubed.Grammars.Parser-combinator._.Char
d_Char_38 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_Char_38 ~v0 ~v1 = du_Char_38
du_Char_38 :: MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
du_Char_38 = coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126
-- Cubed.Grammars.Parser-combinator._.Lin
d_Lin_44 a0 a1 = ()
-- Cubed.Grammars.Parser-combinator._.String
d_String_48 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_String_48 ~v0 ~v1 = du_String_48
du_String_48 :: MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
du_String_48 = coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128
-- Cubed.Grammars.Parser-combinator.Maybe.Maybe
d_Maybe_230 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_Maybe_230 ~v0 ~v1 = du_Maybe_230
du_Maybe_230 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
du_Maybe_230 = coe MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
-- Cubed.Grammars.Parser-combinator.⊕._⊕_
d__'8853'__260 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d__'8853'__260 ~v0 ~v1 = du__'8853'__260
du__'8853'__260 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
du__'8853'__260
  = coe MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
-- Cubed.Grammars.Parser-combinator.Weak-parser
d_Weak'45'parser_296 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 -> ()
d_Weak'45'parser_296 = erased
-- Cubed.Grammars.Parser-combinator.grammar-of
d_grammar'45'of_300 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_grammar'45'of_300 ~v0 ~v1 v2 ~v3 = du_grammar'45'of_300 v2
du_grammar'45'of_300 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
du_grammar'45'of_300 v0 = coe v0
-- Cubed.Grammars.Parser-combinator.Finished-weak-parser
d_Finished'45'weak'45'parser_306 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 -> ()
d_Finished'45'weak'45'parser_306 = erased
-- Cubed.Grammars.Parser-combinator.finish
d_finish_310 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_finish_310 ~v0 ~v1 v2 v3 = du_finish_310 v2 v3
du_finish_310 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_finish_310 v0 v1
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
      (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
      (coe
         MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
      (coe MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264 (coe v0))
      (coe v1)
      (coe
         MAlonzo.Code.Cubed.Grammars.Maybe.du_bind_286
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
         (coe v0)
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
               (coe
                  MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                        (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                        (\ v2 ->
                           coe
                             MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                             (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))))))
            (coe MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264 (coe v0))
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'44''8855'__156 (coe v0)
               (coe v0) (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
               (coe
                  MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                        (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                        (\ v2 ->
                           coe
                             MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                             (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126)))))
               (coe MAlonzo.Code.Cubed.Grammars.Base.C_id_132 (coe v0))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
                  (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                        (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                        (\ v2 ->
                           coe
                             MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                             (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                           (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                           (\ v2 ->
                              coe
                                MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                                (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126)))))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.du_unroll_280
                     (\ v2 ->
                        coe
                          MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                          (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))
                     (coe
                        MAlonzo.Code.Cubed.Level.C_liftℓ_32
                        (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'elim_154
                     (\ v2 ->
                        coe
                          MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                          (let v3 = coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126 in
                           coe
                             (case coe v2 of
                                MAlonzo.Code.Cubed.Grammars.Base.C_'96'nil_112
                                  -> coe
                                       MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                                       (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16)
                                MAlonzo.Code.Cubed.Grammars.Base.C_'96'cons_114
                                  -> coe
                                       MAlonzo.Code.Cubed.Grammars.Base.C_'8855'e_58
                                       (coe MAlonzo.Code.Cubed.Grammars.Base.C_k_46 (coe v3))
                                       (coe
                                          MAlonzo.Code.Cubed.Grammars.Base.C_Var_48
                                          (coe
                                             MAlonzo.Code.Cubed.Level.C_liftℓ_32
                                             (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
                                _ -> MAlonzo.RTE.mazUnreachableError))
                          (coe
                             MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                             (\ v3 ->
                                coe
                                  MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                                  (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                              (\ v2 ->
                                 coe
                                   MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                                   (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126)))))
                     (\ v2 ->
                        case coe v2 of
                          MAlonzo.Code.Cubed.Grammars.Base.C_'96'nil_112
                            -> coe
                                 MAlonzo.Code.Cubed.Grammars.Maybe.du_just_270
                                 (coe
                                    MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                                    (coe
                                       MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                                       (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
                                    (coe
                                       MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                                       (\ v3 ->
                                          coe
                                            MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                                            (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))))
                          MAlonzo.Code.Cubed.Grammars.Base.C_'96'cons_114
                            -> coe
                                 MAlonzo.Code.Cubed.Grammars.Maybe.du_nothing_272
                                 (coe
                                    MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                                    (let v3 = coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126 in
                                     coe
                                       (coe
                                          MAlonzo.Code.Cubed.Grammars.Base.C_'8855'e_58
                                          (coe MAlonzo.Code.Cubed.Grammars.Base.C_k_46 (coe v3))
                                          (coe
                                             MAlonzo.Code.Cubed.Grammars.Base.C_Var_48
                                             (coe
                                                MAlonzo.Code.Cubed.Level.C_liftℓ_32
                                                (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))))
                                    (coe
                                       MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                                       (\ v3 ->
                                          coe
                                            MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                                            (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))))
                                 (coe
                                    MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                                    (coe
                                       MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                                       (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
                                    (coe
                                       MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                                       (\ v3 ->
                                          coe
                                            MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                                            (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))))
                          _ -> MAlonzo.RTE.mazUnreachableError))))
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                           (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                           (\ v2 ->
                              coe
                                MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                                (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))))))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                           (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                           (\ v2 ->
                              coe
                                MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                                (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))))))
               (coe MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264 (coe v0))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Maybe.du_'8855'r_292 (coe v0)
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                        (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                        (\ v2 ->
                           coe
                             MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                             (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126)))))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Maybe.du_map_282
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                           (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                           (\ v2 ->
                              coe
                                MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                                (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126)))))
                  (coe v0)
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C_'8855''45'unit'45'r_162
                     (coe v0))))))
-- Cubed.Grammars.Parser-combinator.pure
d_pure_316 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_pure_316 ~v0 ~v1 = du_pure_316
du_pure_316 :: MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_pure_316
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
      (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16)
         (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
      (coe
         MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C_'8855''45'unit'45'l'8315'_160
         (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
      (coe
         MAlonzo.Code.Cubed.Grammars.Maybe.du_just_270
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
-- Cubed.Grammars.Parser-combinator.map
d_map_318 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_map_318 ~v0 ~v1 v2 v3 v4 v5 = du_map_318 v2 v3 v4 v5
du_map_318 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_map_318 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
      (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
      (coe
         MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
      (coe
         MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v1)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
      (coe v3)
      (coe
         MAlonzo.Code.Cubed.Grammars.Maybe.du_map_282
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v1)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'44''8855'__156 (coe v0)
            (coe v1) (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128) (coe v2)
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C_id_132
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))))
-- Cubed.Grammars.Parser-combinator.map-maybe
d_map'45'maybe_324 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_map'45'maybe_324 ~v0 ~v1 v2 v3 v4 v5
  = du_map'45'maybe_324 v2 v3 v4 v5
du_map'45'maybe_324 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_map'45'maybe_324 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
      (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
      (coe
         MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
      (coe
         MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v1)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
      (coe v3)
      (coe
         MAlonzo.Code.Cubed.Grammars.Maybe.du_bind_286
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v1)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
               (coe MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264 (coe v1))
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
            (coe
               MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v1)
                  (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'44''8855'__156 (coe v0)
               (coe MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264 (coe v1))
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128) (coe v2)
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C_id_132
                  (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
            (coe
               MAlonzo.Code.Cubed.Grammars.Maybe.du_'8855'l_290 (coe v1)
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))))
-- Cubed.Grammars.Parser-combinator.concat
d_concat_330 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_concat_330 ~v0 ~v1 v2 v3 v4 v5 = du_concat_330 v2 v3 v4 v5
du_concat_330 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_concat_330 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
      (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
      (coe
         MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
      (coe
         MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0) (coe v1))
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
      (coe v2)
      (coe
         MAlonzo.Code.Cubed.Grammars.Maybe.du_bind_286
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0) (coe v1))
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
               (coe
                  MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v1)
                     (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))))
            (coe
               MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0) (coe v1))
                  (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'44''8855'__156 (coe v0)
               (coe v0) (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
               (coe
                  MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v1)
                     (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
               (coe MAlonzo.Code.Cubed.Grammars.Base.C_id_132 (coe v0)) (coe v3))
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v1)
                        (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v1)
                        (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0) (coe v1))
                     (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Maybe.du_'8855'r_292 (coe v0)
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v1)
                     (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Maybe.du_map_282
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v1)
                        (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0) (coe v1))
                     (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C_'8855''45'assoc_166 (coe v0)
                     (coe v1) (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))))))
-- Cubed.Grammars.Parser-combinator._<⊗>_
d__'60''8855''62'__336 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d__'60''8855''62'__336 ~v0 ~v1 = du__'60''8855''62'__336
du__'60''8855''62'__336 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du__'60''8855''62'__336 = coe du_concat_330
-- Cubed.Grammars.Parser-combinator.fail
d_fail_338 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_fail_338 ~v0 ~v1 v2 = du_fail_338 v2
du_fail_338 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_fail_338 v0
  = coe
      MAlonzo.Code.Cubed.Grammars.Maybe.du_nothing_272
      (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
         (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
-- Cubed.Grammars.Parser-combinator._<|>_
d__'60''124''62'__340 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d__'60''124''62'__340 ~v0 ~v1 v2 v3 v4
  = du__'60''124''62'__340 v2 v3 v4
du__'60''124''62'__340 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du__'60''124''62'__340 v0 v1 v2
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
      (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
      (coe
         MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
      (coe
         MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
      (coe v1)
      (coe
         MAlonzo.Code.Cubed.Grammars.Maybe.du_rec_274
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
         (coe
            MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
         (coe
            MAlonzo.Code.Cubed.Grammars.Maybe.du_just_270
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
            (coe
               MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                  (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_read_216) (coe v2)))
-- Cubed.Grammars.Parser-combinator._<⊕>_
d__'60''8853''62'__346 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d__'60''8853''62'__346 ~v0 ~v1 v2 v3 v4 v5
  = du__'60''8853''62'__346 v2 v3 v4 v5
du__'60''8853''62'__346 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du__'60''8853''62'__346 v0 v1 v2 v3
  = coe
      du__'60''124''62'__340
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
         (\ v4 ->
            case coe v4 of
              MAlonzo.Code.Cubed.Grammars.Sum.C_'96'inl_236 -> coe v0
              MAlonzo.Code.Cubed.Grammars.Sum.C_'96'inr_238 -> coe v1
              _ -> MAlonzo.RTE.mazUnreachableError))
      (coe
         du_map_318 (coe v0)
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
            (\ v4 ->
               case coe v4 of
                 MAlonzo.Code.Cubed.Grammars.Sum.C_'96'inl_236 -> coe v0
                 MAlonzo.Code.Cubed.Grammars.Sum.C_'96'inr_238 -> coe v1
                 _ -> MAlonzo.RTE.mazUnreachableError))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'in_150
            (\ v4 ->
               case coe v4 of
                 MAlonzo.Code.Cubed.Grammars.Sum.C_'96'inl_236 -> coe v0
                 MAlonzo.Code.Cubed.Grammars.Sum.C_'96'inr_238 -> coe v1
                 _ -> MAlonzo.RTE.mazUnreachableError)
            (coe MAlonzo.Code.Cubed.Grammars.Sum.C_'96'inl_236))
         (coe v2))
      (coe
         du_map_318 (coe v1)
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
            (\ v4 ->
               case coe v4 of
                 MAlonzo.Code.Cubed.Grammars.Sum.C_'96'inl_236 -> coe v0
                 MAlonzo.Code.Cubed.Grammars.Sum.C_'96'inr_238 -> coe v1
                 _ -> MAlonzo.RTE.mazUnreachableError))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'in_150
            (\ v4 ->
               case coe v4 of
                 MAlonzo.Code.Cubed.Grammars.Sum.C_'96'inl_236 -> coe v0
                 MAlonzo.Code.Cubed.Grammars.Sum.C_'96'inr_238 -> coe v1
                 _ -> MAlonzo.RTE.mazUnreachableError)
            (coe MAlonzo.Code.Cubed.Grammars.Sum.C_'96'inr_238))
         (coe v3))
-- Cubed.Grammars.Parser-combinator.many
d_many_352 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_many_352 ~v0 ~v1 v2 v3 = du_many_352 v2 v3
du_many_352 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_many_352 v0 v1
  = coe
      du__'60''124''62'__340
      (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
         (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
         (coe
            MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
         (coe
            MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
               (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0))
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
         (coe v1)
         (coe
            MAlonzo.Code.Cubed.Grammars.Maybe.du_bind_286
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
               (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0))
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                  (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0))
                        (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0))
                     (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'44''8855'__156 (coe v0)
                  (coe v0) (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0))
                        (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_id_132 (coe v0))
                  (coe du_many_352 (coe v0) (coe v1)))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                           (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0))
                           (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                           (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0))
                           (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0))
                        (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Maybe.du_'8855'r_292 (coe v0)
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0))
                        (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Maybe.du_map_282
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                           (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0))
                           (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0))
                        (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                              (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0))
                              (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                              (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0)))
                           (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                           (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0))
                           (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C_'8855''45'assoc_166 (coe v0)
                           (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0))
                           (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C__'44''8855'__156
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                              (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0)))
                           (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0))
                           (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
                           (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
                           (coe MAlonzo.Code.Cubed.Grammars.Base.du_cons_290 (coe v0))
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C_id_132
                              (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))))))))
      (coe
         du_map_318 (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16)
         (coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122 (coe v0))
         (coe MAlonzo.Code.Cubed.Grammars.Base.du_nil_288 (coe v0))
         (coe du_pure_316))
-- Cubed.Grammars.Parser-combinator.rest
d_rest_356 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_rest_356 ~v0 ~v1 = du_rest_356
du_rest_356 :: MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_rest_356
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
      (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
         (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
      (coe
         MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C_'8855''45'unit'45'r'8315'_164
         (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
         (coe
            MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'44''8855'__156
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C_id_132
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.du_string'45'in_298
               (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16)))
         (coe
            MAlonzo.Code.Cubed.Grammars.Maybe.du_just_270
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))))
-- Cubed.Grammars.Parser-combinator.any-char
d_any'45'char_358 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_any'45'char_358 ~v0 ~v1 = du_any'45'char_358
du_any'45'char_358 ::
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_any'45'char_358
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
      (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
            (\ v0 ->
               coe
                 MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                 (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))))
      (coe
         MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126)
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.du_unroll_280
         (\ v0 ->
            coe
              MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
              (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))
         (coe
            MAlonzo.Code.Cubed.Level.C_liftℓ_32
            (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'elim_154
         (\ v0 ->
            coe
              MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
              (let v1 = coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126 in
               coe
                 (case coe v0 of
                    MAlonzo.Code.Cubed.Grammars.Base.C_'96'nil_112
                      -> coe
                           MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                           (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16)
                    MAlonzo.Code.Cubed.Grammars.Base.C_'96'cons_114
                      -> coe
                           MAlonzo.Code.Cubed.Grammars.Base.C_'8855'e_58
                           (coe MAlonzo.Code.Cubed.Grammars.Base.C_k_46 (coe v1))
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C_Var_48
                              (coe
                                 MAlonzo.Code.Cubed.Level.C_liftℓ_32
                                 (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
                    _ -> MAlonzo.RTE.mazUnreachableError))
              (coe
                 MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                 (\ v1 ->
                    coe
                      MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                      (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))))
         (coe
            MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126)
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
         (\ v0 ->
            case coe v0 of
              MAlonzo.Code.Cubed.Grammars.Base.C_'96'nil_112
                -> coe
                     MAlonzo.Code.Cubed.Grammars.Maybe.du_nothing_272
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                           (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                           (\ v1 ->
                              coe
                                MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                                (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126)
                        (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
              MAlonzo.Code.Cubed.Grammars.Base.C_'96'cons_114
                -> coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                        (let v1 = coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126 in
                         coe
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C_'8855'e_58
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_k_46 (coe v1))
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Base.C_Var_48
                                 (coe
                                    MAlonzo.Code.Cubed.Level.C_liftℓ_32
                                    (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                           (\ v1 ->
                              coe
                                MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                                (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                              (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                              (\ v1 ->
                                 coe
                                   MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                                   (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))))
                        (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                           (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126)
                           (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'44''8855'__156
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                              (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                              (\ v1 ->
                                 coe
                                   MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                                   (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                              (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                              (\ v1 ->
                                 coe
                                   MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                                   (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C_Var_48
                              (coe
                                 MAlonzo.Code.Cubed.Level.C_liftℓ_32
                                 (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                              (\ v1 ->
                                 coe
                                   MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                                   (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))))
                        (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C_id_132
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                                 (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                                 (\ v1 ->
                                    coe
                                      MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                                      (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126)))))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.du_string'45'in_298
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Base.C_Var_48
                                 (coe
                                    MAlonzo.Code.Cubed.Level.C_liftℓ_32
                                    (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                                 (\ v1 ->
                                    coe
                                      MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                                      (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))))))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Maybe.du_just_270
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                                 (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Base.C_μ_42
                                 (\ v1 ->
                                    coe
                                      MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116
                                      (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126))))
                           (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
              _ -> MAlonzo.RTE.mazUnreachableError))
-- Cubed.Grammars.Parser-combinator.satisfy
d_satisfy_372 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_satisfy_372 ~v0 ~v1 ~v2 v3 = du_satisfy_372 v3
du_satisfy_372 ::
  (AgdaAny -> MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_satisfy_372 v0
  = coe
      du_map'45'maybe_324
      (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126)
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
         (\ v1 ->
            coe
              MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
              (\ v2 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v1))))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'elim_154
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22)
         (coe
            MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
               (\ v1 ->
                  coe
                    MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
                    (\ v2 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v1)))))
         (\ v1 ->
            coe
              MAlonzo.Code.Cubed.Data.Dec.Base.du_rec_46
              (coe
                 (\ v2 ->
                    coe
                      MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
                      (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v1))
                      (coe
                         MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
                         (\ v3 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v1)))
                      (coe
                         MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                         (coe
                            MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
                            (\ v3 ->
                               coe
                                 MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
                                 (\ v4 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v3)))))
                      (coe
                         MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'in_150
                         (\ v3 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v1))
                         v2)
                      (coe
                         MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
                         (coe
                            MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
                            (\ v3 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v1)))
                         (coe
                            MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
                            (\ v3 ->
                               coe
                                 MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
                                 (\ v4 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v3))))
                         (coe
                            MAlonzo.Code.Cubed.Grammars.Maybe.du_Maybe_264
                            (coe
                               MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
                               (\ v3 ->
                                  coe
                                    MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
                                    (\ v4 ->
                                       coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v3)))))
                         (coe
                            MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'in_150
                            (\ v3 ->
                               coe
                                 MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
                                 (\ v4 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v3)))
                            v1)
                         (coe
                            MAlonzo.Code.Cubed.Grammars.Maybe.du_just_270
                            (coe
                               MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
                               (\ v3 ->
                                  coe
                                    MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
                                    (\ v4 ->
                                       coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v3))))))))
              (coe
                 (\ v2 ->
                    coe
                      MAlonzo.Code.Cubed.Grammars.Maybe.du_nothing_272
                      (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v1))
                      (coe
                         MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
                         (\ v3 ->
                            coe
                              MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
                              (\ v4 ->
                                 coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v3))))))
              (coe v0 v1)))
      (coe du_any'45'char_358)
-- Cubed.Grammars.Parser-combinator._.char
d_char_390 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny ->
   AgdaAny -> MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_char_390 ~v0 ~v1 v2 v3 = du_char_390 v2 v3
du_char_390 ::
  (AgdaAny ->
   AgdaAny -> MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_char_390 v0 v1
  = coe
      du_map_318
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
         (\ v2 ->
            coe
              MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
              (\ v3 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v2))))
      (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v1))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'elim_154
         (\ v2 ->
            coe
              MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
              (\ v3 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v2)))
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v1))
         (\ v2 ->
            coe
              MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'elim_154
              (\ v3 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v2))
              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v1))
              (\ v3 ->
                 coe
                   MAlonzo.Code.Cubed.Path.Base.du_J_256 (coe ())
                   (coe
                      MAlonzo.Code.Cubed.Grammars.Base.C_id_132
                      (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v1))))))
      (coe
         du_satisfy_372
         (coe
            (\ v2 ->
               coe
                 MAlonzo.Code.Cubed.Data.Dec.Base.du__'8799'__78 (coe v1) (coe v2)
                 (coe v0))))
-- Cubed.Grammars.Parser-combinator._.One-of
d_One'45'of_402 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny ->
   AgdaAny -> MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  [AgdaAny] -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_One'45'of_402 ~v0 ~v1 ~v2 ~v3 = du_One'45'of_402
du_One'45'of_402 :: MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
du_One'45'of_402
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
      (\ v0 ->
         coe
           MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
           (\ v1 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v0)))
-- Cubed.Grammars.Parser-combinator._.one-of
d_one'45'of_412 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny ->
   AgdaAny -> MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  [AgdaAny] -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_one'45'of_412 v0 ~v1 v2 v3 = du_one'45'of_412 v0 v2 v3
du_one'45'of_412 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (AgdaAny ->
   AgdaAny -> MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  [AgdaAny] -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_one'45'of_412 v0 v1 v2
  = coe
      du_satisfy_372
      (coe
         (\ v3 ->
            coe
              MAlonzo.Code.Cubed.Data.List.Properties.du_elt'45'dec_58 (coe v0)
              (coe v1) (coe v3) (coe v2)))
-- Cubed.Grammars.Parser-combinator._.None-of
d_None'45'of_418 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny ->
   AgdaAny -> MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  [AgdaAny] -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_None'45'of_418 ~v0 ~v1 ~v2 ~v3 = du_None'45'of_418
du_None'45'of_418 :: MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
du_None'45'of_418
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
      (\ v0 ->
         coe
           MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
           (\ v1 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v0)))
-- Cubed.Grammars.Parser-combinator._.none-of
d_none'45'of_428 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny ->
   AgdaAny -> MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  [AgdaAny] -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_none'45'of_428 v0 ~v1 v2 v3 = du_none'45'of_428 v0 v2 v3
du_none'45'of_428 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (AgdaAny ->
   AgdaAny -> MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  [AgdaAny] -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_none'45'of_428 v0 v1 v2
  = coe
      du_satisfy_372
      (coe
         (\ v3 ->
            coe
              MAlonzo.Code.Cubed.Data.Dec.Base.du_'172''45'dec_94
              (coe
                 MAlonzo.Code.Cubed.Data.List.Properties.du_elt'45'dec_58 (coe v0)
                 (coe v1) (coe v3) (coe v2))))
