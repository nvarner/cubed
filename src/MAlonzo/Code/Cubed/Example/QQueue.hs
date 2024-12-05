{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE EmptyCase #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE QualifiedDo #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}

{-# OPTIONS_GHC -Wno-overlapping-patterns #-}

module MAlonzo.Code.Cubed.Example.QQueue where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.IO
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Maybe
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.String
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Cubed.Data.Char.Base
import qualified MAlonzo.Code.Cubed.Data.List.Base
import qualified MAlonzo.Code.Cubed.Data.List.Effectful
import qualified MAlonzo.Code.Cubed.Data.Maybe.Base
import qualified MAlonzo.Code.Cubed.Data.Maybe.Effectful
import qualified MAlonzo.Code.Cubed.Data.QQueue.Banker.Base
import qualified MAlonzo.Code.Cubed.Data.QQueue.Base
import qualified MAlonzo.Code.Cubed.Data.QQueue.Batched.Base
import qualified MAlonzo.Code.Cubed.Data.QQueue.Effectful
import qualified MAlonzo.Code.Cubed.Data.QQueue.RealZ45Ztime.Base
import qualified MAlonzo.Code.Cubed.Data.String.Base
import qualified MAlonzo.Code.Cubed.Effect.Foldable
import qualified MAlonzo.Code.Cubed.Effect.Functor
import qualified MAlonzo.Code.Cubed.Effect.Monad
import qualified MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans
import qualified MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base
import qualified MAlonzo.Code.Cubed.Effect.Traversable
import qualified MAlonzo.Code.Cubed.IO.Base
import qualified MAlonzo.Code.Cubed.IO.Effectful

-- Cubed.Example.Queue.Queue-option
d_Queue'45'option_10 = ()
data T_Queue'45'option_10
  = C_Batched_12 | C_Banker_14 | C_Real'45'time_16
-- Cubed.Example.Queue.queue-by-name
d_queue'45'by'45'name_18 ::
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  Maybe T_Queue'45'option_10
d_queue'45'by'45'name_18 !v0
  = let !v1 = coe MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18 in
    coe
      (case coe v0 of
         !l
           | (==) l ("banker" :: Data.Text.Text) ->
             coe MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe C_Banker_14)
         !l
           | (==) l ("batched" :: Data.Text.Text) ->
             coe MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe C_Batched_12)
         !l
           | (==) l ("real-time" :: Data.Text.Text) ->
             coe
               MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 (coe C_Real'45'time_16)
         !_ -> coe v1)
-- Cubed.Example.Queue.queue-to-name
d_queue'45'to'45'name_22 ::
  T_Queue'45'option_10 -> MAlonzo.Code.Agda.Builtin.String.T_String_6
d_queue'45'to'45'name_22 !v0
  = case coe v0 of
      !(C_Batched_12) -> coe ("batched" :: Data.Text.Text)
      !(C_Banker_14) -> coe ("banker" :: Data.Text.Text)
      !(C_Real'45'time_16) -> coe ("real-time" :: Data.Text.Text)
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.Queue.Config
d_Config_24 = ()
data T_Config_24
  = C_Config'46'constructor_177 !Integer !Integer !Integer
                                !T_Queue'45'option_10
-- Cubed.Example.Queue.Config.initial-load
d_initial'45'load_34 :: T_Config_24 -> Integer
d_initial'45'load_34 !v0
  = case coe v0 of
      !(C_Config'46'constructor_177 v1 v2 v3 v4) -> coe v1
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.Queue.Config.chunk-size
d_chunk'45'size_36 :: T_Config_24 -> Integer
d_chunk'45'size_36 !v0
  = case coe v0 of
      !(C_Config'46'constructor_177 v1 v2 v3 v4) -> coe v2
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.Queue.Config.num-chunks
d_num'45'chunks_38 :: T_Config_24 -> Integer
d_num'45'chunks_38 !v0
  = case coe v0 of
      !(C_Config'46'constructor_177 v1 v2 v3 v4) -> coe v3
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.Queue.Config.queue
d_queue_40 :: T_Config_24 -> T_Queue'45'option_10
d_queue_40 !v0
  = case coe v0 of
      !(C_Config'46'constructor_177 v1 v2 v3 v4) -> coe v4
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.Queue.Chunks
d_Chunks_42 = ()
data T_Chunks_42
  = C_mk_60 !Integer !Integer ![Integer] ![[Integer]]
