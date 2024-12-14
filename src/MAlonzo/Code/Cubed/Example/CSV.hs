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

module MAlonzo.Code.Cubed.Example.CSV where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Agda.Builtin.Char
import qualified MAlonzo.Code.Agda.Builtin.IO
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.String
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive.Cubical
import qualified MAlonzo.Code.Cubed.Data.Bool.Properties
import qualified MAlonzo.Code.Cubed.Data.Char.Base
import qualified MAlonzo.Code.Cubed.Data.Dec.Base
import qualified MAlonzo.Code.Cubed.Data.List.Base
import qualified MAlonzo.Code.Cubed.Data.Maybe.Base
import qualified MAlonzo.Code.Cubed.Data.String.Base
import qualified MAlonzo.Code.Cubed.Effect.Monad
import qualified MAlonzo.Code.Cubed.Grammars.Base
import qualified MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator
import qualified MAlonzo.Code.Cubed.Grammars.SemZ45Zact
import qualified MAlonzo.Code.Cubed.Grammars.Semantics
import qualified MAlonzo.Code.Cubed.Grammars.Sum
import qualified MAlonzo.Code.Cubed.IO.Base
import qualified MAlonzo.Code.Cubed.IO.Effectful
import qualified MAlonzo.Code.Cubed.Level

-- _._*
d__'42'_8 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d__'42'_8 = coe MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
-- _._⊢_
d__'8866'__14 a0 a1 = ()
-- _.*-functor
d_'42''45'functor_30 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Level.T_Lift_20 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Functor_14
d_'42''45'functor_30 v0 v1
  = coe MAlonzo.Code.Cubed.Grammars.Base.du_'42''45'functor_116 v0
-- _.*-tag
d_'42''45'tag_32 = ()
-- _.Char
d_Char_34 :: MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_Char_34 = coe MAlonzo.Code.Cubed.Grammars.Base.du_Char_126
-- _.Functor
d_Functor_36 a0 = ()
-- _.F⟦_⟧
d_F'10214'_'10215'_38 ::
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Functor_14 ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10) ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_F'10214'_'10215'_38 v0 v1 v2
  = coe MAlonzo.Code.Cubed.Grammars.Base.du_F'10214'_'10215'_62 v1 v2
-- _.Lin
d_Lin_40 = ()
-- _.String
d_String_44 :: MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_String_44 = coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128
-- _.char-in
d_char'45'in_52 ::
  MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_char'45'in_52
  = coe MAlonzo.Code.Cubed.Grammars.Base.du_char'45'in_294
-- _.cons
d_cons_54 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_cons_54 = coe MAlonzo.Code.Cubed.Grammars.Base.du_cons_290
-- _.nil
d_nil_60 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_nil_60 = coe MAlonzo.Code.Cubed.Grammars.Base.du_nil_288
-- _.string-in
d_string'45'in_68 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_string'45'in_68
  = coe MAlonzo.Code.Cubed.Grammars.Base.du_string'45'in_298
-- _.unroll
d_unroll_70 ::
  () ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Functor_14) ->
  AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_unroll_70 v0 v1
  = coe MAlonzo.Code.Cubed.Grammars.Base.du_unroll_280 v1
-- _.⊕ᴰ-map
d_'8853''7472''45'map_92 ::
  () ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  (AgdaAny -> AgdaAny) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_'8853''7472''45'map_92 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.du_'8853''7472''45'map_218 v2 v3
-- _.⊕ᴰ-map-g
d_'8853''7472''45'map'45'g_94 ::
  () ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10) ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10) ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_'8853''7472''45'map'45'g_94 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Cubed.Grammars.Base.du_'8853''7472''45'map'45'g_226 v1
      v2 v3
-- _.⊸-in⁻
d_'8888''45'in'8315'_122 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_'8888''45'in'8315'_122
  = coe MAlonzo.Code.Cubed.Grammars.Base.du_'8888''45'in'8315'_232
-- _.⟜-in⁻
d_'10204''45'in'8315'_128 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_'10204''45'in'8315'_128
  = coe MAlonzo.Code.Cubed.Grammars.Base.du_'10204''45'in'8315'_236
-- _._⊕_
d__'8853'__226 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d__'8853'__226
  = coe MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
-- _.Tag
d_Tag_228 = ()
-- _.bimap
d_bimap_234 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_bimap_234 = coe MAlonzo.Code.Cubed.Grammars.Sum.du_bimap_260
-- _.bind-l
d_bind'45'l_236 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_bind'45'l_236
  = coe MAlonzo.Code.Cubed.Grammars.Sum.du_bind'45'l_274
