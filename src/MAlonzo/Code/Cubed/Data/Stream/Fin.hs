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

module MAlonzo.Code.Cubed.Data.Stream.Fin where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Data.List.Base
import qualified MAlonzo.Code.Cubed.Data.Maybe.Base
import qualified MAlonzo.Code.Cubed.Data.Nat.Base
import qualified MAlonzo.Code.Cubed.Data.Prod.Base
import qualified MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen

-- Cubed.Data.Stream.Fin.Stream
d_Stream_18 a0 a1 = ()
data T_Stream_18
  = C_lift_34 Integer
              MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.T_Stream_32
-- Cubed.Data.Stream.Fin.Stream.length
d_length_26 :: T_Stream_18 -> Integer
d_length_26 v0
  = case coe v0 of
      C_lift_34 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Stream.Fin.Stream.stream-with-len
d_stream'45'with'45'len_28 ::
  T_Stream_18 ->
  MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.T_Stream_32
d_stream'45'with'45'len_28 v0
  = case coe v0 of
      C_lift_34 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Stream.Fin.empty
d_empty_36 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> () -> T_Stream_18
d_empty_36 ~v0 ~v1 = du_empty_36
du_empty_36 :: T_Stream_18
du_empty_36
  = coe
      C_lift_34 (coe (0 :: Integer))
      (coe MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du_empty_50)
-- Cubed.Data.Stream.Fin.cons
d_cons_38 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> AgdaAny -> T_Stream_18 -> T_Stream_18
d_cons_38 ~v0 ~v1 v2 v3 = du_cons_38 v2 v3
du_cons_38 :: AgdaAny -> T_Stream_18 -> T_Stream_18
du_cons_38 v0 v1
  = coe
      C_lift_34
      (coe addInt (coe (1 :: Integer)) (coe d_length_26 (coe v1)))
      (coe
         MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.C_delay_48
         (coe
            MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.C__'8759'__38
            (coe d_length_26 (coe v1)) (coe v0)
            (coe d_stream'45'with'45'len_28 (coe v1))))
-- Cubed.Data.Stream.Fin.case
d_case_48 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> AgdaAny -> AgdaAny -> T_Stream_18 -> AgdaAny
d_case_48 ~v0 ~v1 ~v2 ~v3 v4 v5 v6 = du_case_48 v4 v5 v6
du_case_48 :: AgdaAny -> AgdaAny -> T_Stream_18 -> AgdaAny
du_case_48 v0 v1 v2
  = coe
      MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du_case_64
      (coe v0) (coe (\ v3 -> v1)) (coe d_length_26 (coe v2))
-- Cubed.Data.Stream.Fin.foldl
d_foldl_54 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> T_Stream_18 -> AgdaAny
d_foldl_54 v0 ~v1 v2 ~v3 v4 v5 v6 = du_foldl_54 v0 v2 v4 v5 v6
du_foldl_54 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> T_Stream_18 -> AgdaAny
du_foldl_54 v0 v1 v2 v3 v4
  = coe
      MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du_foldl_86
      (coe v0) (coe v1) (coe (\ v5 -> v2)) (coe v3)
      (coe d_length_26 (coe v4))
      (coe d_stream'45'with'45'len_28 (coe v4))
-- Cubed.Data.Stream.Fin.foldr
d_foldr_60 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> T_Stream_18 -> AgdaAny
d_foldr_60 v0 ~v1 v2 ~v3 v4 v5 v6 = du_foldr_60 v0 v2 v4 v5 v6
du_foldr_60 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> T_Stream_18 -> AgdaAny
du_foldr_60 v0 v1 v2 v3 v4
  = coe
      MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du_foldr_116
      (coe v1) (coe v0) (coe (\ v5 -> v2)) (coe v3)
      (coe d_length_26 (coe v4))
      (coe d_stream'45'with'45'len_28 (coe v4))
-- Cubed.Data.Stream.Fin.from-list
d_from'45'list_66 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> T_Stream_18
d_from'45'list_66 ~v0 ~v1 v2 = du_from'45'list_66 v2
du_from'45'list_66 :: [AgdaAny] -> T_Stream_18
du_from'45'list_66 v0
  = coe
      C_lift_34
      (coe MAlonzo.Code.Cubed.Data.List.Base.du_length_50 (coe v0))
      (coe
         MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du_from'45'list_142
         (coe v0))
