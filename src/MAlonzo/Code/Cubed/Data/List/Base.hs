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
import qualified MAlonzo.Code.Agda.Primitive.Cubical
import qualified MAlonzo.Code.Cubed.Data.Bool.Base
import qualified MAlonzo.Code.Cubed.Data.Maybe.Base
import qualified MAlonzo.Code.Cubed.Data.Prod.Base
import qualified MAlonzo.Code.Cubed.Level
import qualified MAlonzo.Code.Cubed.Path.Base

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
  () -> [AgdaAny] -> [AgdaAny] -> ()
d__'8801'__56 = erased
-- Cubed.Data.List.Base.refl
d_refl_76 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> AgdaAny
d_refl_76 ~v0 ~v1 v2 = du_refl_76 v2
du_refl_76 :: [AgdaAny] -> AgdaAny
du_refl_76 v0
  = case coe v0 of
      []
        -> coe
             MAlonzo.Code.Cubed.Level.C_liftℓ_32
             (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
      (:) v1 v2
        -> coe
             MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe (\ v3 -> v1))
             (coe du_refl_76 (coe v2))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base.≡→Path
d_'8801''8594'Path_86 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  [AgdaAny] ->
  [AgdaAny] ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> [AgdaAny]
d_'8801''8594'Path_86 ~v0 ~v1 v2 v3 v4
  = du_'8801''8594'Path_86 v2 v3 v4
du_'8801''8594'Path_86 ::
  [AgdaAny] ->
  [AgdaAny] ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> [AgdaAny]
du_'8801''8594'Path_86 v0 v1 v2
  = case coe v0 of
      [] -> coe seq (coe v1) (coe (\ v3 -> v0))
      (:) v3 v4
        -> case coe v1 of
             [] -> coe (\ v5 -> MAlonzo.RTE.mazUnreachableError)
             (:) v5 v6
               -> case coe v2 of
                    MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v7 v8
                      -> coe
                           (\ v9 ->
                              coe
                                MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v7 v9)
                                (coe du_'8801''8594'Path_86 v4 v6 v8 v9))
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base.path-to-refl
d_path'45'to'45'refl_112 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  [AgdaAny] ->
  [AgdaAny] ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
d_path'45'to'45'refl_112 v0 ~v1 v2 v3 v4
  = du_path'45'to'45'refl_112 v0 v2 v3 v4
du_path'45'to'45'refl_112 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  [AgdaAny] ->
  [AgdaAny] ->
  AgdaAny -> MAlonzo.Code.Agda.Primitive.Cubical.T_I_8 -> AgdaAny
