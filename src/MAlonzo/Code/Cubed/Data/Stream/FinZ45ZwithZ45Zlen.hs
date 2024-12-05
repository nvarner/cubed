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

module MAlonzo.Code.Cubed.Data.Stream.FinZ45ZwithZ45Zlen where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Maybe
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Data.List.Base

-- Cubed.Data.Stream.Fin-with-len.Cell
d_Cell_24 a0 a1 a2 = ()
data T_Cell_24
  = C_'91''93'_36 | C__'8759'__38 Integer AgdaAny T_Stream_32
-- Cubed.Data.Stream.Fin-with-len.Stream
d_Stream_32 a0 a1 a2 = ()
data T_Stream_32 = C_delay_48 T_Cell_24
-- Cubed.Data.Stream.Fin-with-len.Stream.force
d_force_46 :: T_Stream_32 -> T_Cell_24
d_force_46 v0
  = case coe v0 of
      C_delay_48 v1 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Stream.Fin-with-len.empty
d_empty_50 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> () -> T_Stream_32
d_empty_50 ~v0 ~v1 = du_empty_50
du_empty_50 :: T_Stream_32
du_empty_50 = coe C_delay_48 (coe C_'91''93'_36)
-- Cubed.Data.Stream.Fin-with-len.length
d_length_52 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> T_Stream_32 -> Integer
d_length_52 ~v0 ~v1 v2 ~v3 = du_length_52 v2
du_length_52 :: Integer -> Integer
du_length_52 v0 = coe v0
-- Cubed.Data.Stream.Fin-with-len.case
d_case_64 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (Integer -> ()) ->
  AgdaAny ->
  (Integer -> AgdaAny) -> Integer -> T_Stream_32 -> AgdaAny
d_case_64 ~v0 ~v1 ~v2 ~v3 v4 v5 v6 ~v7 = du_case_64 v4 v5 v6
du_case_64 :: AgdaAny -> (Integer -> AgdaAny) -> Integer -> AgdaAny
du_case_64 v0 v1 v2
  = case coe v2 of
      0 -> coe v0
      _ -> let v3 = subInt (coe v2) (coe (1 :: Integer)) in
           coe (coe v1 v3)