-- Cubed.Example.Queue.Chunks.initial-load
d_initial'45'load_52 :: T_Chunks_42 -> Integer
d_initial'45'load_52 !v0
  = case coe v0 of
      !(C_mk_60 v1 v2 v3 v4) -> coe v1
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.Queue.Chunks.chunk-size
d_chunk'45'size_54 :: T_Chunks_42 -> Integer
d_chunk'45'size_54 !v0
  = case coe v0 of
      !(C_mk_60 v1 v2 v3 v4) -> coe v2
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.Queue.Chunks.initial
d_initial_56 :: T_Chunks_42 -> [Integer]
d_initial_56 !v0
  = case coe v0 of
      !(C_mk_60 v1 v2 v3 v4) -> coe v3
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.Queue.Chunks.chunks
d_chunks_58 :: T_Chunks_42 -> [[Integer]]
d_chunks_58 !v0
  = case coe v0 of
      !(C_mk_60 v1 v2 v3 v4) -> coe v4
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.Queue.parse-nat
d_parse'45'nat_62 ::
  MAlonzo.Code.Agda.Builtin.String.T_String_6 -> Maybe Integer
d_parse'45'nat_62 !v0
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
      (coe MAlonzo.Code.Cubed.Data.Maybe.Effectful.du_monad_14)
      (coe
         MAlonzo.Code.Cubed.Effect.Traversable.du_mapM_38
         (coe MAlonzo.Code.Cubed.Data.List.Effectful.du_traversable_24) ()
         (coe MAlonzo.Code.Cubed.Data.Maybe.Effectful.du_monad_14)
         MAlonzo.Code.Cubed.Data.Char.Base.d_parse'45'digit_10
         (coe MAlonzo.Code.Agda.Builtin.String.d_primStringToList_12 v0))
      (\ !v1 ->
         coe
           MAlonzo.Code.Agda.Builtin.Maybe.C_just_16
           (coe
              MAlonzo.Code.Cubed.Data.List.Base.du_foldl_94
              (coe (\ !v2 -> addInt (coe mulInt (coe (10 :: Integer)) (coe v2))))
              (coe (0 :: Integer)) (coe v1)))
-- Cubed.Example.Queue.parse-input
d_parse'45'input_76 ::
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.Agda.Builtin.IO.T_IO_8 AgdaAny (Maybe [Integer])
d_parse'45'input_76 !v0
  = coe
      MAlonzo.Code.Cubed.IO.Base.d_pure_10 () erased
      (coe
         MAlonzo.Code.Cubed.Effect.Traversable.du_mapM_38
         (coe MAlonzo.Code.Cubed.Data.List.Effectful.du_traversable_24) ()
         (coe MAlonzo.Code.Cubed.Data.Maybe.Effectful.du_monad_14)
         d_parse'45'nat_62
         (MAlonzo.Code.Cubed.Data.String.Base.d_split'45'by'7495'_12
            (coe MAlonzo.Code.Cubed.Data.Char.Base.d__'8801''7495'__8 ' ')
            (coe v0)))
-- Cubed.Example.Queue.setup
d_setup_86 ::
  MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.T_ReaderT_62
