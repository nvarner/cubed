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

module MAlonzo.Code.Cubed.Data.List.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Maybe
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Cubed.Data.Bool.Base
import qualified MAlonzo.Code.Cubed.Data.Maybe.Base
import qualified MAlonzo.Code.Cubed.Data.Prod.Base
import qualified MAlonzo.Code.Cubed.Id.Base
import qualified MAlonzo.Code.Cubed.Level

-- Cubed.Data.List.Base.elim
d_elim_26 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  ([AgdaAny] -> ()) ->
  AgdaAny ->
  (AgdaAny -> [AgdaAny] -> AgdaAny -> AgdaAny) ->
  [AgdaAny] -> AgdaAny
d_elim_26 ~v0 ~v1 ~v2 ~v3 v4 v5 v6 = du_elim_26 v4 v5 v6
du_elim_26 ::
  AgdaAny ->
  (AgdaAny -> [AgdaAny] -> AgdaAny -> AgdaAny) ->
  [AgdaAny] -> AgdaAny
du_elim_26 v0 v1 v2
  = case coe v2 of
      [] -> coe v0
      (:) v3 v4
        -> coe v1 v3 v4 (coe du_elim_26 (coe v0) (coe v1) (coe v4))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base.map
d_map_40 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> (AgdaAny -> AgdaAny) -> [AgdaAny] -> [AgdaAny]
d_map_40 ~v0 ~v1 ~v2 ~v3 v4 v5 = du_map_40 v4 v5
du_map_40 :: (AgdaAny -> AgdaAny) -> [AgdaAny] -> [AgdaAny]
du_map_40 v0 v1
  = case coe v1 of
      [] -> coe v1
      (:) v2 v3
        -> coe
             MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v0 v2)
             (coe du_map_40 (coe v0) (coe v3))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base.length
d_length_50 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> Integer
d_length_50 ~v0 ~v1 v2 = du_length_50 v2
du_length_50 :: [AgdaAny] -> Integer
du_length_50 v0
  = case coe v0 of
      [] -> coe (0 :: Integer)
      (:) v1 v2
        -> coe addInt (coe (1 :: Integer)) (coe du_length_50 (coe v2))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base._≡_
d__'8801'__56 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Id.Base.T_Id'45'sys_18 ->
  [AgdaAny] -> [AgdaAny] -> ()
d__'8801'__56 = erased
-- Cubed.Data.List.Base.refl
d_refl_78 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Cubed.Id.Base.T_Id'45'sys_18 -> [AgdaAny] -> AgdaAny
d_refl_78 ~v0 ~v1 v2 v3 = du_refl_78 v2 v3
du_refl_78 ::
  MAlonzo.Code.Cubed.Id.Base.T_Id'45'sys_18 -> [AgdaAny] -> AgdaAny
du_refl_78 v0 v1
  = case coe v1 of
      []
        -> coe
             MAlonzo.Code.Cubed.Level.C_liftℓ_32
             (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
      (:) v2 v3
        -> coe
             MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
             (coe MAlonzo.Code.Cubed.Id.Base.d_refl'8347'_50 v0 v2)
             (coe du_refl_78 (coe v0) (coe v3))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base._++_
d__'43''43'__84 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> [AgdaAny] -> [AgdaAny]
d__'43''43'__84 ~v0 ~v1 v2 v3 = du__'43''43'__84 v2 v3
du__'43''43'__84 :: [AgdaAny] -> [AgdaAny] -> [AgdaAny]
du__'43''43'__84 v0 v1
  = case coe v0 of
      [] -> coe v1
      (:) v2 v3
        -> coe
             MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v2)
             (coe du__'43''43'__84 (coe v3) (coe v1))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base.foldl
d_foldl_94 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> [AgdaAny] -> AgdaAny
d_foldl_94 ~v0 ~v1 ~v2 ~v3 v4 v5 v6 = du_foldl_94 v4 v5 v6
du_foldl_94 ::
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> [AgdaAny] -> AgdaAny
du_foldl_94 v0 v1 v2
  = case coe v2 of
      [] -> coe v1
      (:) v3 v4 -> coe du_foldl_94 (coe v0) (coe v0 v1 v3) (coe v4)
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base.foldr
d_foldr_108 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> [AgdaAny] -> AgdaAny
d_foldr_108 ~v0 ~v1 ~v2 ~v3 v4 v5 v6 = du_foldr_108 v4 v5 v6
du_foldr_108 ::
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> [AgdaAny] -> AgdaAny
du_foldr_108 v0 v1 v2
  = case coe v2 of
      [] -> coe v1
      (:) v3 v4
        -> coe v0 v3 (coe du_foldr_108 (coe v0) (coe v1) (coe v4))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base.flatten
d_flatten_122 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [[AgdaAny]] -> [AgdaAny]
d_flatten_122 ~v0 ~v1 = du_flatten_122
du_flatten_122 :: [[AgdaAny]] -> [AgdaAny]
du_flatten_122
  = coe
      du_foldr_108 (coe du__'43''43'__84)
      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