-- Cubed.Data.Stream.Fin-with-len.foldl
d_foldl_86 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (Integer -> ()) ->
  (Integer -> AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> Integer -> T_Stream_32 -> AgdaAny
d_foldl_86 v0 v1 ~v2 ~v3 v4 v5 v6 v7
  = du_foldl_86 v0 v1 v4 v5 v6 v7
du_foldl_86 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (Integer -> AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> Integer -> T_Stream_32 -> AgdaAny
du_foldl_86 v0 v1 v2 v3 v4 v5
  = case coe v4 of
      0 -> coe v3
      _ -> coe
             du_'46'extendedlambda0_104 (coe v0) (coe v1) (coe v2) (coe v3)
             (coe d_force_46 (coe v5))
-- Cubed.Data.Stream.Fin-with-len..extendedlambda0
d_'46'extendedlambda0_104 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (Integer -> ()) ->
  (Integer -> AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> Integer -> T_Stream_32 -> T_Cell_24 -> AgdaAny
d_'46'extendedlambda0_104 v0 v1 ~v2 ~v3 v4 v5 ~v6 ~v7 v8
  = du_'46'extendedlambda0_104 v0 v1 v4 v5 v8
du_'46'extendedlambda0_104 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (Integer -> AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> T_Cell_24 -> AgdaAny
du_'46'extendedlambda0_104 v0 v1 v2 v3 v4
  = case coe v4 of
      C__'8759'__38 v5 v6 v7
        -> coe
             du_foldl_86 (coe v0) (coe v1)
             (coe (\ v8 -> coe v2 (addInt (coe (1 :: Integer)) (coe v8))))
             (coe v2 (0 :: Integer) v3 v6) (coe v5) (coe v7)
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Stream.Fin-with-len.foldr
d_foldr_116 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (Integer -> ()) ->
  (Integer -> AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> Integer -> T_Stream_32 -> AgdaAny
d_foldr_116 v0 v1 ~v2 ~v3 v4 v5 v6 v7
  = du_foldr_116 v0 v1 v4 v5 v6 v7
du_foldr_116 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (Integer -> AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> Integer -> T_Stream_32 -> AgdaAny
du_foldr_116 v0 v1 v2 v3 v4 v5
  = case coe v4 of
      0 -> coe v3
      _ -> coe
             du_'46'extendedlambda1_134 (coe v0) (coe v1) (coe v2) (coe v3)
             (coe d_force_46 (coe v5))
-- Cubed.Data.Stream.Fin-with-len..extendedlambda1
d_'46'extendedlambda1_134 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (Integer -> ()) ->
  (Integer -> AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> Integer -> T_Stream_32 -> T_Cell_24 -> AgdaAny
d_'46'extendedlambda1_134 v0 v1 ~v2 ~v3 v4 v5 ~v6 ~v7 v8
  = du_'46'extendedlambda1_134 v0 v1 v4 v5 v8
du_'46'extendedlambda1_134 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (Integer -> AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> T_Cell_24 -> AgdaAny
du_'46'extendedlambda1_134 v0 v1 v2 v3 v4
  = case coe v4 of
      C__'8759'__38 v5 v6 v7
        -> coe
             v2 v5 v6
             (coe
                du_foldr_116 (coe v0) (coe v1) (coe v2) (coe v3) (coe v5) (coe v7))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Stream.Fin-with-len.from-list
d_from'45'list_142 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> T_Stream_32
d_from'45'list_142 ~v0 ~v1 v2 = du_from'45'list_142 v2
du_from'45'list_142 :: [AgdaAny] -> T_Stream_32
du_from'45'list_142 v0
  = coe
      C_delay_48
      (case coe v0 of
         [] -> coe C_'91''93'_36
         (:) v1 v2
           -> coe
                C__'8759'__38
                (coe MAlonzo.Code.Cubed.Data.List.Base.du_length_50 (coe v2))
                (coe v1) (coe du_from'45'list_142 (coe v2))
         _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Data.Stream.Fin-with-len.to-list
d_to'45'list_148 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> T_Stream_32 -> [AgdaAny]
d_to'45'list_148 v0 ~v1 v2 = du_to'45'list_148 v0 v2
du_to'45'list_148 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  Integer -> T_Stream_32 -> [AgdaAny]
du_to'45'list_148 v0 v1
  = coe
      du_foldr_116 (coe v0) (coe v0)
      (coe (\ v2 -> coe MAlonzo.Code.Agda.Builtin.List.C__'8759'__22))
      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16) (coe v1)
-- Cubed.Data.Stream.Fin-with-len.map
d_map_150 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> (AgdaAny -> AgdaAny) -> T_Stream_32 -> T_Stream_32
d_map_150 v0 ~v1 v2 ~v3 v4 v5 v6 = du_map_150 v0 v2 v4 v5 v6
du_map_150 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  Integer -> (AgdaAny -> AgdaAny) -> T_Stream_32 -> T_Stream_32
du_map_150 v0 v1 v2 v3 v4
  = coe
      C_delay_48
      (case coe v2 of
         0 -> coe C_'91''93'_36
         _ -> coe
                du_'46'extendedlambda2_162 (coe v0) (coe v1) (coe v3)
                (coe d_force_46 (coe v4)))
-- Cubed.Data.Stream.Fin-with-len..extendedlambda2
d_'46'extendedlambda2_162 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  Integer ->
  (AgdaAny -> AgdaAny) -> T_Stream_32 -> T_Cell_24 -> T_Cell_24
d_'46'extendedlambda2_162 v0 ~v1 v2 ~v3 ~v4 v5 ~v6 v7
  = du_'46'extendedlambda2_162 v0 v2 v5 v7
du_'46'extendedlambda2_162 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (AgdaAny -> AgdaAny) -> T_Cell_24 -> T_Cell_24
du_'46'extendedlambda2_162 v0 v1 v2 v3
  = case coe v3 of
      C__'8759'__38 v4 v5 v6
        -> coe
             C__'8759'__38 (coe v4) (coe v2 v5)
             (coe du_map_150 (coe v0) (coe v1) (coe v4) (coe v2) (coe v6))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Stream.Fin-with-len.head
d_head_168 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> T_Stream_32 -> AgdaAny
d_head_168 ~v0 ~v1 ~v2 v3 = du_head_168 v3
du_head_168 :: T_Stream_32 -> AgdaAny
du_head_168 v0
  = coe du_'46'extendedlambda3_172 (coe d_force_46 (coe v0))
-- Cubed.Data.Stream.Fin-with-len..extendedlambda3
d_'46'extendedlambda3_172 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> T_Stream_32 -> T_Cell_24 -> AgdaAny
d_'46'extendedlambda3_172 ~v0 ~v1 ~v2 ~v3 v4
  = du_'46'extendedlambda3_172 v4
du_'46'extendedlambda3_172 :: T_Cell_24 -> AgdaAny
du_'46'extendedlambda3_172 v0
  = case coe v0 of
      C__'8759'__38 v1 v2 v3 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Stream.Fin-with-len.safe-head
d_safe'45'head_178 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> T_Stream_32 -> Maybe AgdaAny
d_safe'45'head_178 ~v0 ~v1 v2 = du_safe'45'head_178 v2
du_safe'45'head_178 :: Integer -> T_Stream_32 -> Maybe AgdaAny
du_safe'45'head_178 v0
  = case coe v0 of
      0 -> let v1 = coe MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18 in
           coe (coe (\ v2 -> v1))
      _ -> coe
             (\ v1 ->
                coe
                  MAlonzo.Code.Agda.Builtin.Maybe.C_just_16
                  (coe du_head_168 (coe v1)))
-- Cubed.Data.Stream.Fin-with-len.tail
d_tail_182 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> T_Stream_32 -> T_Stream_32
d_tail_182 ~v0 ~v1 ~v2 v3 = du_tail_182 v3
du_tail_182 :: T_Stream_32 -> T_Stream_32
du_tail_182 v0
  = coe
      C_delay_48
      (coe du_'46'extendedlambda4_186 (coe d_force_46 (coe v0)))
-- Cubed.Data.Stream.Fin-with-len..extendedlambda4
d_'46'extendedlambda4_186 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> T_Stream_32 -> T_Cell_24 -> T_Cell_24
d_'46'extendedlambda4_186 ~v0 ~v1 ~v2 ~v3 v4
  = du_'46'extendedlambda4_186 v4
du_'46'extendedlambda4_186 :: T_Cell_24 -> T_Cell_24
du_'46'extendedlambda4_186 v0
  = case coe v0 of
      C__'8759'__38 v1 v2 v3 -> coe d_force_46 (coe v3)
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Stream.Fin-with-len.safe-tail
d_safe'45'tail_192 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> T_Stream_32 -> Maybe T_Stream_32
d_safe'45'tail_192 ~v0 ~v1 v2 = du_safe'45'tail_192 v2
du_safe'45'tail_192 :: Integer -> T_Stream_32 -> Maybe T_Stream_32
du_safe'45'tail_192 v0
  = case coe v0 of
      0 -> let v1 = coe MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18 in
           coe (coe (\ v2 -> v1))
      _ -> coe
             (\ v1 ->
                coe
                  MAlonzo.Code.Agda.Builtin.Maybe.C_just_16
                  (coe du_tail_182 (coe v1)))
-- Cubed.Data.Stream.Fin-with-len.pop
d_pop_196 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  Integer -> T_Stream_32 -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_pop_196 ~v0 ~v1 ~v2 v3 = du_pop_196 v3
du_pop_196 :: T_Stream_32 -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_pop_196 v0
  = coe du_'46'extendedlambda5_200 (coe d_force_46 (coe v0))
-- Cubed.Data.Stream.Fin-with-len..extendedlambda5
d_'46'extendedlambda5_200 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  Integer ->
  T_Stream_32 -> T_Cell_24 -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_'46'extendedlambda5_200 ~v0 ~v1 ~v2 ~v3 v4
  = du_'46'extendedlambda5_200 v4
du_'46'extendedlambda5_200 ::
  T_Cell_24 -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_'46'extendedlambda5_200 v0
  = case coe v0 of
      C__'8759'__38 v1 v2 v3
        -> coe
             MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v2) (coe v3)
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Stream.Fin-with-len.safe-pop
d_safe'45'pop_206 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  Integer ->
  T_Stream_32 -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_safe'45'pop_206 ~v0 ~v1 v2 = du_safe'45'pop_206 v2
du_safe'45'pop_206 ::
  Integer ->
  T_Stream_32 -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_safe'45'pop_206 v0
  = case coe v0 of
      0 -> let v1 = coe MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18 in
           coe (coe (\ v2 -> v1))
      _ -> coe
             (\ v1 ->
                coe
                  MAlonzo.Code.Agda.Builtin.Maybe.C_just_16
                  (coe du_pop_196 (coe v1)))
-- Cubed.Data.Stream.Fin-with-len._++_
d__'43''43'__210 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  Integer -> Integer -> T_Stream_32 -> T_Stream_32 -> T_Stream_32
d__'43''43'__210 v0 ~v1 v2 = du__'43''43'__210 v0 v2
du__'43''43'__210 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  Integer -> Integer -> T_Stream_32 -> T_Stream_32 -> T_Stream_32
du__'43''43'__210 v0 v1
  = case coe v1 of
      0 -> coe (\ v2 v3 v4 -> v4)
      _ -> coe
             (\ v2 v3 v4 ->
                coe
                  C_delay_48
                  (coe
                     du_'46'extendedlambda6_222 (coe v0) (coe v2) (coe v4)
                     (coe d_force_46 (coe v3))))
-- Cubed.Data.Stream.Fin-with-len..extendedlambda6
d_'46'extendedlambda6_222 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  Integer ->
  Integer -> T_Stream_32 -> T_Stream_32 -> T_Cell_24 -> T_Cell_24
d_'46'extendedlambda6_222 v0 ~v1 ~v2 v3 ~v4 v5 v6
  = du_'46'extendedlambda6_222 v0 v3 v5 v6
du_'46'extendedlambda6_222 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  Integer -> T_Stream_32 -> T_Cell_24 -> T_Cell_24
du_'46'extendedlambda6_222 v0 v1 v2 v3
  = case coe v3 of
      C__'8759'__38 v4 v5 v6
        -> coe
             C__'8759'__38 (coe addInt (coe v1) (coe v4)) (coe v5)
             (coe du__'43''43'__210 v0 v4 v1 v6 v2)
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.Stream.Fin-with-len.reverse
d_reverse_228 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> T_Stream_32 -> T_Stream_32
d_reverse_228 v0 ~v1 v2 = du_reverse_228 v0 v2
du_reverse_228 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  Integer -> T_Stream_32 -> T_Stream_32
du_reverse_228 v0 v1
  = coe
      du_foldl_86 (coe v0) (coe v0)
      (coe
         (\ v2 v3 v4 ->
            coe C_delay_48 (coe C__'8759'__38 (coe v2) (coe v4) (coe v3))))
      (coe du_empty_50) (coe v1)