d_setup_86
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
         (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ())))
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
         (let !v0
                = coe
                    MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                    ("preparing for test..." :: Data.Text.Text) in
          coe (coe (\ !v1 -> v0))))
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
         (coe
            MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
            (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ())))
         (coe
            MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
            (coe
               (\ !v0 ->
                  coe
                    MAlonzo.Code.Cubed.IO.Base.d_pure_10 () erased
                    (d_queue_40 (coe v0)))))
         (\ !v0 ->
            coe
              MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
              (coe
                 MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                 (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ())))
              (coe
                 MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                 (coe
                    (\ !v1 ->
                       coe
                         MAlonzo.Code.Cubed.IO.Base.d_pure_10 () erased
                         (d_initial'45'load_34 (coe v1)))))
              (\ !v1 ->
                 coe
                   MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
                   (coe
                      MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                      (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ())))
                   (coe
                      MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                      (coe
                         (\ !v2 ->
                            coe
                              MAlonzo.Code.Cubed.IO.Base.d_pure_10 () erased
                              (d_chunk'45'size_36 (coe v2)))))
                   (\ !v2 ->
                      coe
                        MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
                        (coe
                           MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                           (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ())))
                        (coe
                           MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                           (coe
                              (\ !v3 ->
                                 coe
                                   MAlonzo.Code.Cubed.IO.Base.d_pure_10 () erased
                                   (d_num'45'chunks_38 (coe v3)))))
                        (\ !v3 ->
                           coe
                             MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
                             (coe
                                MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                                (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ())))
                             (coe
                                MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                                (let !v4
                                       = coe
                                           MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                                           (coe
                                              MAlonzo.Code.Cubed.Data.String.Base.d__'43''43'__10
                                              ("queue: " :: Data.Text.Text)
                                              (d_queue'45'to'45'name_22 (coe v0))) in
                                 coe (coe (\ !v5 -> v4))))
                             (coe
                                MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
                                (coe
                                   MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                                   (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ())))
                                (coe
                                   MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                                   (let !v4
                                          = coe
                                              MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                                              (coe
                                                 MAlonzo.Code.Cubed.Data.String.Base.d__'43''43'__10
                                                 ("initial load: " :: Data.Text.Text)
                                                 (coe
                                                    MAlonzo.Code.Agda.Builtin.String.d_primShowNat_24
                                                    v1)) in
                                    coe (coe (\ !v5 -> v4))))
                                (coe
                                   MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
                                   (coe
                                      MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                                      (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ())))
                                   (coe
                                      MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                                      (let !v4
                                             = coe
                                                 MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                                                 (coe
                                                    MAlonzo.Code.Cubed.Data.String.Base.d__'43''43'__10
                                                    ("chunk size: " :: Data.Text.Text)
                                                    (coe
                                                       MAlonzo.Code.Agda.Builtin.String.d_primShowNat_24
                                                       v2)) in
                                       coe (coe (\ !v5 -> v4))))
                                   (coe
                                      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
                                      (coe
                                         MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                                         (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ())))
                                      (coe
                                         MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                                         (let !v4
                                                = coe
                                                    MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                                                    (coe
                                                       MAlonzo.Code.Cubed.Data.String.Base.d__'43''43'__10
                                                       ("num chunks: " :: Data.Text.Text)
                                                       (coe
                                                          MAlonzo.Code.Agda.Builtin.String.d_primShowNat_24
                                                          v3)) in
                                          coe (coe (\ !v5 -> v4))))
                                      (coe
                                         MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
                                         (coe
                                            MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                                            (coe
                                               MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ())))
                                         (coe
                                            MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                                            (let !v4
                                                   = coe
                                                       MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                                                       ("preparations complete"
                                                        ::
                                                        Data.Text.Text) in
                                             coe (coe (\ !v5 -> v4))))
                                         (coe
                                            MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                                            (let !v4
                                                   = coe
                                                       MAlonzo.Code.Cubed.IO.Base.d_pure_10 ()
                                                       erased
                                                       (coe
                                                          C_mk_60 (coe v1) (coe v2)
                                                          (coe
                                                             MAlonzo.Code.Cubed.Data.List.Base.d_down'45'from_146
                                                             (coe v1))
                                                          (coe
                                                             MAlonzo.Code.Cubed.Data.List.Base.du_chunked_202
                                                             v2
                                                             (MAlonzo.Code.Cubed.Data.List.Base.d_down'45'from_146
                                                                (coe mulInt (coe v2) (coe v3))))) in
                                             coe (coe (\ !v5 -> v4)))))))))))))
-- Cubed.Example.Queue.Experiment.TestAct
d_TestAct_108 ::
  () -> MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24 -> () -> ()