du_path'45'to'45'refl_112 v0 v1 v2 v3
  = case coe v1 of
      []
        -> coe
             seq (coe v2)
             (coe
                (\ v4 ->
                   coe
                     MAlonzo.Code.Cubed.Level.C_liftℓ_32
                     (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
      (:) v4 v5
        -> case coe v2 of
             [] -> coe (\ v6 -> MAlonzo.RTE.mazUnreachableError)
             (:) v6 v7
               -> case coe v3 of
                    MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v8 v9
                      -> coe
                           (\ v10 ->
                              coe
                                MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                (coe
                                   MAlonzo.Code.Cubed.Path.Base.du_path'45'to'45'refl_272 v0 v4 v8
                                   v10)
                                (coe du_path'45'to'45'refl_112 v0 v5 v7 v9 v10))
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base._++_
d__'43''43'__130 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> [AgdaAny] -> [AgdaAny]
d__'43''43'__130 ~v0 ~v1 v2 v3 = du__'43''43'__130 v2 v3
du__'43''43'__130 :: [AgdaAny] -> [AgdaAny] -> [AgdaAny]
du__'43''43'__130 v0 v1
  = case coe v0 of
      [] -> coe v1
      (:) v2 v3
        -> coe
             MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v2)
             (coe du__'43''43'__130 (coe v3) (coe v1))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base.foldl
d_foldl_140 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> [AgdaAny] -> AgdaAny
d_foldl_140 ~v0 ~v1 ~v2 ~v3 v4 v5 v6 = du_foldl_140 v4 v5 v6
du_foldl_140 ::
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> [AgdaAny] -> AgdaAny
du_foldl_140 v0 v1 v2
  = case coe v2 of
      [] -> coe v1
      (:) v3 v4 -> coe du_foldl_140 (coe v0) (coe v0 v1 v3) (coe v4)
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base.foldr
d_foldr_154 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> [AgdaAny] -> AgdaAny
d_foldr_154 ~v0 ~v1 ~v2 ~v3 v4 v5 v6 = du_foldr_154 v4 v5 v6
du_foldr_154 ::
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> [AgdaAny] -> AgdaAny
du_foldr_154 v0 v1 v2
  = case coe v2 of
      [] -> coe v1
      (:) v3 v4
        -> coe v0 v3 (coe du_foldr_154 (coe v0) (coe v1) (coe v4))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base.flatten
d_flatten_168 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [[AgdaAny]] -> [AgdaAny]
d_flatten_168 ~v0 ~v1 = du_flatten_168
du_flatten_168 :: [[AgdaAny]] -> [AgdaAny]
du_flatten_168
  = coe
      du_foldr_154 (coe du__'43''43'__130)
      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
-- Cubed.Data.List.Base.flat-map
d_flat'45'map_170 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> (AgdaAny -> [AgdaAny]) -> [AgdaAny] -> [AgdaAny]
d_flat'45'map_170 ~v0 ~v1 ~v2 ~v3 v4 v5 = du_flat'45'map_170 v4 v5
du_flat'45'map_170 ::
  (AgdaAny -> [AgdaAny]) -> [AgdaAny] -> [AgdaAny]
du_flat'45'map_170 v0 v1
  = coe du_flatten_168 (coe du_map_40 (coe v0) (coe v1))
-- Cubed.Data.List.Base.bind
d_bind_174 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> (AgdaAny -> [AgdaAny]) -> [AgdaAny]
d_bind_174 ~v0 ~v1 ~v2 ~v3 v4 v5 = du_bind_174 v4 v5
du_bind_174 :: [AgdaAny] -> (AgdaAny -> [AgdaAny]) -> [AgdaAny]
du_bind_174 v0 v1 = coe du_flat'45'map_170 (coe v1) (coe v0)
-- Cubed.Data.List.Base.seq
d_seq_176 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny -> AgdaAny] -> [AgdaAny] -> [AgdaAny]
d_seq_176 ~v0 ~v1 ~v2 ~v3 v4 v5 = du_seq_176 v4 v5
du_seq_176 :: [AgdaAny -> AgdaAny] -> [AgdaAny] -> [AgdaAny]
du_seq_176 v0 v1
  = coe
      du_bind_174 (coe v0)
      (coe
         (\ v2 ->
            coe
              du_bind_174 (coe v1)
              (coe
                 (\ v3 ->
                    coe
                      MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v2 v3)
                      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)))))
-- Cubed.Data.List.Base.filter-map
d_filter'45'map_186 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> (AgdaAny -> Maybe AgdaAny) -> [AgdaAny] -> [AgdaAny]
d_filter'45'map_186 ~v0 ~v1 ~v2 ~v3 v4 = du_filter'45'map_186 v4
du_filter'45'map_186 ::
  (AgdaAny -> Maybe AgdaAny) -> [AgdaAny] -> [AgdaAny]
du_filter'45'map_186 v0
  = coe
      du_foldr_154
      (coe
         (\ v1 ->
            coe
              MAlonzo.Code.Cubed.Data.Maybe.Base.du_rec_12 (coe (\ v2 -> v2))
              (coe MAlonzo.Code.Agda.Builtin.List.C__'8759'__22) (coe v0 v1)))
      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
-- Cubed.Data.List.Base.reverse
d_reverse_190 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> [AgdaAny]
d_reverse_190 ~v0 ~v1 = du_reverse_190
du_reverse_190 :: [AgdaAny] -> [AgdaAny]
du_reverse_190
  = coe
      du_foldl_140
      (coe
         (\ v0 v1 ->
            coe
              MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v1) (coe v0)))
      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
-- Cubed.Data.List.Base.down-from
d_down'45'from_192 :: Integer -> [Integer]
d_down'45'from_192 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (coe
                MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v1)
                (coe d_down'45'from_192 (coe v1)))
-- Cubed.Data.List.Base.pop
d_pop_196 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_pop_196 ~v0 ~v1 v2 = du_pop_196 v2
du_pop_196 ::
  [AgdaAny] -> Maybe MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_pop_196 v0
  = case coe v0 of
      [] -> coe MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18
      (:) v1 v2
        -> coe
             MAlonzo.Code.Agda.Builtin.Maybe.C_just_16
             (coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v1) (coe v2))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base.head
d_head_202 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> Maybe AgdaAny
d_head_202 ~v0 ~v1 v2 = du_head_202 v2
du_head_202 :: [AgdaAny] -> Maybe AgdaAny
du_head_202 v0
  = coe
      MAlonzo.Code.Cubed.Data.Maybe.Base.du_map_24
      (coe (\ v1 -> MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe v1)))
      (coe du_pop_196 (coe v0))