-- Cubed.Data.List.Base.flat-map
d_flat'45'map_124 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> (AgdaAny -> [AgdaAny]) -> [AgdaAny] -> [AgdaAny]
d_flat'45'map_124 ~v0 ~v1 ~v2 ~v3 v4 v5 = du_flat'45'map_124 v4 v5
du_flat'45'map_124 ::
  (AgdaAny -> [AgdaAny]) -> [AgdaAny] -> [AgdaAny]
du_flat'45'map_124 v0 v1
  = coe du_flatten_122 (coe du_map_40 (coe v0) (coe v1))
-- Cubed.Data.List.Base.bind
d_bind_128 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> (AgdaAny -> [AgdaAny]) -> [AgdaAny]
d_bind_128 ~v0 ~v1 ~v2 ~v3 v4 v5 = du_bind_128 v4 v5
du_bind_128 :: [AgdaAny] -> (AgdaAny -> [AgdaAny]) -> [AgdaAny]
du_bind_128 v0 v1 = coe du_flat'45'map_124 (coe v1) (coe v0)
-- Cubed.Data.List.Base.seq
d_seq_130 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny -> AgdaAny] -> [AgdaAny] -> [AgdaAny]
d_seq_130 ~v0 ~v1 ~v2 ~v3 v4 v5 = du_seq_130 v4 v5
du_seq_130 :: [AgdaAny -> AgdaAny] -> [AgdaAny] -> [AgdaAny]
du_seq_130 v0 v1
  = coe
      du_bind_128 (coe v0)
      (coe
         (\ v2 ->
            coe
              du_bind_128 (coe v1)
              (coe
                 (\ v3 ->
                    coe
                      MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v2 v3)
                      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)))))
-- Cubed.Data.List.Base.filter-map
d_filter'45'map_140 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> (AgdaAny -> Maybe AgdaAny) -> [AgdaAny] -> [AgdaAny]
d_filter'45'map_140 ~v0 ~v1 ~v2 ~v3 v4 = du_filter'45'map_140 v4
du_filter'45'map_140 ::
  (AgdaAny -> Maybe AgdaAny) -> [AgdaAny] -> [AgdaAny]
du_filter'45'map_140 v0
  = coe
      du_foldr_108
      (coe
         (\ v1 ->
            coe
              MAlonzo.Code.Cubed.Data.Maybe.Base.du_rec_12 (coe (\ v2 -> v2))
              (coe MAlonzo.Code.Agda.Builtin.List.C__'8759'__22) (coe v0 v1)))
      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
-- Cubed.Data.List.Base.reverse
d_reverse_144 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> [AgdaAny]
d_reverse_144 ~v0 ~v1 = du_reverse_144
du_reverse_144 :: [AgdaAny] -> [AgdaAny]
du_reverse_144
  = coe
      du_foldl_94
      (coe
         (\ v0 v1 ->
            coe
              MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v1) (coe v0)))
      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
-- Cubed.Data.List.Base.down-from
d_down'45'from_146 :: Integer -> [Integer]
d_down'45'from_146 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (coe
                MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v1)
                (coe d_down'45'from_146 (coe v1)))
-- Cubed.Data.List.Base.pop
d_pop_150 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_pop_150 ~v0 ~v1 v2 = du_pop_150 v2
du_pop_150 ::
  [AgdaAny] -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_pop_150 v0
  = case coe v0 of
      [] -> coe MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18
      (:) v1 v2
        -> coe
             MAlonzo.Code.Agda.Builtin.Maybe.C_just_16
             (coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v1) (coe v2))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base.head
d_head_156 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> Maybe AgdaAny
d_head_156 ~v0 ~v1 v2 = du_head_156 v2
du_head_156 :: [AgdaAny] -> Maybe AgdaAny
du_head_156 v0
  = coe
      MAlonzo.Code.Cubed.Data.Maybe.Base.du_map_24
      (coe (\ v1 -> MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe v1)))
      (coe du_pop_150 (coe v0))
-- Cubed.Data.List.Base.tail
d_tail_158 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> Maybe [AgdaAny]
d_tail_158 ~v0 ~v1 v2 = du_tail_158 v2
du_tail_158 :: [AgdaAny] -> Maybe [AgdaAny]
du_tail_158 v0
  = case coe v0 of
      [] -> coe MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18
      (:) v1 v2 -> coe MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe v2)
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base.take
d_take_164 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> [AgdaAny] -> [AgdaAny]
d_take_164 ~v0 ~v1 v2 v3 = du_take_164 v2 v3
du_take_164 :: Integer -> [AgdaAny] -> [AgdaAny]
du_take_164 v0 v1
  = case coe v0 of
      0 -> coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (case coe v1 of
                [] -> coe v1
                (:) v3 v4
                  -> coe
                       MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v3)
                       (coe du_take_164 (coe v2) (coe v4))
                _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Data.List.Base.drop