d_TestAct_108 = erased
-- Cubed.Example.Queue.Experiment.snoc-chunk
d_snoc'45'chunk_110 ::
  () ->
  MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24 ->
  [Integer] ->
  MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.T_ReaderT_62
d_snoc'45'chunk_110 ~v0 !v1 !v2 = du_snoc'45'chunk_110 v1 v2
du_snoc'45'chunk_110 ::
  MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24 ->
  [Integer] ->
  MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.T_ReaderT_62
du_snoc'45'chunk_110 !v0 !v1
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
      (let !v2
             = coe
                 MAlonzo.Code.Cubed.Effect.Foldable.du_traverse'45'_78
                 (coe MAlonzo.Code.Cubed.Data.List.Effectful.du_foldable_22) ()
                 (coe
                    MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_applicative_102
                    (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ())))
                 (coe
                    MAlonzo.Code.Cubed.Data.QQueue.Effectful.du_snoc_30 (coe v0)
                    (coe
                       MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad'45'state_148
                       (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))))
                 v1 in
       coe (coe (\ !v3 -> v2)))
-- Cubed.Example.Queue.Experiment.pull-chunk
d_pull'45'chunk_112 ::
  () ->
  MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24 ->
  Integer ->
  MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.T_ReaderT_62
d_pull'45'chunk_112 ~v0 !v1 !v2 = du_pull'45'chunk_112 v1 v2
du_pull'45'chunk_112 ::
  MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24 ->
  Integer ->
  MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.T_ReaderT_62
du_pull'45'chunk_112 !v0 !v1
  = coe
      MAlonzo.Code.Cubed.Effect.Functor.du__'60''36''62'__28
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_functor_76
         (coe
            MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_functor_94
            (coe MAlonzo.Code.Cubed.IO.Effectful.d_functor_8 (coe ()))))
      (coe
         MAlonzo.Code.Cubed.Data.List.Base.du_filter'45'map_140
         (coe (\ !v2 -> v2)))
      (coe
         MAlonzo.Code.Cubed.Effect.Traversable.du_forM_40
         (coe MAlonzo.Code.Cubed.Data.List.Effectful.du_traversable_24)
         (coe ())
         (coe
            MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
            (coe
               MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
               (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))))
         (coe MAlonzo.Code.Cubed.Data.List.Base.d_down'45'from_146 (coe v1))
         (let !v2
                = coe
                    MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                    (let !v2
                           = coe
                               MAlonzo.Code.Cubed.Data.QQueue.Effectful.du_pop_34 (coe v0)
                               (coe
                                  MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad'45'state_148
                                  (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ())))
                               (coe
                                  MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
                                  (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))) in
                     coe (coe (\ !v3 -> v2))) in
          coe (coe (\ !v3 -> v2))))
-- Cubed.Example.Queue.Experiment.print-chunk
d_print'45'chunk_116 ::
  () ->
  MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24 ->
  [Integer] ->
  MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.T_ReaderT_62
d_print'45'chunk_116 ~v0 ~v1 !v2 = du_print'45'chunk_116 v2
du_print'45'chunk_116 ::
  [Integer] ->
  MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.T_ReaderT_62
du_print'45'chunk_116 !v0
  = case coe v0 of
      !([])
        -> coe
             MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
             (let !v1
                    = coe
                        MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.C_mk_80
                        (coe
                           (\ !v1 ->
                              coe
                                MAlonzo.Code.Cubed.Effect.Functor.du__'60''36''62'__28
                                (MAlonzo.Code.Cubed.IO.Effectful.d_functor_8 (coe ()))
                                (\ !v2 ->
                                   coe
                                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v1) (coe v2))
                                (coe
                                   MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                                   ("[empty chunk]" :: Data.Text.Text)))) in
              coe (coe (\ !v2 -> v1)))
      !((:) v1 v2)
        -> coe
             MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
             (let !v3
                    = coe
                        MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.C_mk_80
                        (coe
                           (\ !v3 ->
                              coe
                                MAlonzo.Code.Cubed.Effect.Functor.du__'60''36''62'__28
                                (MAlonzo.Code.Cubed.IO.Effectful.d_functor_8 (coe ()))
                                (\ !v4 ->
                                   coe
                                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v3) (coe v4))
                                (coe
                                   MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                                   (coe
                                      MAlonzo.Code.Cubed.Data.String.Base.d__'43''43'__10
                                      ("[chunk from " :: Data.Text.Text)
                                      (coe
                                         MAlonzo.Code.Cubed.Data.String.Base.d__'43''43'__10
                                         (coe MAlonzo.Code.Agda.Builtin.String.d_primShowNat_24 v1)
                                         ("]" :: Data.Text.Text)))))) in
              coe (coe (\ !v4 -> v3)))
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.Queue.Experiment.test
d_test_122 ::
  () ->
  MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24 ->
  MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.T_ReaderT_62