-- Cubed.Data.List.Base.tail
d_tail_204 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> Maybe [AgdaAny]
d_tail_204 ~v0 ~v1 v2 = du_tail_204 v2
du_tail_204 :: [AgdaAny] -> Maybe [AgdaAny]
du_tail_204 v0
  = case coe v0 of
      [] -> coe MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18
      (:) v1 v2 -> coe MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe v2)
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base.take
d_take_210 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> [AgdaAny] -> [AgdaAny]
d_take_210 ~v0 ~v1 v2 v3 = du_take_210 v2 v3
du_take_210 :: Integer -> [AgdaAny] -> [AgdaAny]
du_take_210 v0 v1
  = case coe v0 of
      0 -> coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (case coe v1 of
                [] -> coe v1
                (:) v3 v4
                  -> coe
                       MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v3)
                       (coe du_take_210 (coe v2) (coe v4))
                _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Data.List.Base.drop
d_drop_222 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> [AgdaAny] -> [AgdaAny]
d_drop_222 ~v0 ~v1 v2 v3 = du_drop_222 v2 v3
du_drop_222 :: Integer -> [AgdaAny] -> [AgdaAny]
du_drop_222 v0 v1
  = case coe v0 of
      0 -> coe v1
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (case coe v1 of
                [] -> coe v1
                (:) v3 v4 -> coe du_drop_222 (coe v2) (coe v4)
                _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Data.List.Base.split-at
d_split'45'at_234 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  Integer -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_split'45'at_234 ~v0 ~v1 v2 v3 = du_split'45'at_234 v2 v3
du_split'45'at_234 ::
  Integer -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_split'45'at_234 v0 v1
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
                       (coe du_split'45'at_234 (coe v2) (coe v4))
                _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Data.List.Base.chunked
d_chunked_248 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> Integer -> [AgdaAny] -> [[AgdaAny]]
d_chunked_248 ~v0 ~v1 v2 = du_chunked_248 v2
du_chunked_248 :: Integer -> [AgdaAny] -> [[AgdaAny]]
du_chunked_248 v0
  = case coe v0 of
      0 -> coe (\ v1 -> coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (coe
                (\ v2 ->
                   let v3
                         = MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe du_go_256 v1 v2) in
                   coe
                     (case coe v3 of
                        MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v4 v5
                          -> coe
                               MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v4) (coe v5)
                        _ -> MAlonzo.RTE.mazUnreachableError)))
-- Cubed.Data.List.Base._.go
d_go_256 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  Integer ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_go_256 ~v0 ~v1 v2 ~v3 ~v4 = du_go_256 v2
du_go_256 ::
  Integer -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_go_256 v0
  = coe
      du_foldl_140
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
d_Is'45'empty_278 a0 a1 a2 = ()
data T_Is'45'empty_278 = C_'91''93'_284
-- Cubed.Data.List.Base.is-emptyᵇ
d_is'45'empty'7495'_286 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 -> () -> [AgdaAny] -> Bool
d_is'45'empty'7495'_286 ~v0 ~v1 v2 = du_is'45'empty'7495'_286 v2
du_is'45'empty'7495'_286 :: [AgdaAny] -> Bool
du_is'45'empty'7495'_286 v0
  = case coe v0 of
      [] -> coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10
      (:) v1 v2 -> coe MAlonzo.Code.Agda.Builtin.Bool.C_false_8
      _ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Data.List.Base.split-byᵇ
d_split'45'by'7495'_288 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () -> (AgdaAny -> Bool) -> [AgdaAny] -> [[AgdaAny]]
d_split'45'by'7495'_288 ~v0 ~v1 v2 v3
  = du_split'45'by'7495'_288 v2 v3
du_split'45'by'7495'_288 ::
  (AgdaAny -> Bool) -> [AgdaAny] -> [[AgdaAny]]
du_split'45'by'7495'_288 v0 v1
  = let v2 = coe du_go_294 v0 v1 in
    coe
      (case coe v2 of
         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v3 v4
           -> coe
                MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v3) (coe v4)
         _ -> MAlonzo.RTE.mazUnreachableError)
-- Cubed.Data.List.Base._.go
d_go_294 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (AgdaAny -> Bool) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_go_294 ~v0 ~v1 ~v2 ~v3 v4 = du_go_294 v4
du_go_294 ::
  (AgdaAny -> Bool) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_go_294 v0
  = coe
      du_foldl_140
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
-- Cubed.Data.List.Base.Elt
d_Elt_310 a0 a1 a2 a3 = ()
data T_Elt_310
  = C_here_318 AgdaAny [AgdaAny] |
    C_there_326 AgdaAny AgdaAny [AgdaAny] T_Elt_310
