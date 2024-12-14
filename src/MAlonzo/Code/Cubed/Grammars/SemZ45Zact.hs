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

module MAlonzo.Code.Cubed.Grammars.SemZ45Zact where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Data.Sum.Base
import qualified MAlonzo.Code.Cubed.Grammars.Base
import qualified MAlonzo.Code.Cubed.Grammars.Sum
import qualified MAlonzo.Code.Cubed.Level

-- Cubed.Grammars.Sem-act._._*
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
-- Cubed.Grammars.Sem-act._._⊢_
d__'8866'__18 a0 a1 a2 a3 = ()
-- Cubed.Grammars.Sem-act._.Char
d_Char_38 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_Char_38 ~v0 ~v1 = du_Char_38
du_Char_38 :: MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
du_Char_38 = coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126
-- Cubed.Grammars.Sem-act._.Functor
d_Functor_40 a0 a1 a2 = ()
-- Cubed.Grammars.Sem-act._.F⟦_⟧
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
-- Cubed.Grammars.Sem-act._.Lin
d_Lin_44 a0 a1 = ()
-- Cubed.Grammars.Sem-act._.String
d_String_48 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_String_48 ~v0 ~v1 = du_String_48
du_String_48 :: MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
du_String_48 = coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128
-- Cubed.Grammars.Sem-act.⊕._⊕_
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
-- Cubed.Grammars.Sem-act.Δ
d_Δ_302 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> () -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_Δ_302 ~v0 ~v1 ~v2 = du_Δ_302
du_Δ_302 :: MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
du_Δ_302
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
      (\ v0 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18)
-- Cubed.Grammars.Sem-act.Δ-in
d_Δ'45'in_306 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_Δ'45'in_306 ~v0 ~v1 ~v2 v3 = du_Δ'45'in_306 v3
du_Δ'45'in_306 ::
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_Δ'45'in_306 v0
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'elim_154 v0
      (coe du_Δ_302)
      (\ v1 ->
         coe
           MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134 (coe v0 v1)
           (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18) (coe du_Δ_302)
           (coe
              MAlonzo.Code.Cubed.Grammars.Base.C_'8868''45'in_136 (coe v0 v1))
           (coe
              MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'in_150
              (\ v2 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18) v1))
-- Cubed.Grammars.Sem-act.Δ-⊗⊤-r
d_Δ'45''8855''8868''45'r_310 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> () -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_Δ'45''8855''8868''45'r_310 ~v0 ~v1 ~v2
  = du_Δ'45''8855''8868''45'r_310
du_Δ'45''8855''8868''45'r_310 ::
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_Δ'45''8855''8868''45'r_310
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18) (coe du_Δ_302))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
         (\ v0 ->
            coe
              MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
              (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18)
              (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18)))
      (coe du_Δ_302)
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'dist'45'r_186
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18)
         (\ v0 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.du_'8853''7472''45'map'45'g_226
         (coe
            (\ v0 ->
               coe
                 MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                 (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18)
                 (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18)))
         (coe (\ v0 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18))
         (coe
            (\ v0 ->
               coe
                 MAlonzo.Code.Cubed.Grammars.Base.C_'8868''45'in_136
                 (coe
                    MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                    (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18)
                    (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18)))))
-- Cubed.Grammars.Sem-act.Sem-act
d_Sem'45'act_312 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 -> () -> ()
d_Sem'45'act_312 = erased
-- Cubed.Grammars.Sem-act.pure
d_pure_318 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_pure_318 ~v0 ~v1 ~v2 v3 v4 = du_pure_318 v3 v4
du_pure_318 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_pure_318 v0 v1
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134 (coe v0)
      (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18) (coe du_Δ_302)
      (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868''45'in_136 (coe v0))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'in_150
         (\ v2 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18) v1)