d_test_122 ~v0 !v1 = du_test_122 v1
du_test_122 ::
  MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24 ->
  MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.T_ReaderT_62
du_test_122 !v0
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
         (coe
            MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
            (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))))
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
         (let !v1
                = coe
                    MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.C_mk_80
                    (coe
                       (\ !v1 ->
                          coe
                            MAlonzo.Code.Cubed.Effect.Functor.du__'60''36''62'__28
                            (MAlonzo.Code.Cubed.IO.Effectful.d_functor_8 (coe ()))
                            (\ !v2 ->
                               coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v1) (coe v2))
                            (coe
                               MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                               ("loading initial chunk" :: Data.Text.Text)))) in
          coe (coe (\ !v2 -> v1))))
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
         (coe
            MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
            (coe
               MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
               (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))))
         (coe
            MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
            (coe
               (\ !v1 ->
                  coe
                    MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.C_mk_80
                    (coe
                       (\ !v2 ->
                          coe
                            MAlonzo.Code.Cubed.IO.Base.d_pure_10 () erased
                            (coe
                               MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v2)
                               (coe d_initial_56 (coe v1))))))))
         (\ !v1 ->
            coe
              MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
              (coe
                 MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                 (coe
                    MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
                    (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))))
              (coe du_snoc'45'chunk_110 (coe v0) (coe v1))
              (coe
                 MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
                 (coe
                    MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                    (coe
                       MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
                       (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))))
                 (coe
                    MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                    (let !v2
                           = coe
                               MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.C_mk_80
                               (coe
                                  (\ !v2 ->
                                     coe
                                       MAlonzo.Code.Cubed.Effect.Functor.du__'60''36''62'__28
                                       (MAlonzo.Code.Cubed.IO.Effectful.d_functor_8 (coe ()))
                                       (\ !v3 ->
                                          coe
                                            MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v2)
                                            (coe v3))
                                       (coe
                                          MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                                          ("cycling through chunks" :: Data.Text.Text)))) in
                     coe (coe (\ !v3 -> v2))))
                 (coe
                    MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
                    (coe
                       MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                       (coe
                          MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
                          (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))))
                    (coe
                       MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                       (coe
                          (\ !v2 ->
                             coe
                               MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.C_mk_80
                               (coe
                                  (\ !v3 ->
                                     coe
                                       MAlonzo.Code.Cubed.IO.Base.d_pure_10 () erased
                                       (coe
                                          MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v3)
                                          (coe d_chunks_58 (coe v2))))))))
                    (\ !v2 ->
                       coe
                         MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
                         (coe
                            MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                            (coe
                               MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
                               (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))))
                         (coe
                            MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                            (coe
                               (\ !v3 ->
                                  coe
                                    MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.C_mk_80
                                    (coe
                                       (\ !v4 ->
                                          coe
                                            MAlonzo.Code.Cubed.IO.Base.d_pure_10 () erased
                                            (coe
                                               MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v4)
                                               (coe d_chunk'45'size_54 (coe v3))))))))
                         (\ !v3 ->
                            coe
                              MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
                              (coe
                                 MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                                 (coe
                                    MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
                                    (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))))
                              (coe
                                 MAlonzo.Code.Cubed.Effect.Foldable.du_for'45'_86
                                 (coe MAlonzo.Code.Cubed.Data.List.Effectful.du_foldable_22)
                                 (coe ())
                                 (coe
                                    MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_applicative_84
                                    (coe
                                       MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
                                       (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))))
                                 (coe v2)
                                 (coe
                                    (\ !v4 ->
                                       coe
                                         MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
                                         (coe
                                            MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                                            (coe
                                               MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
                                               (coe
                                                  MAlonzo.Code.Cubed.IO.Effectful.d_monad_24
                                                  (coe ()))))
                                         (coe du_snoc'45'chunk_110 (coe v0) (coe v4))
                                         (coe
                                            MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
                                            (coe
                                               MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                                               (coe
                                                  MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
                                                  (coe
                                                     MAlonzo.Code.Cubed.IO.Effectful.d_monad_24
                                                     (coe ()))))
                                            (coe du_pull'45'chunk_112 (coe v0) (coe v3))
                                            (coe du_print'45'chunk_116)))))
                              (coe
                                 MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
                                 (coe
                                    MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                                    (coe
                                       MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
                                       (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))))
                                 (coe
                                    MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                                    (let !v4
                                           = coe
                                               MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.C_mk_80
                                               (coe
                                                  (\ !v4 ->
                                                     coe
                                                       MAlonzo.Code.Cubed.Effect.Functor.du__'60''36''62'__28
                                                       (MAlonzo.Code.Cubed.IO.Effectful.d_functor_8
                                                          (coe ()))
                                                       (\ !v5 ->
                                                          coe
                                                            MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                            (coe v4) (coe v5))
                                                       (coe
                                                          MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                                                          ("draining queue" :: Data.Text.Text)))) in
                                     coe (coe (\ !v5 -> v4))))
                                 (coe
                                    MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
                                    (coe
                                       MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                                       (coe
                                          MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
                                          (coe
                                             MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))))
                                    (coe
                                       MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                                       (coe
                                          (\ !v4 ->
                                             coe
                                               MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.C_mk_80
                                               (coe
                                                  (\ !v5 ->
                                                     coe
                                                       MAlonzo.Code.Cubed.IO.Base.d_pure_10 ()
                                                       erased
                                                       (coe
                                                          MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                          (coe v5)
                                                          (coe d_initial'45'load_52 (coe v4))))))))
                                    (\ !v4 ->
                                       coe
                                         MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
                                         (coe
                                            MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                                            (coe
                                               MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
                                               (coe
                                                  MAlonzo.Code.Cubed.IO.Effectful.d_monad_24
                                                  (coe ()))))
                                         (coe
                                            MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
                                            (coe
                                               MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                                               (coe
                                                  MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
                                                  (coe
                                                     MAlonzo.Code.Cubed.IO.Effectful.d_monad_24
                                                     (coe ()))))
                                            (coe du_pull'45'chunk_112 (coe v0) (coe v4))
                                            (coe du_print'45'chunk_116))
                                         (coe
                                            MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                                            (let !v5
                                                   = coe
                                                       MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.C_mk_80
                                                       (coe
                                                          (\ !v5 ->
                                                             coe
                                                               MAlonzo.Code.Cubed.IO.Base.d_pure_10
                                                               () erased
                                                               (coe
                                                                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                                  (coe v5)
                                                                  (coe
                                                                     MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))) in
                                             coe (coe (\ !v6 -> v5)))))))))))))