-- _.bind-r
d_bind'45'r_238 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_bind'45'r_238
  = coe MAlonzo.Code.Cubed.Grammars.Sum.du_bind'45'r_278
-- _.elim
d_elim_240 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_elim_240 = coe MAlonzo.Code.Cubed.Grammars.Sum.du_elim_252
-- _.map-l
d_map'45'l_242 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_map'45'l_242
  = coe MAlonzo.Code.Cubed.Grammars.Sum.du_map'45'l_266
-- _.map-r
d_map'45'r_244 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_map'45'r_244
  = coe MAlonzo.Code.Cubed.Grammars.Sum.du_map'45'r_270
-- Parser._<|>_
d__'60''124''62'__254 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d__'60''124''62'__254
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du__'60''124''62'__340
-- Parser._<⊕>_
d__'60''8853''62'__256 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d__'60''8853''62'__256
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du__'60''8853''62'__346
-- Parser._<⊗>_
d__'60''8855''62'__258 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d__'60''8855''62'__258
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du__'60''8855''62'__336
-- Parser.Finished-weak-parser
d_Finished'45'weak'45'parser_260 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 -> ()
d_Finished'45'weak'45'parser_260 = erased
-- Parser.None-of
d_None'45'of_262 ::
  (MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
   MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
   MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6] ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_None'45'of_262 v0 v1
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418
-- Parser.One-of
d_One'45'of_264 ::
  (MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
   MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
   MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6] ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_One'45'of_264 v0 v1
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_One'45'of_402
-- Parser.Weak-parser
d_Weak'45'parser_266 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 -> ()
d_Weak'45'parser_266 = erased
-- Parser.any-char
d_any'45'char_268 ::
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_any'45'char_268
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_any'45'char_358
-- Parser.char
d_char_270 ::
  (MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
   MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
   MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_char_270
  = coe MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_char_390
-- Parser.concat
d_concat_272 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_concat_272
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_concat_330
-- Parser.fail
d_fail_274 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_fail_274
  = coe MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_fail_338
-- Parser.finish
d_finish_276 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_finish_276
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_finish_310
-- Parser.grammar-of
d_grammar'45'of_278 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_grammar'45'of_278 v0 ~v1 = du_grammar'45'of_278 v0
du_grammar'45'of_278 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
du_grammar'45'of_278 v0 = coe v0
-- Parser.many
d_many_280 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_many_280
  = coe MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_many_352
-- Parser.map
d_map_282 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_map_282
  = coe MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_map_318
-- Parser.map-maybe
d_map'45'maybe_284 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_map'45'maybe_284
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_map'45'maybe_324
-- Parser.none-of
d_none'45'of_286 ::
  (MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
   MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
   MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6] ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_none'45'of_286
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_none'45'of_428
      (coe ())
-- Parser.one-of
d_one'45'of_288 ::
  (MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
   MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
   MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6] ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_one'45'of_288
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_one'45'of_412
      (coe ())
-- Parser.pure
d_pure_290 :: MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_pure_290
  = coe MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_pure_316
-- Parser.rest
d_rest_292 :: MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_rest_292
  = coe MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_rest_356
-- Parser.satisfy
d_satisfy_294 ::
  (MAlonzo.Code.Agda.Builtin.Char.T_Char_6 -> ()) ->
  (MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
   MAlonzo.Code.Cubed.Data.Dec.Base.T_Dec_18) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_satisfy_294 v0 v1
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_satisfy_372 v1
-- Sem-act.Sem-act
d_Sem'45'act_298 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 -> () -> ()
d_Sem'45'act_298 = erased
-- Sem-act.bind
d_bind_300 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_bind_300 v0 v1 v2 v3 v4 v5
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_bind_322 v0 v2 v4 v5
-- Sem-act.map
d_map_302 ::
  () ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  (AgdaAny -> AgdaAny) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_map_302 v0 v1 v2 v3 v4
  = coe MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_map_336 v2 v3 v4
-- Sem-act.map-g
d_map'45'g_304 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_map'45'g_304 v0 v1 v2 v3 v4
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_map'45'g_330 v0 v1 v3 v4
-- Sem-act.pure
d_pure_306 ::
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_pure_306 v0 v1 v2
  = coe MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_pure_318 v1 v2
-- Sem-act.semact-&ᴰ
d_semact'45''38''7472'_308 ::
  () ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10) ->
  () ->
  AgdaAny ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45''38''7472'_308 v0 v1 v2 v3 v4
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45''38''7472'_350
      v1 v3 v4
