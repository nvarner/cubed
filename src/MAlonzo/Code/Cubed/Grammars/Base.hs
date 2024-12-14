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

module MAlonzo.Code.Cubed.Grammars.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Level

-- Cubed.Grammars.Base.Lin
d_Lin_10 a0 a1 = ()
data T_Lin_10
  = C_ε_16 | C_'8868'_18 | C_'8869'_20 | C_Lit_22 AgdaAny |
    C_'38''7472'_26 (AgdaAny -> T_Lin_10) |
    C_'8853''7472'_30 (AgdaAny -> T_Lin_10) |
    C__'8855'__32 T_Lin_10 T_Lin_10 | C__'8888'__34 T_Lin_10 T_Lin_10 |
    C__'10204'__36 T_Lin_10 T_Lin_10 |
    C_μ_42 (AgdaAny -> T_Functor_14) AgdaAny
-- Cubed.Grammars.Base.Functor
d_Functor_14 a0 a1 a2 = ()
data T_Functor_14
  = C_k_46 T_Lin_10 | C_Var_48 AgdaAny |
    C_'38'e_52 (AgdaAny -> T_Functor_14) |
    C_'8853'e_56 (AgdaAny -> T_Functor_14) |
    C_'8855'e_58 T_Functor_14 T_Functor_14
-- Cubed.Grammars.Base.F⟦_⟧
d_F'10214'_'10215'_62 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> () -> T_Functor_14 -> (AgdaAny -> T_Lin_10) -> T_Lin_10
d_F'10214'_'10215'_62 ~v0 ~v1 ~v2 v3 v4
  = du_F'10214'_'10215'_62 v3 v4
du_F'10214'_'10215'_62 ::
  T_Functor_14 -> (AgdaAny -> T_Lin_10) -> T_Lin_10
du_F'10214'_'10215'_62 v0 v1
  = case coe v0 of
      C_k_46 v2 -> coe v2
      C_Var_48 v2 -> coe v1 v2
      C_'38'e_52 v3
        -> coe
             C_'38''7472'_26
             (\ v4 -> coe du_F'10214'_'10215'_62 (coe v3 v4) (coe v1))
      C_'8853'e_56 v3
        -> coe
             C_'8853''7472'_30
             (\ v4 -> coe du_F'10214'_'10215'_62 (coe v3 v4) (coe v1))
      C_'8855'e_58 v2 v3
        -> coe
             C__'8855'__32 (coe du_F'10214'_'10215'_62 (coe v2) (coe v1))
             (coe du_F'10214'_'10215'_62 (coe v3) (coe v1))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Grammars.Base.*-tag