-- Cubed.Grammars.Sem-act.bind
d_bind_322 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_bind_322 ~v0 ~v1 v2 ~v3 v4 ~v5 v6 v7 = du_bind_322 v2 v4 v6 v7
du_bind_322 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_bind_322 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0) (coe v1))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe du_Δ_302)
         (coe v1))
      (coe du_Δ_302)
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'44''8855'__156 (coe v0)
         (coe du_Δ_302) (coe v1) (coe v1) (coe v2)
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_id_132 (coe v1)))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe du_Δ_302)
            (coe v1))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
            (\ v4 ->
               coe
                 MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                 (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18) (coe v1)))
         (coe du_Δ_302)
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'dist'45'l_174
            (\ v4 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18) v1)
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'elim_154
            (\ v4 ->
               coe
                 MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                 (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18) (coe v1))
            (coe du_Δ_302)
            (\ v4 ->
               coe
                 MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
                 (coe
                    MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                    (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18) (coe v1))
                 (coe
                    MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                    (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18) (coe du_Δ_302))
                 (coe du_Δ_302)
                 (coe
                    MAlonzo.Code.Cubed.Grammars.Base.C__'44''8855'__156
                    (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18)
                    (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18) (coe v1)
                    (coe du_Δ_302)
                    (coe
                       MAlonzo.Code.Cubed.Grammars.Base.C_id_132
                       (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18))
                    (coe v3 v4))
                 (coe du_Δ'45''8855''8868''45'r_310))))
-- Cubed.Grammars.Sem-act.map-g
d_map'45'g_330 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_map'45'g_330 ~v0 ~v1 v2 v3 ~v4 v5 v6
  = du_map'45'g_330 v2 v3 v5 v6
du_map'45'g_330 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_map'45'g_330 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134 (coe v0) (coe v1)
      (coe du_Δ_302) (coe v2) (coe v3)
-- Cubed.Grammars.Sem-act.map
d_map_336 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  (AgdaAny -> AgdaAny) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_map_336 ~v0 ~v1 ~v2 ~v3 v4 v5 v6 = du_map_336 v4 v5 v6
du_map_336 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  (AgdaAny -> AgdaAny) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_map_336 v0 v1 v2
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134 (coe v0)
      (coe du_Δ_302) (coe du_Δ_302) (coe v2)
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.du_'8853''7472''45'map_218
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8868'_18) (coe v1))
-- Cubed.Grammars.Sem-act.semact-Δ
d_semact'45'Δ_342 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> () -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45'Δ_342 ~v0 ~v1 ~v2 = du_semact'45'Δ_342
du_semact'45'Δ_342 ::
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_semact'45'Δ_342
  = coe MAlonzo.Code.Cubed.Grammars.Base.C_id_132 (coe du_Δ_302)
-- Cubed.Grammars.Sem-act.semact-⊤
d_semact'45''8868'_344 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45''8868'_344 ~v0 ~v1 v2 = du_semact'45''8868'_344 v2
du_semact'45''8868'_344 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_semact'45''8868'_344 v0
  = coe
      du_pure_318 (coe v0)
      (coe
         MAlonzo.Code.Cubed.Level.C_liftℓ_32
         (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
-- Cubed.Grammars.Sem-act.semact-⊥
d_semact'45''8869'_346 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> () -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45''8869'_346 ~v0 ~v1 ~v2 = du_semact'45''8869'_346
du_semact'45''8869'_346 ::
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_semact'45''8869'_346
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C_'8869''45'elim_138
      (coe du_Δ_302)
-- Cubed.Grammars.Sem-act.semact-&ᴰ
d_semact'45''38''7472'_350 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10) ->
  () ->
  AgdaAny ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45''38''7472'_350 ~v0 ~v1 ~v2 v3 ~v4 v5 v6
  = du_semact'45''38''7472'_350 v3 v5 v6
du_semact'45''38''7472'_350 ::
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10) ->
  AgdaAny ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_semact'45''38''7472'_350 v0 v1 v2
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C__'8902'__134
      (coe MAlonzo.Code.Cubed.Grammars.Base.C_'38''7472'_26 v0)
      (coe v0 v1) (coe du_Δ_302)
      (coe MAlonzo.Code.Cubed.Grammars.Base.C_'38''7472''45'π_146 v0 v1)
      (coe v2)
-- Cubed.Grammars.Sem-act.semact-⊕ᴰ
d_semact'45''8853''7472'_358 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10) ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45''8853''7472'_358 ~v0 ~v1 ~v2 v3 ~v4 v5
  = du_semact'45''8853''7472'_358 v3 v5