-- Sem-act.semact-*
d_semact'45''42'_310 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45''42'_310 v0 v1 v2
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45''42'_410 v0 v2
-- Sem-act.semact-char
d_semact'45'char_312 ::
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45'char_312
  = coe MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45'char_406
-- Sem-act.semact-disjunct
d_semact'45'disjunct_314 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45'disjunct_314 v0 v1 v2 v3 v4 v5
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45'disjunct_392 v0
      v2 v4 v5
-- Sem-act.semact-left
d_semact'45'left_316 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45'left_316 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45'left_382 v0 v2
      v3
-- Sem-act.semact-rec
d_semact'45'rec_318 ::
  () ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Functor_14) ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130) ->
  AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45'rec_318 v0 v1 v2
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45'rec_404 v2
-- Sem-act.semact-right
d_semact'45'right_320 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45'right_320 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45'right_386 v0 v2
      v3
-- Sem-act.semact-string
d_semact'45'string_322 ::
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45'string_322
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45'string_418
-- Sem-act.semact-surround
d_semact'45'surround_324 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45'surround_324 v0 v1 v2 v3 v4
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45'surround_422 v0
      v2 v3 v4
-- Sem-act.semact-underlying
d_semact'45'underlying_326 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45'underlying_326
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45'underlying_420
-- Sem-act.semact-Δ
d_semact'45'Δ_328 ::
  () -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45'Δ_328 v0
  = coe MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45'Δ_342
-- Sem-act.semact-⊕
d_semact'45''8853'_330 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45''8853'_330 v0 v1 v2
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45''8853'_390 v0
      v2
-- Sem-act.semact-⊕ᴰ
d_semact'45''8853''7472'_332 ::
  () ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10) ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45''8853''7472'_332 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45''8853''7472'_358
      v1 v3
-- Sem-act.semact-⊕ᴰ'
d_semact'45''8853''7472'''_334 ::
  () ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10) ->
  () ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45''8853''7472'''_334 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45''8853''7472'''_368
      v1 v3
-- Sem-act.semact-⊗
d_semact'45''8855'_336 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45''8855'_336 v0 v1 v2 v3 v4 v5
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45''8855'_372 v0
      v2 v4 v5
-- Sem-act.semact-⊤
d_semact'45''8868'_338 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45''8868'_338
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45''8868'_344
-- Sem-act.semact-⊥
d_semact'45''8869'_340 ::
  () -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_semact'45''8869'_340 v0
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45''8869'_346
-- Sem-act.Δ
d_Δ_342 :: () -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10
d_Δ_342 v0 = coe MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_Δ_302
-- Sem-act.Δ-in
d_Δ'45'in_344 ::
  () ->
  (AgdaAny -> MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10) ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_Δ'45'in_344 v0 v1
  = coe MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_Δ'45'in_306 v1
-- Sem-act.Δ-⊗⊤-r
d_Δ'45''8855''8868''45'r_346 ::
  () -> MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_Δ'45''8855''8868''45'r_346 v0
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_Δ'45''8855''8868''45'r_310
-- _.Grammar
d_Grammar_350 :: ()
d_Grammar_350 = erased
-- _.G⟦_⟧
d_G'10214'_'10215'_352 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6] -> ()
d_G'10214'_'10215'_352 = erased
-- _.Parser
d_Parser_354 ::
  ([MAlonzo.Code.Agda.Builtin.Char.T_Char_6] -> ()) ->
  ([MAlonzo.Code.Agda.Builtin.Char.T_Char_6] -> ()) -> ()
d_Parser_354 = erased
-- _.Split
d_Split_356 a0 = ()
-- _.internalize
d_internalize_358 ::
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6] ->
  MAlonzo.Code.Cubed.Grammars.Semantics.T_μ''_402
d_internalize_358
  = coe MAlonzo.Code.Cubed.Grammars.Semantics.du_internalize_476
-- _.run-parser
d_run'45'parser_364 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6] -> AgdaAny
d_run'45'parser_364 v0 v1 v2
  = coe
      MAlonzo.Code.Cubed.Grammars.Semantics.du_run'45'parser_736 (coe ())
      v1 v2
-- _.run-weak-parser
d_run'45'weak'45'parser_366 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6] -> Maybe AgdaAny
d_run'45'weak'45'parser_366
  = coe
      MAlonzo.Code.Cubed.Grammars.Semantics.du_run'45'weak'45'parser_744
      (coe ())