d_'42''45'tag_110 a0 a1 = ()
data T_'42''45'tag_110 = C_'96'nil_112 | C_'96'cons_114
-- Cubed.Grammars.Base.*-functor
d_'42''45'functor_116 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  T_Lin_10 -> MAlonzo.Code.Cubed.Level.T_Lift_20 -> T_Functor_14
d_'42''45'functor_116 ~v0 ~v1 v2 ~v3 = du_'42''45'functor_116 v2
du_'42''45'functor_116 :: T_Lin_10 -> T_Functor_14
du_'42''45'functor_116 v0
  = coe
      C_'8853'e_56
      (\ v1 ->
         case coe v1 of
           C_'96'nil_112 -> coe C_k_46 (coe C_ε_16)
           C_'96'cons_114
             -> coe
                  C_'8855'e_58 (coe C_k_46 (coe v0))
                  (coe
                     C_Var_48
                     (coe
                        MAlonzo.Code.Cubed.Level.C_liftℓ_32
                        (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
           _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Grammars.Base._*
d__'42'_122 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Lin_10 -> T_Lin_10
d__'42'_122 ~v0 ~v1 v2 = du__'42'_122 v2
du__'42'_122 :: T_Lin_10 -> T_Lin_10
du__'42'_122 v0
  = coe
      C_μ_42 (\ v1 -> coe du_'42''45'functor_116 (coe v0))
      (coe
         MAlonzo.Code.Cubed.Level.C_liftℓ_32
         (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
-- Cubed.Grammars.Base.Char
d_Char_126 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> () -> T_Lin_10
d_Char_126 ~v0 ~v1 = du_Char_126
du_Char_126 :: T_Lin_10
du_Char_126 = coe C_'8853''7472'_30 (coe C_Lit_22)
-- Cubed.Grammars.Base.String
d_String_128 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> () -> T_Lin_10
d_String_128 ~v0 ~v1 = du_String_128
du_String_128 :: T_Lin_10
du_String_128 = coe du__'42'_122 (coe du_Char_126)
-- Cubed.Grammars.Base._⊢_
d__'8866'__130 a0 a1 a2 a3 = ()
data T__'8866'__130
  = C_id_132 T_Lin_10 |
    C__'8902'__134 T_Lin_10 T_Lin_10 T_Lin_10 T__'8866'__130
                   T__'8866'__130 |
    C_'8868''45'in_136 T_Lin_10 | C_'8869''45'elim_138 T_Lin_10 |
    C_'38''7472''45'in_142 T_Lin_10 (AgdaAny -> T_Lin_10)
                           (AgdaAny -> T__'8866'__130) |
    C_'38''7472''45'π_146 (AgdaAny -> T_Lin_10) AgdaAny |
    C_'8853''7472''45'in_150 (AgdaAny -> T_Lin_10) AgdaAny |
    C_'8853''7472''45'elim_154 (AgdaAny -> T_Lin_10) T_Lin_10
                               (AgdaAny -> T__'8866'__130) |
    C__'44''8855'__156 T_Lin_10 T_Lin_10 T_Lin_10 T_Lin_10
                       T__'8866'__130 T__'8866'__130 |
    C_'8855''45'unit'45'l_158 T_Lin_10 |
    C_'8855''45'unit'45'l'8315'_160 T_Lin_10 |
    C_'8855''45'unit'45'r_162 T_Lin_10 |
    C_'8855''45'unit'45'r'8315'_164 T_Lin_10 |
    C_'8855''45'assoc_166 T_Lin_10 T_Lin_10 T_Lin_10 |
    C_'8855''45'assoc'8315'_168 T_Lin_10 T_Lin_10 T_Lin_10 |
    C_'8853''7472''45'dist'45'l_174 (AgdaAny -> T_Lin_10) T_Lin_10 |
    C_'8853''7472''45'dist'45'l'8315'_180 (AgdaAny -> T_Lin_10)
                                          T_Lin_10 |
    C_'8853''7472''45'dist'45'r_186 T_Lin_10 (AgdaAny -> T_Lin_10) |
    C_'8853''7472''45'dist'45'r'8315'_192 T_Lin_10
                                          (AgdaAny -> T_Lin_10) |
    C_'8888''45'in_194 T_Lin_10 T_Lin_10 T_Lin_10 T__'8866'__130 |
    C_'8888''45'app_196 T_Lin_10 T_Lin_10 |
    C_'10204''45'in_198 T_Lin_10 T_Lin_10 T_Lin_10 T__'8866'__130 |
    C_'10204''45'app_200 T_Lin_10 T_Lin_10 |
    C_roll_206 (AgdaAny -> T_Functor_14) AgdaAny |
    C_rec_214 (AgdaAny -> T_Lin_10) (AgdaAny -> T_Functor_14)
              (AgdaAny -> T__'8866'__130) AgdaAny |
    C_read_216
-- Cubed.Grammars.Base.⊕ᴰ-map
d_'8853''7472''45'map_218 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () -> () -> T_Lin_10 -> (AgdaAny -> AgdaAny) -> T__'8866'__130
d_'8853''7472''45'map_218 ~v0 ~v1 ~v2 ~v3 v4 v5
  = du_'8853''7472''45'map_218 v4 v5
du_'8853''7472''45'map_218 ::
  T_Lin_10 -> (AgdaAny -> AgdaAny) -> T__'8866'__130
du_'8853''7472''45'map_218 v0 v1
  = coe
      C_'8853''7472''45'elim_154 (\ v2 -> v0)
      (coe C_'8853''7472'_30 (\ v2 -> v0))
      (\ v2 -> coe C_'8853''7472''45'in_150 (\ v3 -> v0) (coe v1 v2))
-- Cubed.Grammars.Base.⊕ᴰ-map-g
d_'8853''7472''45'map'45'g_226 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  (AgdaAny -> T_Lin_10) ->
  (AgdaAny -> T_Lin_10) ->
  (AgdaAny -> T__'8866'__130) -> T__'8866'__130
d_'8853''7472''45'map'45'g_226 ~v0 ~v1 ~v2 v3 v4 v5
  = du_'8853''7472''45'map'45'g_226 v3 v4 v5
du_'8853''7472''45'map'45'g_226 ::
  (AgdaAny -> T_Lin_10) ->
  (AgdaAny -> T_Lin_10) ->
  (AgdaAny -> T__'8866'__130) -> T__'8866'__130
du_'8853''7472''45'map'45'g_226 v0 v1 v2
  = coe
      C_'8853''7472''45'elim_154 v0 (coe C_'8853''7472'_30 v1)
      (\ v3 ->
         coe
           C__'8902'__134 (coe v0 v3) (coe v1 v3) (coe C_'8853''7472'_30 v1)
           (coe v2 v3) (coe C_'8853''7472''45'in_150 v1 v3))
-- Cubed.Grammars.Base.⊸-in⁻
d_'8888''45'in'8315'_232 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  T_Lin_10 ->
  T_Lin_10 -> T_Lin_10 -> T__'8866'__130 -> T__'8866'__130
d_'8888''45'in'8315'_232 ~v0 ~v1 v2 v3 v4 v5
  = du_'8888''45'in'8315'_232 v2 v3 v4 v5
du_'8888''45'in'8315'_232 ::
  T_Lin_10 ->
  T_Lin_10 -> T_Lin_10 -> T__'8866'__130 -> T__'8866'__130
du_'8888''45'in'8315'_232 v0 v1 v2 v3
  = coe
      C__'8902'__134 (coe C__'8855'__32 (coe v1) (coe v0))
      (coe C__'8855'__32 (coe v1) (coe C__'8888'__34 (coe v1) (coe v2)))
      (coe v2)
      (coe
         C__'44''8855'__156 (coe v1) (coe v1) (coe v0)
         (coe C__'8888'__34 (coe v1) (coe v2)) (coe C_id_132 (coe v1))
         (coe v3))
      (coe C_'8888''45'app_196 (coe v1) (coe v2))
-- Cubed.Grammars.Base.⟜-in⁻
d_'10204''45'in'8315'_236 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  T_Lin_10 ->
  T_Lin_10 -> T_Lin_10 -> T__'8866'__130 -> T__'8866'__130
d_'10204''45'in'8315'_236 ~v0 ~v1 v2 v3 v4 v5
  = du_'10204''45'in'8315'_236 v2 v3 v4 v5
du_'10204''45'in'8315'_236 ::
  T_Lin_10 ->
  T_Lin_10 -> T_Lin_10 -> T__'8866'__130 -> T__'8866'__130
du_'10204''45'in'8315'_236 v0 v1 v2 v3
  = coe
      C__'8902'__134 (coe C__'8855'__32 (coe v0) (coe v2))
      (coe C__'8855'__32 (coe C__'10204'__36 (coe v1) (coe v2)) (coe v2))
      (coe v1)
      (coe
         C__'44''8855'__156 (coe v0) (coe C__'10204'__36 (coe v1) (coe v2))
         (coe v2) (coe v2) (coe v3) (coe C_id_132 (coe v2)))
      (coe C_'10204''45'app_200 (coe v1) (coe v2))
-- Cubed.Grammars.Base.map
d_map_244 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  (AgdaAny -> T_Lin_10) ->
  (AgdaAny -> T_Lin_10) ->
  T_Functor_14 -> (AgdaAny -> T__'8866'__130) -> T__'8866'__130
d_map_244 ~v0 ~v1 ~v2 v3 v4 v5 v6 = du_map_244 v3 v4 v5 v6
du_map_244 ::
  (AgdaAny -> T_Lin_10) ->
  (AgdaAny -> T_Lin_10) ->
  T_Functor_14 -> (AgdaAny -> T__'8866'__130) -> T__'8866'__130
du_map_244 v0 v1 v2 v3
  = case coe v2 of
      C_k_46 v4
        -> coe C_id_132 (coe du_F'10214'_'10215'_62 (coe v2) (coe v0))
      C_Var_48 v4 -> coe v3 v4
      C_'38'e_52 v5
        -> coe
             C_'38''7472''45'in_142
             (coe du_F'10214'_'10215'_62 (coe C_'38'e_52 v5) (coe v0))
             (\ v6 -> coe du_F'10214'_'10215'_62 (coe v5 v6) (coe v1))
             (\ v6 ->
                coe
                  C__'8902'__134
                  (coe du_F'10214'_'10215'_62 (coe C_'38'e_52 v5) (coe v0))
                  (coe du_F'10214'_'10215'_62 (coe v5 v6) (coe v0))
                  (coe du_F'10214'_'10215'_62 (coe v5 v6) (coe v1))
                  (coe
                     C_'38''7472''45'π_146
                     (\ v7 -> coe du_F'10214'_'10215'_62 (coe v5 v7) (coe v0)) v6)
                  (coe du_map_244 (coe v0) (coe v1) (coe v5 v6) (coe v3)))
      C_'8853'e_56 v5
        -> coe
             C_'8853''7472''45'elim_154
             (\ v6 -> coe du_F'10214'_'10215'_62 (coe v5 v6) (coe v0))
             (coe du_F'10214'_'10215'_62 (coe C_'8853'e_56 v5) (coe v1))
             (\ v6 ->
                coe
                  C__'8902'__134 (coe du_F'10214'_'10215'_62 (coe v5 v6) (coe v0))
                  (coe du_F'10214'_'10215'_62 (coe v5 v6) (coe v1))
                  (coe du_F'10214'_'10215'_62 (coe C_'8853'e_56 v5) (coe v1))
                  (coe du_map_244 (coe v0) (coe v1) (coe v5 v6) (coe v3))
                  (coe
                     C_'8853''7472''45'in_150
                     (\ v7 -> coe du_F'10214'_'10215'_62 (coe v5 v7) (coe v1)) v6))
      C_'8855'e_58 v4 v5
        -> coe
             C__'44''8855'__156 (coe du_F'10214'_'10215'_62 (coe v4) (coe v0))
             (coe du_F'10214'_'10215'_62 (coe v4) (coe v1))
             (coe du_F'10214'_'10215'_62 (coe v5) (coe v0))
             (coe du_F'10214'_'10215'_62 (coe v5) (coe v1))
             (coe du_map_244 (coe v0) (coe v1) (coe v4) (coe v3))
             (coe du_map_244 (coe v0) (coe v1) (coe v5) (coe v3))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Grammars.Base.unroll
d_unroll_280 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> () -> (AgdaAny -> T_Functor_14) -> AgdaAny -> T__'8866'__130
d_unroll_280 ~v0 ~v1 ~v2 v3 = du_unroll_280 v3
du_unroll_280 ::
  (AgdaAny -> T_Functor_14) -> AgdaAny -> T__'8866'__130
du_unroll_280 v0
  = coe
      C_rec_214
      (coe
         (\ v1 ->
            coe du_F'10214'_'10215'_62 (coe v0 v1) (coe C_μ_42 (coe v0))))
      (coe v0)
      (coe
         (\ v1 ->
            coe
              du_map_244
              (coe
                 (\ v2 ->
                    coe du_F'10214'_'10215'_62 (coe v0 v2) (coe C_μ_42 (coe v0))))
              (coe C_μ_42 (coe v0)) (coe v0 v1)
              (coe (\ v2 -> coe C_roll_206 v0 v2))))
-- Cubed.Grammars.Base.nil
d_nil_288 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Lin_10 -> T__'8866'__130
d_nil_288 ~v0 ~v1 v2 = du_nil_288 v2
du_nil_288 :: T_Lin_10 -> T__'8866'__130
du_nil_288 v0
  = coe
      C__'8902'__134 (coe C_ε_16)
      (coe
         C_'8853''7472'_30
         (\ v1 ->
            coe
              du_F'10214'_'10215'_62
              (case coe v1 of
                 C_'96'nil_112 -> coe C_k_46 (coe C_ε_16)
                 C_'96'cons_114
                   -> coe
                        C_'8855'e_58 (coe C_k_46 (coe v0))
                        (coe
                           C_Var_48
                           (coe
                              MAlonzo.Code.Cubed.Level.C_liftℓ_32
                              (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
                 _ -> MAlonzo.RTE.mazUnreachableError)
              (coe C_μ_42 (\ v2 -> coe du_'42''45'functor_116 (coe v0)))))
      (coe du__'42'_122 (coe v0))
      (coe
         C_'8853''7472''45'in_150
         (\ v1 ->
            coe
              du_F'10214'_'10215'_62
              (case coe v1 of
                 C_'96'nil_112 -> coe C_k_46 (coe C_ε_16)
                 C_'96'cons_114
                   -> coe
                        C_'8855'e_58 (coe C_k_46 (coe v0))
                        (coe
                           C_Var_48
                           (coe
                              MAlonzo.Code.Cubed.Level.C_liftℓ_32
                              (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
                 _ -> MAlonzo.RTE.mazUnreachableError)
              (coe C_μ_42 (\ v2 -> coe du_'42''45'functor_116 (coe v0))))
         (coe C_'96'nil_112))
      (coe
         C_roll_206 (\ v1 -> coe du_'42''45'functor_116 (coe v0))
         (coe
            MAlonzo.Code.Cubed.Level.C_liftℓ_32
            (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
-- Cubed.Grammars.Base.cons
d_cons_290 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Lin_10 -> T__'8866'__130
d_cons_290 ~v0 ~v1 v2 = du_cons_290 v2
du_cons_290 :: T_Lin_10 -> T__'8866'__130
du_cons_290 v0
  = coe
      C__'8902'__134
      (coe C__'8855'__32 (coe v0) (coe du__'42'_122 (coe v0)))
      (coe
         C_'8853''7472'_30
         (\ v1 ->
            coe
              du_F'10214'_'10215'_62
              (case coe v1 of
                 C_'96'nil_112 -> coe C_k_46 (coe C_ε_16)
                 C_'96'cons_114
                   -> coe
                        C_'8855'e_58 (coe C_k_46 (coe v0))
                        (coe
                           C_Var_48
                           (coe
                              MAlonzo.Code.Cubed.Level.C_liftℓ_32
                              (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
                 _ -> MAlonzo.RTE.mazUnreachableError)
              (coe C_μ_42 (\ v2 -> coe du_'42''45'functor_116 (coe v0)))))
      (coe du__'42'_122 (coe v0))
      (coe
         C_'8853''7472''45'in_150
         (\ v1 ->
            coe
              du_F'10214'_'10215'_62
              (case coe v1 of
                 C_'96'nil_112 -> coe C_k_46 (coe C_ε_16)
                 C_'96'cons_114
                   -> coe
                        C_'8855'e_58 (coe C_k_46 (coe v0))
                        (coe
                           C_Var_48
                           (coe
                              MAlonzo.Code.Cubed.Level.C_liftℓ_32
                              (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
                 _ -> MAlonzo.RTE.mazUnreachableError)
              (coe C_μ_42 (\ v2 -> coe du_'42''45'functor_116 (coe v0))))
         (coe C_'96'cons_114))
      (coe
         C_roll_206 (\ v1 -> coe du_'42''45'functor_116 (coe v0))
         (coe
            MAlonzo.Code.Cubed.Level.C_liftℓ_32
            (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
-- Cubed.Grammars.Base.char-in
d_char'45'in_294 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> AgdaAny -> T__'8866'__130
d_char'45'in_294 ~v0 ~v1 v2 = du_char'45'in_294 v2
du_char'45'in_294 :: AgdaAny -> T__'8866'__130
du_char'45'in_294 v0
  = coe C_'8853''7472''45'in_150 (coe C_Lit_22) v0
-- Cubed.Grammars.Base.string-in
d_string'45'in_298 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Lin_10 -> T__'8866'__130
d_string'45'in_298 ~v0 ~v1 v2 = du_string'45'in_298 v2
du_string'45'in_298 :: T_Lin_10 -> T__'8866'__130
du_string'45'in_298 v0
  = coe
      C__'8902'__134 (coe v0) (coe C_'8868'_18) (coe du_String_128)
      (coe C_'8868''45'in_136 (coe v0)) (coe C_read_216)