du_semact'45''8853''7472'_358 ::
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10) ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_semact'45''8853''7472'_358 v0 v1
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'elim_154 v0
      (coe du_Δ_302)
      (\ v2 ->
         coe
           du_map_336 (coe v0 v2)
           (coe
              (\ v3 ->
                 coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v2) (coe v3)))
           (coe v1 v2))
-- Cubed.Grammars.Sem-act.semact-⊕ᴰ'
d_semact'45''8853''7472'''_368 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10) ->
  () ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45''8853''7472'''_368 ~v0 ~v1 ~v2 v3 ~v4 v5
  = du_semact'45''8853''7472'''_368 v3 v5
du_semact'45''8853''7472'''_368 ::
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10) ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_semact'45''8853''7472'''_368 v0 v1
  = coe
      du_map_336
      (coe MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30 v0)
      (coe (\ v2 -> MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe v2)))
      (coe du_semact'45''8853''7472'_358 (coe v0) (coe v1))
-- Cubed.Grammars.Sem-act.semact-⊗
d_semact'45''8855'_372 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45''8855'_372 ~v0 ~v1 v2 ~v3 v4 ~v5 v6 v7
  = du_semact'45''8855'_372 v2 v4 v6 v7
du_semact'45''8855'_372 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_semact'45''8855'_372 v0 v1 v2 v3
  = coe
      du_bind_322 (coe v0) (coe v1) (coe v2)
      (coe
         (\ v4 ->
            coe
              du_map_336 (coe v1)
              (coe
                 (\ v5 ->
                    coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v4) (coe v5)))
              (coe v3)))
-- Cubed.Grammars.Sem-act.semact-left
d_semact'45'left_382 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45'left_382 ~v0 ~v1 v2 ~v3 v4 v5
  = du_semact'45'left_382 v2 v4 v5
du_semact'45'left_382 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_semact'45'left_382 v0 v1 v2
  = coe
      du_map_336
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0) (coe v1))
      (coe (\ v3 -> MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe v3)))
      (coe
         du_semact'45''8855'_372 (coe v0) (coe v1) (coe v2)
         (coe du_semact'45''8868'_344 (coe v1)))
-- Cubed.Grammars.Sem-act.semact-right
d_semact'45'right_386 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45'right_386 ~v0 ~v1 v2 ~v3 v4 v5
  = du_semact'45'right_386 v2 v4 v5
du_semact'45'right_386 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_semact'45'right_386 v0 v1 v2
  = coe
      du_map_336
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v1) (coe v0))
      (coe (\ v3 -> MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe v3)))
      (coe
         du_semact'45''8855'_372 (coe v1) (coe v0)
         (coe du_semact'45''8868'_344 (coe v1)) (coe v2))
-- Cubed.Grammars.Sem-act.semact-⊕
d_semact'45''8853'_390 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45''8853'_390 ~v0 ~v1 v2 ~v3 v4
  = du_semact'45''8853'_390 v2 v4
du_semact'45''8853'_390 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_semact'45''8853'_390 v0 v1
  = coe
      MAlonzo.Code.Cubed.Grammars.Sum.du_elim_252 (coe v0) (coe du_Δ_302)
      (coe v1)
-- Cubed.Grammars.Sem-act.semact-disjunct
d_semact'45'disjunct_392 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45'disjunct_392 ~v0 ~v1 v2 ~v3 v4 ~v5 v6 v7
  = du_semact'45'disjunct_392 v2 v4 v6 v7
du_semact'45'disjunct_392 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_semact'45'disjunct_392 v0 v1 v2 v3
  = coe
      du_semact'45''8853'_390 v0 v1
      (coe
         du_map_336 (coe v0) (coe MAlonzo.Code.Cubed.Data.Sum.Base.C_inl_30)
         (coe v2))
      (coe
         du_map_336 (coe v1) (coe MAlonzo.Code.Cubed.Data.Sum.Base.C_inr_32)
         (coe v3))
-- Cubed.Grammars.Sem-act.semact-rec
d_semact'45'rec_404 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  () ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Functor_14) ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130) ->
  AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45'rec_404 ~v0 ~v1 ~v2 ~v3 v4 = du_semact'45'rec_404 v4
du_semact'45'rec_404 ::
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Functor_14) ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130) ->
  AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_semact'45'rec_404 v0
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.C_rec_214
      (coe (\ v1 -> coe du_Δ_302)) (coe v0)