-- _.run-weak-parser-partial
d_run'45'weak'45'parser'45'partial_368 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6] ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_run'45'weak'45'parser'45'partial_368 v0 v1 v2
  = coe
      MAlonzo.Code.Cubed.Grammars.Semantics.du_run'45'weak'45'parser'45'partial_756
      (coe ()) v1 v2
-- _.run-weak-parser-Δ
d_run'45'weak'45'parser'45'Δ_370 ::
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6] -> Maybe AgdaAny
d_run'45'weak'45'parser'45'Δ_370 v0 v1 v2
  = coe
      MAlonzo.Code.Cubed.Grammars.Semantics.du_run'45'weak'45'parser'45'Δ_772
      (coe ()) v1 v2
-- _.run-weak-parser-Δ-partial
d_run'45'weak'45'parser'45'Δ'45'partial_372 ::
  () ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6] ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_run'45'weak'45'parser'45'Δ'45'partial_372 v0 v1 v2
  = coe
      MAlonzo.Code.Cubed.Grammars.Semantics.du_run'45'weak'45'parser'45'Δ'45'partial_778
      (coe ()) v1 v2
-- _.split-++
d_split'45''43''43'_374 ::
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6] ->
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6] ->
  MAlonzo.Code.Cubed.Grammars.Semantics.T_Split_338
d_split'45''43''43'_374
  = coe
      MAlonzo.Code.Cubed.Grammars.Semantics.du_split'45''43''43'_380
-- _.split-left
d_split'45'left_376 ::
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6] ->
  MAlonzo.Code.Cubed.Grammars.Semantics.T_Split_338
d_split'45'left_376
  = coe MAlonzo.Code.Cubed.Grammars.Semantics.du_split'45'left_368
-- _.split-right
d_split'45'right_378 ::
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6] ->
  MAlonzo.Code.Cubed.Grammars.Semantics.T_Split_338
d_split'45'right_378
  = coe MAlonzo.Code.Cubed.Grammars.Semantics.du_split'45'right_358
-- _.t⟦_⟧
d_t'10214'_'10215'_380 ::
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T_Lin_10 ->
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130 ->
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6] -> AgdaAny -> AgdaAny
d_t'10214'_'10215'_380 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Cubed.Grammars.Semantics.du_t'10214'_'10215'_488
      (coe ()) v2 v3
-- _.μ'
d_μ''_382 a0 a1 a2 a3 = ()
-- _.Split.is-split
d_is'45'split_386 ::
  MAlonzo.Code.Cubed.Grammars.Semantics.T_Split_338 ->
  MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 ->
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6]
d_is'45'split_386 v0
  = coe
      MAlonzo.Code.Cubed.Grammars.Semantics.d_is'45'split_352 (coe v0)
-- _.Split.left
d_left_388 ::
  MAlonzo.Code.Cubed.Grammars.Semantics.T_Split_338 ->
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6]
d_left_388 v0
  = coe MAlonzo.Code.Cubed.Grammars.Semantics.d_left_348 (coe v0)
-- _.Split.right
d_right_390 ::
  MAlonzo.Code.Cubed.Grammars.Semantics.T_Split_338 ->
  [MAlonzo.Code.Agda.Builtin.Char.T_Char_6]
d_right_390 v0
  = coe MAlonzo.Code.Cubed.Grammars.Semantics.d_right_350 (coe v0)
-- Cubed.Example.CSV.Concrete.quoted-lit
d_quoted'45'lit_398 ::
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_quoted'45'lit_398
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du__'60''8853''62'__346
      (coe
         MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))
      (coe
         MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_none'45'of_428
         (coe ())
         (coe
            (\ v0 v1 ->
               coe
                 MAlonzo.Code.Cubed.Data.Dec.Base.du_map_60 (coe (\ v2 v3 -> v0))
                 (coe
                    MAlonzo.Code.Cubed.Data.Dec.Base.du__'8799'__78
                    (coe MAlonzo.Code.Cubed.Data.Char.Base.d__'8801''7495'__8 v0 v1)
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10)
                    (coe
                       MAlonzo.Code.Cubed.Data.Bool.Properties.d_is'45'discrete_12))))
         (coe
            MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe '"')
            (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)))
      (coe
         MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du__'60''8855''62'__336
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
         (coe
            MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_char_390
            (coe
               (\ v0 v1 ->
                  coe
                    MAlonzo.Code.Cubed.Data.Dec.Base.du_map_60 (coe (\ v2 v3 -> v0))
                    (coe
                       MAlonzo.Code.Cubed.Data.Dec.Base.du__'8799'__78
                       (coe MAlonzo.Code.Cubed.Data.Char.Base.d__'8801''7495'__8 v0 v1)
                       (coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10)
                       (coe
                          MAlonzo.Code.Cubed.Data.Bool.Properties.d_is'45'discrete_12))))
            (coe '"'))
         (coe
            MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_char_390
            (coe
               (\ v0 v1 ->
                  coe
                    MAlonzo.Code.Cubed.Data.Dec.Base.du_map_60 (coe (\ v2 v3 -> v0))
                    (coe
                       MAlonzo.Code.Cubed.Data.Dec.Base.du__'8799'__78
                       (coe MAlonzo.Code.Cubed.Data.Char.Base.d__'8801''7495'__8 v0 v1)
                       (coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10)
                       (coe
                          MAlonzo.Code.Cubed.Data.Bool.Properties.d_is'45'discrete_12))))
            (coe '"')))