-- Cubed.Example.Queue.Experiment.run
d_run_134 ::
  () ->
  MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24 ->
  T_Chunks_42 ->
  MAlonzo.Code.Agda.Builtin.IO.T_IO_8
    AgdaAny MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6
d_run_134 ~v0 !v1 !v2 = du_run_134 v1 v2
du_run_134 ::
  MAlonzo.Code.Cubed.Data.QQueue.Base.T_IQueue_24 ->
  T_Chunks_42 ->
  MAlonzo.Code.Agda.Builtin.IO.T_IO_8
    AgdaAny MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6
du_run_134 !v0 !v1
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_eval_82
      (coe MAlonzo.Code.Cubed.IO.Effectful.d_functor_8 (coe ()))
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.d_run_72
         (coe du_test_122 (coe v0)) v1)
      (coe MAlonzo.Code.Cubed.Data.QQueue.Base.d_empty_44 (coe v0))
-- Cubed.Example.Queue.queue-option-to-experiment
d_queue'45'option'45'to'45'experiment_138 ::
  T_Queue'45'option_10 ->
  T_Chunks_42 ->
  MAlonzo.Code.Agda.Builtin.IO.T_IO_8
    AgdaAny MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6
d_queue'45'option'45'to'45'experiment_138 !v0
  = case coe v0 of
      !(C_Batched_12)
        -> coe
             du_run_134
             (coe MAlonzo.Code.Cubed.Data.QQueue.Batched.Base.du_iqueue_76)
      !(C_Banker_14)
        -> coe
             du_run_134
             (coe
                MAlonzo.Code.Cubed.Data.QQueue.Banker.Base.du_iqueue_90 (coe ()))
      !(C_Real'45'time_16)
        -> coe
             du_run_134
             (coe
                MAlonzo.Code.Cubed.Data.QQueue.RealZ45Ztime.Base.du_iqueue_98
                (coe ()))
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.Queue.parse-args
d_parse'45'args_140 ::
  [MAlonzo.Code.Agda.Builtin.String.T_String_6] ->
  MAlonzo.Code.Agda.Builtin.IO.T_IO_8 AgdaAny T_Config_24