-- Cubed.Data.Stream.Fin.to-list
d_to'45'list_68 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Stream_18 -> [AgdaAny]
d_to'45'list_68 v0 ~v1 v2 = du_to'45'list_68 v0 v2
du_to'45'list_68 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> T_Stream_18 -> [AgdaAny]
du_to'45'list_68 v0 v1
  = coe
      MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du_to'45'list_148
      v0 (d_length_26 (coe v1)) (d_stream'45'with'45'len_28 (coe v1))
-- Cubed.Data.Stream.Fin.map
d_map_70 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> (AgdaAny -> AgdaAny) -> T_Stream_18 -> T_Stream_18
d_map_70 v0 ~v1 v2 ~v3 v4 v5 = du_map_70 v0 v2 v4 v5
du_map_70 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (AgdaAny -> AgdaAny) -> T_Stream_18 -> T_Stream_18
du_map_70 v0 v1 v2 v3
  = coe
      C_lift_34 (coe d_length_26 (coe v3))
      (coe
         MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du_map_150
         (coe v0) (coe v1) (coe d_length_26 (coe v3)) (coe v2)
         (coe d_stream'45'with'45'len_28 (coe v3)))
-- Cubed.Data.Stream.Fin.head
d_head_74 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Stream_18 -> Maybe AgdaAny
d_head_74 ~v0 ~v1 v2 = du_head_74 v2
du_head_74 :: T_Stream_18 -> Maybe AgdaAny
du_head_74 v0
  = coe
      MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du_safe'45'head_178
      (d_length_26 (coe v0)) (d_stream'45'with'45'len_28 (coe v0))
-- Cubed.Data.Stream.Fin.tail
d_tail_76 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Stream_18 -> Maybe T_Stream_18
d_tail_76 ~v0 ~v1 v2 = du_tail_76 v2
du_tail_76 :: T_Stream_18 -> Maybe T_Stream_18
du_tail_76 v0
  = coe
      MAlonzo.Code.Cubed.Data.Maybe.Base.du_map_24
      (coe
         C_lift_34
         (coe
            MAlonzo.Code.Cubed.Data.Nat.Base.d_safe'45'pred_140
            (coe d_length_26 (coe v0))))
      (coe
         MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du_safe'45'tail_192
         (d_length_26 (coe v0)) (d_stream'45'with'45'len_28 (coe v0)))
-- Cubed.Data.Stream.Fin.pop
d_pop_78 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Stream_18 -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_pop_78 ~v0 ~v1 v2 = du_pop_78 v2
du_pop_78 ::
  T_Stream_18 -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_pop_78 v0
  = coe
      MAlonzo.Code.Cubed.Data.Maybe.Base.du_map_24
      (coe
         MAlonzo.Code.Cubed.Data.Prod.Base.du_map'45'snd_46
         (coe
            (\ v1 ->
               coe
                 C_lift_34
                 (coe
                    MAlonzo.Code.Cubed.Data.Nat.Base.d_safe'45'pred_140
                    (coe d_length_26 (coe v0))))))
      (coe
         MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du_safe'45'pop_206
         (d_length_26 (coe v0)) (d_stream'45'with'45'len_28 (coe v0)))
-- Cubed.Data.Stream.Fin._++_
d__'43''43'__80 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Stream_18 -> T_Stream_18 -> T_Stream_18
d__'43''43'__80 v0 ~v1 v2 v3 = du__'43''43'__80 v0 v2 v3
du__'43''43'__80 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Stream_18 -> T_Stream_18 -> T_Stream_18
du__'43''43'__80 v0 v1 v2
  = coe
      C_lift_34
      (coe addInt (coe d_length_26 (coe v1)) (coe d_length_26 (coe v2)))
      (coe
         MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du__'43''43'__210
         v0 (d_length_26 (coe v1)) (d_length_26 (coe v2))
         (d_stream'45'with'45'len_28 (coe v1))
         (d_stream'45'with'45'len_28 (coe v2)))
-- Cubed.Data.Stream.Fin.reverse
d_reverse_86 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> T_Stream_18 -> T_Stream_18
d_reverse_86 v0 ~v1 v2 = du_reverse_86 v0 v2
du_reverse_86 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  T_Stream_18 -> T_Stream_18
du_reverse_86 v0 v1
  = coe
      C_lift_34 (coe d_length_26 (coe v1))
      (coe
         MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen.du_reverse_228 v0
         (d_length_26 (coe v1)) (d_stream'45'with'45'len_28 (coe v1)))