-- Cubed.Example.CSV.Concrete.quoted-field
d_quoted'45'field_400 ::
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_quoted'45'field_400
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du__'60''8855''62'__336
      (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
            (coe
               MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
               (coe
                  MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))
      (coe
         MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_char_390
         (coe
            (\ v0 v1 ->
               coe
                 MAlonzo.Code.Cubed.Data.Dec.Base.du_map_60 (coe (\ v2 v3 -> v0))
                 (coe
                    MAlonzo.Code.Cubed.Data.Dec.Base.du__'8799'__78
                    (coe MAlonzo.Code.Cubed.Data.Char.Base.d__'8801''7495'__8 v0 v1)
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10)
                    (coe
                       MAlonzo.Code.Cubed.Data.Bool.Properties.d_is'45'discrete_12))))
         (coe '"'))
      (coe
         MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du__'60''8855''62'__336
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
            (coe
               MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
               (coe
                  MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
         (coe
            MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_many_352
            (coe
               MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
               (coe
                  MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))))
            (coe d_quoted'45'lit_398))
         (coe
            MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_char_390
            (coe
               (\ v0 v1 ->
                  coe
                    MAlonzo.Code.Cubed.Data.Dec.Base.du_map_60 (coe (\ v2 v3 -> v0))
                    (coe
                       MAlonzo.Code.Cubed.Data.Dec.Base.du__'8799'__78
                       (coe MAlonzo.Code.Cubed.Data.Char.Base.d__'8801''7495'__8 v0 v1)
                       (coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10)
                       (coe
                          MAlonzo.Code.Cubed.Data.Bool.Properties.d_is'45'discrete_12))))
            (coe '"')))
-- Cubed.Example.CSV.Concrete.unquoted-lit
d_unquoted'45'lit_402 ::
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_unquoted'45'lit_402
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_none'45'of_428
      (coe ())
      (coe
         (\ v0 v1 ->
            coe
              MAlonzo.Code.Cubed.Data.Dec.Base.du_map_60 (coe (\ v2 v3 -> v0))
              (coe
                 MAlonzo.Code.Cubed.Data.Dec.Base.du__'8799'__78
                 (coe MAlonzo.Code.Cubed.Data.Char.Base.d__'8801''7495'__8 v0 v1)
                 (coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10)
                 (coe
                    MAlonzo.Code.Cubed.Data.Bool.Properties.d_is'45'discrete_12))))
      (coe
         MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe '\n')
         (coe
            MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe '"')
            (coe
               MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe ',')
               (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16))))
-- Cubed.Example.CSV.Concrete.unquoted-field
d_unquoted'45'field_404 ::
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_unquoted'45'field_404
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_many_352
      (coe
         MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
      (coe d_unquoted'45'lit_402)
-- Cubed.Example.CSV.Concrete.field'
d_field''_406 :: MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_field''_406
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du__'60''8853''62'__346
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
         (coe
            MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
               (coe
                  MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                  (coe
                     MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))))
      (coe d_unquoted'45'field_404) (coe d_quoted'45'field_400)