-- Cubed.Grammars.Sem-act.semact-char
d_semact'45'char_406 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45'char_406 ~v0 ~v1 = du_semact'45'char_406
du_semact'45'char_406 ::
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_semact'45'char_406
  = coe
      du_semact'45''8853''7472'''_368
      (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22)
      (coe
         (\ v0 ->
            coe
              du_pure_318
              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v0)) (coe v0)))
-- Cubed.Grammars.Sem-act.semact-*
d_semact'45''42'_410 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45''42'_410 ~v0 ~v1 v2 ~v3 v4
  = du_semact'45''42'_410 v2 v4
du_semact'45''42'_410 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_semact'45''42'_410 v0 v1
  = coe
      du_semact'45'rec_404
      (\ v2 ->
         coe
           MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116 (coe v0))
      (\ v2 ->
         coe
           MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472''45'elim_154
           (\ v3 ->
              coe
                MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                (case coe v3 of
                   MAlonzo.Code.Cubed.Grammars.Base.C_'96'nil_112
                     -> coe
                          MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                          (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16)
                   MAlonzo.Code.Cubed.Grammars.Base.C_'96'cons_114
                     -> coe
                          MAlonzo.Code.Cubed.Grammars.Base.C_'8855'e_58
                          (coe MAlonzo.Code.Cubed.Grammars.Base.C_k_46 (coe v0))
                          (coe
                             MAlonzo.Code.Cubed.Grammars.Base.C_Var_48
                             (coe
                                MAlonzo.Code.Cubed.Level.C_liftℓ_32
                                (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
                   _ -> MAlonzo.RTE.mazUnreachableError)
                (coe (\ v4 -> coe du_Δ_302)))
           (coe du_Δ_302)
           (\ v3 ->
              case coe v3 of
                MAlonzo.Code.Cubed.Grammars.Base.C_'96'nil_112
                  -> coe
                       du_pure_318
                       (coe
                          MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62
                          (coe
                             MAlonzo.Code.Cubed.Grammars.Base.C_k_46
                             (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
                          (coe (\ v4 -> coe du_Δ_302)))
                       (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
                MAlonzo.Code.Cubed.Grammars.Base.C_'96'cons_114
                  -> coe
                       du_map_336
                       (coe
                          MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0)
                          (coe du_Δ_302))
                       (coe
                          (\ v4 ->
                             case coe v4 of
                               MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v5 v6
                                 -> coe
                                      MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v5) (coe v6)
                               _ -> MAlonzo.RTE.mazUnreachableError))
                       (coe
                          du_semact'45''8855'_372 (coe v0) (coe du_Δ_302) (coe v1)
                          (coe du_semact'45'Δ_342))
                _ -> MAlonzo.RTE.mazUnreachableError))
      (coe
         MAlonzo.Code.Cubed.Level.C_liftℓ_32
         (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
-- Cubed.Grammars.Sem-act.semact-string
d_semact'45'string_418 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45'string_418 ~v0 ~v1 = du_semact'45'string_418
du_semact'45'string_418 ::
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_semact'45'string_418
  = coe
      du_semact'45''42'_410
      (coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126)
      (coe du_semact'45'char_406)
-- Cubed.Grammars.Sem-act.semact-underlying
d_semact'45'underlying_420 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45'underlying_420 ~v0 ~v1 v2
  = du_semact'45'underlying_420 v2
du_semact'45'underlying_420 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_semact'45'underlying_420 v0
  = coe
      du_map'45'g_330 (coe v0)
      (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
      (coe MAlonzo.Code.Cubed.Grammars.Base.du_string'45'in_298 (coe v0))
      (coe du_semact'45'string_418)
-- Cubed.Grammars.Sem-act.semact-surround
d_semact'45'surround_422 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45'surround_422 ~v0 ~v1 v2 ~v3 v4 v5 v6
  = du_semact'45'surround_422 v2 v4 v5 v6
du_semact'45'surround_422 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
du_semact'45'surround_422 v0 v1 v2 v3
  = coe
      du_semact'45'right_386
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32 (coe v0) (coe v2))
      (coe v1) (coe du_semact'45'left_382 (coe v0) (coe v2) (coe v3))