d_parse'45'args_140 !v0
  = let !v1
          = coe
              MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
              (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))
              (coe
                 MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                 ("unexpected number of arguments" :: Data.Text.Text))
              (coe
                 d_parse'45'args_140
                 (coe
                    MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                    (coe ("" :: Data.Text.Text))
                    (coe
                       MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                       (coe ("" :: Data.Text.Text))
                       (coe
                          MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                          (coe ("" :: Data.Text.Text))
                          (coe
                             MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                             (coe ("" :: Data.Text.Text))
                             (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)))))) in
    coe
      (case coe v0 of
         !((:) v2 v3)
           -> case coe v3 of
                !((:) v4 v5)
                  -> case coe v5 of
                       !((:) v6 v7)
                         -> case coe v7 of
                              !((:) v8 v9)
                                -> case coe v9 of
                                     !([])
                                       -> coe
                                            MAlonzo.Code.Cubed.IO.Base.d_pure_10 () erased
                                            (coe
                                               C_Config'46'constructor_177
                                               (coe
                                                  MAlonzo.Code.Cubed.Data.Maybe.Base.du_from'45'maybe_32
                                                  (coe (0 :: Integer))
                                                  (coe d_parse'45'nat_62 (coe v4)))
                                               (coe
                                                  MAlonzo.Code.Cubed.Data.Maybe.Base.du_from'45'maybe_32
                                                  (coe (50 :: Integer))
                                                  (coe d_parse'45'nat_62 (coe v6)))
                                               (coe
                                                  MAlonzo.Code.Cubed.Data.Maybe.Base.du_from'45'maybe_32
                                                  (coe (200000 :: Integer))
                                                  (coe d_parse'45'nat_62 (coe v8)))
                                               (coe
                                                  MAlonzo.Code.Cubed.Data.Maybe.Base.du_from'45'maybe_32
                                                  (coe C_Batched_12)
                                                  (coe d_queue'45'by'45'name_18 (coe v2))))
                                     !_ -> coe v1
                              !_ -> coe v1
                       !_ -> coe v1
                !_ -> coe v1
         !_ -> coe v1)
main = coe d_main_158
-- Cubed.Example.Queue.main
d_main_158 ::
  MAlonzo.Code.Agda.Builtin.IO.T_IO_8
    AgdaAny MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6
d_main_158
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
      (MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
         (MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))
         MAlonzo.Code.Cubed.IO.Base.d_get'45'args_18 d_parse'45'args_140)
      (\ !v0 ->
         coe
           MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
           (MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))
           (coe
              MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.d_run_72 d_setup_86
              v0)
           (\ !v1 ->
              coe
                MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
                (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))
                (coe
                   d_queue'45'option'45'to'45'experiment_138 (d_queue_40 (coe v0)) v1)
                (coe
                   MAlonzo.Code.Cubed.IO.Base.d_pure_10 () erased
                   (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))))