-- Cubed.Example.CSV.Concrete.nonempty-line
d_nonempty'45'line_408 ::
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_nonempty'45'line_408
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du__'60''8855''62'__336
      (coe
         MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
            (coe
               MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                     (coe
                        MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                        (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
               (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe ','))
            (coe
               MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                  (coe
                     MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                           (coe
                              MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))))
      d_field''_406
      (coe
         MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_many_352
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe ','))
            (coe
               MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                  (coe
                     MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                           (coe
                              MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))))))
         (coe
            MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du__'60''8855''62'__336
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe ','))
            (coe
               MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                  (coe
                     MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                           (coe
                              MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
            (coe
               MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_char_390
               (coe
                  (\ v0 v1 ->
                     coe
                       MAlonzo.Code.Cubed.Data.Dec.Base.du_map_60 (coe (\ v2 v3 -> v0))
                       (coe
                          MAlonzo.Code.Cubed.Data.Dec.Base.du__'8799'__78
                          (coe MAlonzo.Code.Cubed.Data.Char.Base.d__'8801''7495'__8 v0 v1)
                          (coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10)
                          (coe
                             MAlonzo.Code.Cubed.Data.Bool.Properties.d_is'45'discrete_12))))
               (coe ','))
            d_field''_406))
-- Cubed.Example.CSV.Concrete.line
d_line_410 :: MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_line_410
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du__'60''8855''62'__336
      (coe
         MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe
               MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                  (coe
                     MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                           (coe
                              MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe ','))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                        (coe
                           MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                                 (coe
                                    MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                                 (coe
                                    MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                                    (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                                    (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                           (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))))))))
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
      (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '\n'))
      (coe
         MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du__'60''8853''62'__346
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe
               MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                  (coe
                     MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                           (coe
                              MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe ','))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                        (coe
                           MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                                 (coe
                                    MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                                 (coe
                                    MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                                    (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                                    (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                           (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))))))))
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16)
         (coe d_nonempty'45'line_408)
         (coe MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_pure_316))
      (coe
         MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_char_390
         (coe
            (\ v0 v1 ->
               coe
                 MAlonzo.Code.Cubed.Data.Dec.Base.du_map_60 (coe (\ v2 v3 -> v0))
                 (coe
                    MAlonzo.Code.Cubed.Data.Dec.Base.du__'8799'__78
                    (coe MAlonzo.Code.Cubed.Data.Char.Base.d__'8801''7495'__8 v0 v1)
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10)
                    (coe
                       MAlonzo.Code.Cubed.Data.Bool.Properties.d_is'45'discrete_12))))
         (coe '\n'))
-- Cubed.Example.CSV.Concrete.cst
d_cst_412 :: MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_cst_412
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_many_352
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
         (coe
            MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
               (coe
                  MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                     (coe
                        MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                                 (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                                 (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                        (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe ','))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                           (coe
                              MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                           (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                                 (coe
                                    MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                                    (coe
                                       MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                                    (coe
                                       MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                                       (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                                       (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))))))))
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '\n')))
      (coe d_line_410)