d_drop_176 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> [AgdaAny] -> [AgdaAny]
d_drop_176 ~v0 ~v1 v2 v3 = du_drop_176 v2 v3
du_drop_176 :: Integer -> [AgdaAny] -> [AgdaAny]
du_drop_176 v0 v1
  = case coe v0 of
      0 -> coe v1
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (case coe v1 of
                [] -> coe v1
                (:) v3 v4 -> coe du_drop_176 (coe v2) (coe v4)
                _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Data.List.Base.split-at
d_split'45'at_188 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  Integer -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_split'45'at_188 ~v0 ~v1 v2 v3 = du_split'45'at_188 v2 v3
du_split'45'at_188 ::
  Integer -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_split'45'at_188 v0 v1
  = case coe v0 of
      0 -> coe
             MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
             (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16) (coe v1)
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (case coe v1 of
                []
                  -> coe
                       MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v1) (coe v1)
                (:) v3 v4
                  -> coe
                       MAlonzo.Code.Cubed.Data.Prod.Base.du_map'45'fst_36
                       (coe MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v3))
                       (coe du_split'45'at_188 (coe v2) (coe v4))
                _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Data.List.Base.chunked
d_chunked_202 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> [AgdaAny] -> [[AgdaAny]]
d_chunked_202 ~v0 ~v1 v2 = du_chunked_202 v2
du_chunked_202 :: Integer -> [AgdaAny] -> [[AgdaAny]]
du_chunked_202 v0
  = case coe v0 of
      0 -> let v1 = coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16 in
           coe (coe (\ v2 -> v1))
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (coe
                (\ v2 ->
                   let v3
                         = MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe du_go_210 v1 v2) in
                   coe
                     (case coe v3 of
                        MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v4 v5
                          -> coe
                               MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v4) (coe v5)
                        _ -> MAlonzo.RTE.mazUnreachableError)))
-- Cubed.Data.List.Base._.go
d_go_210 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  Integer ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_go_210 ~v0 ~v1 v2 ~v3 ~v4 = du_go_210 v2
du_go_210 ::
  Integer -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_go_210 v0
  = coe
      du_foldl_94
      (coe
         (\ v1 v2 ->
            case coe v1 of
              MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v3 v4
                -> case coe v3 of
                     0 -> case coe v4 of
                            MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v5 v6
                              -> coe
                                   MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v0)
                                   (coe
                                      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                      (coe
                                         MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v2)
                                         (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16))
                                      (coe
                                         MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v5)
                                         (coe v6)))
                            _ -> MAlonzo.RTE.mazUnreachableError
                     _ -> let v5 = subInt (coe v3) (coe (1 :: Integer)) in
                          coe
                            (case coe v4 of
                               MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v6 v7
                                 -> coe
                                      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v5)
                                      (coe
                                         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                         (coe
                                            MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v2)
                                            (coe v6))
                                         (coe v7))
                               _ -> MAlonzo.RTE.mazUnreachableError)
              _ -> MAlonzo.RTE.mazUnreachableError))
      (coe
         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
         (coe addInt (coe (1 :: Integer)) (coe v0))
         (coe
            MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
            (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
            (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)))
-- Cubed.Data.List.Base.Is-empty
d_Is'45'empty_232 a0 a1 a2 = ()
data T_Is'45'empty_232 = C_'91''93'_238
-- Cubed.Data.List.Base.is-emptyᵇ
d_is'45'empty'7495'_240 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> () -> [AgdaAny] -> Bool
d_is'45'empty'7495'_240 ~v0 ~v1 v2 = du_is'45'empty'7495'_240 v2
du_is'45'empty'7495'_240 :: [AgdaAny] -> Bool
du_is'45'empty'7495'_240 v0
  = case coe v0 of
      [] -> coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10
      (:) v1 v2 -> coe MAlonzo.Code.Agda.Builtin.Bool.C_false_8
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base.split-byᵇ
d_split'45'by'7495'_242 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> (AgdaAny -> Bool) -> [AgdaAny] -> [[AgdaAny]]
d_split'45'by'7495'_242 ~v0 ~v1 v2 v3
  = du_split'45'by'7495'_242 v2 v3
du_split'45'by'7495'_242 ::
  (AgdaAny -> Bool) -> [AgdaAny] -> [[AgdaAny]]
du_split'45'by'7495'_242 v0 v1
  = let v2 = coe du_go_248 v0 v1 in
    coe
      (case coe v2 of
         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v3 v4
           -> coe
                MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v3) (coe v4)
         _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Data.List.Base._.go
d_go_248 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> Bool) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_go_248 ~v0 ~v1 ~v2 ~v3 v4 = du_go_248 v4
du_go_248 ::
  (AgdaAny -> Bool) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_go_248 v0
  = coe
      du_foldl_94
      (coe
         (\ v1 v2 ->
            coe
              MAlonzo.Code.Cubed.Data.Bool.Base.du_if'7495'_then_else__14
              (coe v0 v2)
              (coe
                 MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                 (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
                 (coe
                    MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                    (coe MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe v1))
                    (coe MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe v1))))
              (coe
                 MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                 (coe
                    MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v2)
                    (coe MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe v1)))
                 (coe MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe v1)))))
      (coe
         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
         (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
         (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16))