-- Cubed.Example.CSV.Abstract.Field
d_Field_416 :: ()
d_Field_416 = erased
-- Cubed.Example.CSV.Abstract.Line
d_Line_418 :: ()
d_Line_418 = erased
-- Cubed.Example.CSV.Abstract.AST
d_AST_420 :: ()
d_AST_420 = erased
-- Cubed.Example.CSV.Concrete→Abstract.quoted-lit
d_quoted'45'lit_424 ::
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_quoted'45'lit_424
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45''8853'_390
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
         (\ v0 ->
            coe
              MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
              (\ v1 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v0))))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))
      (coe
         MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45''8853''7472'''_368
         (coe
            (\ v0 ->
               coe
                 MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
                 (\ v1 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v0))))
         (coe
            (\ v0 ->
               coe
                 MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_pure_318
                 (coe
                    MAlonzo.Code.Cubed.Grammars.Base.C_'8853''7472'_30
                    (\ v1 -> coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe v0)))
                 (coe v0))))
      (coe
         MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_pure_318
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))
         (coe '"'))
-- Cubed.Example.CSV.Concrete→Abstract.quoted-field
d_quoted'45'field_428 ::
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_quoted'45'field_428
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45'surround_422
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
         (coe
            MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
            (coe
               MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
               (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
               (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
      (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
      (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
      (coe
         MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45''42'_410
         (coe
            MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
            (coe
               MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
               (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
               (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))))
         (coe d_quoted'45'lit_424))
-- Cubed.Example.CSV.Concrete→Abstract.unquoted-field
d_unquoted'45'field_430 ::
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_unquoted'45'field_430
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45'underlying_420
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
         (coe
            MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
-- Cubed.Example.CSV.Concrete→Abstract.field'
d_field''_432 :: MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_field''_432
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45''8853'_390
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
         (coe
            MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
               (coe
                  MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                  (coe
                     MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))))
      d_unquoted'45'field_430 d_quoted'45'field_428
-- Cubed.Example.CSV.Concrete→Abstract.nonempty-line
d_nonempty'45'line_434 ::
  MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_nonempty'45'line_434
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_map_336
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
         (coe
            MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
               (coe
                  MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
               (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                        (coe
                           MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                           (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                           (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
               (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe ','))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                     (coe
                        MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                                 (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                                 (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                        (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))))))))
      (coe
         (\ v0 ->
            case coe v0 of
              MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v1 v2
                -> coe
                     MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v1) (coe v2)
              _ -> MAlonzo.RTE.mazUnreachableError))
      (coe
         MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45''8855'_372
         (coe
            MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
               (coe
                  MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
               (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                        (coe
                           MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                           (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                           (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
               (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe ','))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                     (coe
                        MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                                 (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                                 (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                        (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))))
         (coe d_field''_432)
         (coe
            MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45''42'_410
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
               (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe ','))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                     (coe
                        MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                                 (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                                 (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                        (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))))))
            (coe
               MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45'right_386
               (coe
                  MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                     (coe
                        MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                                 (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                                 (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                        (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
               (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe ','))
               (coe d_field''_432))))
-- Cubed.Example.CSV.Concrete→Abstract.line
d_line_436 :: MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_line_436
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45'left_382
      (coe
         MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe
               MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                  (coe
                     MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                           (coe
                              MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe ','))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                        (coe
                           MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                                 (coe
                                    MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                                 (coe
                                    MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                                    (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                                    (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                           (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))))))))
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
      (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '\n'))
      (coe
         MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45''8853'_390
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe
               MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                  (coe
                     MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                           (coe
                              MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe ','))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                        (coe
                           MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                                 (coe
                                    MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                                 (coe
                                    MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                                    (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                                    (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                           (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))))))))
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16)
         d_nonempty'45'line_434
         (coe
            MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_pure_318
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16)
            (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)))
-- Cubed.Example.CSV.Concrete→Abstract.ast
d_ast_438 :: MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_ast_438
  = coe
      MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45''42'_410
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
         (coe
            MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
               (coe
                  MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                     (coe
                        MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                                 (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                                 (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                        (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                     (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe ','))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                           (coe
                              MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                           (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                                 (coe
                                    MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                                    (coe
                                       MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                                    (coe
                                       MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                                       (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                                       (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))))))))
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
         (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '\n')))
      (coe d_line_436)
-- Cubed.Example.CSV.parser
d_parser_440 :: MAlonzo.Code.Cubed.Grammars.Base.T__'8866'__130
d_parser_440
  = coe
      MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_map_318
      (coe
         MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
         (coe
            MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
            (coe
               MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                        (coe
                           MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                                 (coe
                                    MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                                 (coe
                                    MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                                    (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                                    (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                           (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                  (coe
                     MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                     (coe
                        MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                        (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe ','))
                        (coe
                           MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
                           (coe
                              MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                              (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                              (coe
                                 MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                                 (coe
                                    MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                                    (coe
                                       MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
                                       (coe
                                          MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418)
                                       (coe
                                          MAlonzo.Code.Cubed.Grammars.Base.C__'8855'__32
                                          (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))
                                          (coe
                                             MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"')))))
                                 (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '"'))))))))
               (coe MAlonzo.Code.Cubed.Grammars.Base.C_ε_16))
            (coe MAlonzo.Code.Cubed.Grammars.Base.C_Lit_22 (coe '\n'))))
      (coe MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_Δ_302)
      (coe d_ast_438) (coe d_cst_412)
-- Cubed.Example.CSV.Test.csv1
d_csv1_444 :: [MAlonzo.Code.Agda.Builtin.Char.T_Char_6]
d_csv1_444
  = coe
      MAlonzo.Code.Agda.Builtin.String.d_primStringToList_12
      ("a,\"b,x,y\",c\ne,f,g\n" :: Data.Text.Text)
-- Cubed.Example.CSV.Test.csv1-ast
d_csv1'45'ast_446 ::
  Maybe [[[MAlonzo.Code.Agda.Builtin.Char.T_Char_6]]]
d_csv1'45'ast_446
  = coe
      MAlonzo.Code.Cubed.Grammars.Semantics.du_run'45'weak'45'parser'45'Δ_772
      (coe ()) (coe d_parser_440) (coe d_csv1_444)
-- Cubed.Example.CSV.Test.small
d_small_448 :: [MAlonzo.Code.Agda.Builtin.Char.T_Char_6]
d_small_448
  = coe
      MAlonzo.Code.Agda.Builtin.String.d_primStringToList_12
      ("\"testing\"" :: Data.Text.Text)
-- Cubed.Example.CSV.Test.small-c
d_small'45'c_450 :: MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_small'45'c_450
  = coe
      MAlonzo.Code.Cubed.Grammars.Semantics.du_run'45'weak'45'parser'45'Δ'45'partial_778
      (coe ())
      (coe
         MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_map_318
         (coe
            MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
               (coe
                  MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128))
         (coe MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_Δ_302)
         (coe
            MAlonzo.Code.Cubed.Grammars.SemZ45Zact.du_semact'45'underlying_420
            (coe
               MAlonzo.Code.Cubed.Grammars.Sum.du__'8853'__240
               (coe
                  MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
                  (coe
                     MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
               (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)))
         (coe
            MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du__'60''8853''62'__346
            (coe
               MAlonzo.Code.Cubed.Grammars.Base.du__'42'_122
               (coe
                  MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_None'45'of_418))
            (coe MAlonzo.Code.Cubed.Grammars.Base.du_String_128)
            (coe d_unquoted'45'field_404)
            (coe
               MAlonzo.Code.Cubed.Grammars.ParserZ45Zcombinator.du_rest_356)))
      (coe d_small_448)
-- Cubed.Example.CSV.stringify-line
d_stringify'45'line_452 ::
  [[MAlonzo.Code.Agda.Builtin.Char.T_Char_6]] ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6
d_stringify'45'line_452 v0
  = case coe v0 of
      [] -> coe ("\n" :: Data.Text.Text)
      (:) v1 v2
        -> coe
             MAlonzo.Code.Cubed.Data.String.Base.d__'43''43'__10
             (coe MAlonzo.Code.Agda.Builtin.String.d_primStringFromList_14 v1)
             (coe
                MAlonzo.Code.Cubed.Data.String.Base.d__'43''43'__10
                (" and also " :: Data.Text.Text)
                (d_stringify'45'line_452 (coe v2)))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.CSV.stringify
d_stringify_458 ::
  [[[MAlonzo.Code.Agda.Builtin.Char.T_Char_6]]] ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6
d_stringify_458 v0
  = case coe v0 of
      [] -> coe ("" :: Data.Text.Text)
      (:) v1 v2
        -> coe
             MAlonzo.Code.Cubed.Data.String.Base.d__'43''43'__10
             (d_stringify'45'line_452 (coe v1)) (d_stringify_458 (coe v2))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.CSV.print-csv
d_print'45'csv_464 ::
  [[[MAlonzo.Code.Agda.Builtin.Char.T_Char_6]]] ->
  MAlonzo.Code.Agda.Builtin.IO.T_IO_8
    AgdaAny MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6
d_print'45'csv_464 v0
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
      (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))
      (coe
         MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
         (coe
            MAlonzo.Code.Cubed.Data.String.Base.d__'43''43'__10
            ("num rows: " :: Data.Text.Text)
            (coe
               MAlonzo.Code.Agda.Builtin.String.d_primShowNat_24
               (coe MAlonzo.Code.Cubed.Data.List.Base.du_length_50 (coe v0)))))
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
         (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))
         (coe
            MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
            (d_stringify_458 (coe v0)))
         (coe
            MAlonzo.Code.Cubed.IO.Base.d_pure_10 () erased
            (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
main = coe d_main_468
-- Cubed.Example.CSV.main
d_main_468 ::
  MAlonzo.Code.Agda.Builtin.IO.T_IO_8
    AgdaAny MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6
d_main_468
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
      (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))
      (coe
         MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
         ("small:" :: Data.Text.Text))
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
         (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))
         (coe
            MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
            (coe
               MAlonzo.Code.Cubed.Data.Maybe.Base.du_rec_12
               (coe ("failed to parse small" :: Data.Text.Text))
               (coe MAlonzo.Code.Agda.Builtin.String.d_primStringFromList_14)
               (coe
                  MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe d_small'45'c_450))))
         (coe
            MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
            (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))
            (coe
               MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
               (coe
                  MAlonzo.Code.Cubed.Data.String.Base.d__'43''43'__10
                  ("rest: " :: Data.Text.Text)
                  (coe
                     MAlonzo.Code.Agda.Builtin.String.d_primStringFromList_14
                     (MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30
                        (coe d_small'45'c_450)))))
            (coe
               MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
               (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))
               (coe
                  MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                  ("\n\ncsv:" :: Data.Text.Text))
               (coe
                  MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
                  (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))
                  (coe
                     MAlonzo.Code.Cubed.Data.Maybe.Base.du_rec_12
                     (coe
                        MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                        ("failed to parse CSV" :: Data.Text.Text))
                     (coe d_print'45'csv_464) (coe d_csv1'45'ast_446))
                  (coe
                     MAlonzo.Code.Cubed.IO.Base.d_pure_10 () erased
                     (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))))))
