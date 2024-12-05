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
import qualified MAlonzo.Code.Cubed.Data.QQueue.Effectful
import qualified MAlonzo.Code.Cubed.Data.String.Base
import qualified MAlonzo.Code.Cubed.Effect.Foldable
import qualified MAlonzo.Code.Cubed.Effect.Functor
import qualified MAlonzo.Code.Cubed.Effect.Monad
import qualified MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans
import qualified MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base
import qualified MAlonzo.Code.Cubed.Effect.Traversable
import qualified MAlonzo.Code.Cubed.IO.Base
import qualified MAlonzo.Code.Cubed.IO.Effectful

-- Cubed.Example.Queue.Config
d_Config_8 = ()
data T_Config_8 = C_Config'46'constructor_11 !Integer !Integer
-- Cubed.Example.Queue.Config.initial-load
d_initial'45'load_14 :: T_Config_8 -> Integer
d_initial'45'load_14 !v0
  = case coe v0 of
      !(C_Config'46'constructor_11 v1 v2) -> coe v1
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.Queue.Config.chunk-size
d_chunk'45'size_16 :: T_Config_8 -> Integer
d_chunk'45'size_16 !v0
  = case coe v0 of
      !(C_Config'46'constructor_11 v1 v2) -> coe v2
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.Queue.Chunks
d_Chunks_18 = ()
data T_Chunks_18
  = C_mk_36 !Integer !Integer ![Integer] ![[Integer]]
-- Cubed.Example.Queue.Chunks.initial-load
d_initial'45'load_28 :: T_Chunks_18 -> Integer
d_initial'45'load_28 !v0
  = case coe v0 of
      !(C_mk_36 v1 v2 v3 v4) -> coe v1
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.Queue.Chunks.chunk-size
d_chunk'45'size_30 :: T_Chunks_18 -> Integer
d_chunk'45'size_30 !v0
  = case coe v0 of
      !(C_mk_36 v1 v2 v3 v4) -> coe v2
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.Queue.Chunks.initial
d_initial_32 :: T_Chunks_18 -> [Integer]
d_initial_32 !v0
  = case coe v0 of
      !(C_mk_36 v1 v2 v3 v4) -> coe v3
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.Queue.Chunks.chunks
d_chunks_34 :: T_Chunks_18 -> [[Integer]]
d_chunks_34 !v0
  = case coe v0 of
      !(C_mk_36 v1 v2 v3 v4) -> coe v4
      !_ -> MAlonzo.RTE.mazUnreachableError
-- Cubed.Example.Queue.parse-nat
d_parse'45'nat_38 ::
  MAlonzo.Code.Agda.Builtin.String.T_String_6 -> Maybe Integer
d_parse'45'nat_38 !v0
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
              MAlonzo.Code.Cubed.Data.List.Base.du_foldr_108
              (coe
                 (\ !v2 !v3 ->
                    addInt (coe mulInt (coe (10 :: Integer)) (coe v3)) (coe v2)))
              (coe (0 :: Integer)) (coe v1)))
-- Cubed.Example.Queue.parse-input
d_parse'45'input_52 ::
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.Agda.Builtin.IO.T_IO_8 AgdaAny (Maybe [Integer])
d_parse'45'input_52 !v0
  = coe
      MAlonzo.Code.Cubed.IO.Base.d_pure_10 () erased
      (coe
         MAlonzo.Code.Cubed.Effect.Traversable.du_mapM_38
         (coe MAlonzo.Code.Cubed.Data.List.Effectful.du_traversable_24) ()
         (coe MAlonzo.Code.Cubed.Data.Maybe.Effectful.du_monad_14)
         d_parse'45'nat_38
         (MAlonzo.Code.Cubed.Data.String.Base.d_split'45'by'7495'_12
            (coe MAlonzo.Code.Cubed.Data.Char.Base.d__'8801''7495'__8 ' ')
            (coe v0)))
-- Cubed.Example.Queue.setup
d_setup_62 ::
  [Integer] ->
  MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.T_ReaderT_62
d_setup_62 !v0
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
         (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ())))
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
         (let !v1
                = coe
                    MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                    ("preparing for test..." :: Data.Text.Text) in
          coe (coe (\ !v2 -> v1))))
      (coe
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
                    (d_initial'45'load_14 (coe v1)))))
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
                         (d_chunk'45'size_16 (coe v2)))))
              (\ !v2 ->
                 coe
                   MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
                   (coe
                      MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                      (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ())))
                   (coe
                      MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                      (let !v3
                             = coe
                                 MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                                 ("preparations complete" :: Data.Text.Text) in
                       coe (coe (\ !v4 -> v3))))
                   (coe
                      MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                      (let !v3
                             = coe
                                 MAlonzo.Code.Cubed.IO.Base.d_pure_10 () erased
                                 (coe
                                    C_mk_36 (coe v1) (coe v2)
                                    (coe
                                       MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28
                                       (coe
                                          MAlonzo.Code.Cubed.Data.List.Base.du_split'45'at_188
                                          (coe v1) (coe v0)))
                                    (coe
                                       MAlonzo.Code.Cubed.Data.List.Base.du_chunked_202 v2
                                       (MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30
                                          (coe
                                             MAlonzo.Code.Cubed.Data.List.Base.du_split'45'at_188
                                             (coe v1) (coe v0))))) in
                       coe (coe (\ !v4 -> v3)))))))
-- Cubed.Example.Queue.TestAct
d_TestAct_78 :: () -> ()
d_TestAct_78 = erased
-- Cubed.Example.Queue.snoc-chunk
d_snoc'45'chunk_80 ::
  [Integer] ->
  MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.T_ReaderT_62
d_snoc'45'chunk_80 !v0
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
      (let !v1
             = coe
                 MAlonzo.Code.Cubed.Effect.Foldable.du_traverse'45'_78
                 (coe MAlonzo.Code.Cubed.Data.List.Effectful.du_foldable_22) ()
                 (coe
                    MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_applicative_102
                    (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ())))
                 (coe
                    MAlonzo.Code.Cubed.Data.QQueue.Effectful.du_snoc_30
                    (coe
                       MAlonzo.Code.Cubed.Data.QQueue.Banker.Base.du_iqueue_90 (coe ()))
                    (coe
                       MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad'45'state_148
                       (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))))
                 v0 in
       coe (coe (\ !v2 -> v1)))
-- Cubed.Example.Queue.pull-chunk
d_pull'45'chunk_82 ::
  Integer ->
  MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.T_ReaderT_62
d_pull'45'chunk_82 !v0
  = coe
      MAlonzo.Code.Cubed.Effect.Functor.du__'60''36''62'__28
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_functor_76
         (coe
            MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_functor_94
            (coe MAlonzo.Code.Cubed.IO.Effectful.d_functor_8 (coe ()))))
      (coe
         MAlonzo.Code.Cubed.Data.List.Base.du_filter'45'map_140
         (coe (\ !v1 -> v1)))
      (coe
         MAlonzo.Code.Cubed.Effect.Traversable.du_forM_40
         (coe MAlonzo.Code.Cubed.Data.List.Effectful.du_traversable_24)
         (coe ())
         (coe
            MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
            (coe
               MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
               (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))))
         (coe MAlonzo.Code.Cubed.Data.List.Base.d_down'45'from_146 (coe v0))
         (let !v1
                = coe
                    MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                    (let !v1
                           = coe
                               MAlonzo.Code.Cubed.Data.QQueue.Effectful.du_pop_34
                               (coe
                                  MAlonzo.Code.Cubed.Data.QQueue.Banker.Base.du_iqueue_90 (coe ()))
                               (coe
                                  MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad'45'state_148
                                  (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ())))
                               (coe
                                  MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
                                  (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))) in
                     coe (coe (\ !v2 -> v1))) in
          coe (coe (\ !v2 -> v1))))
-- Cubed.Example.Queue.print-chunk
d_print'45'chunk_86 ::
  [Integer] ->
  MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.T_ReaderT_62
d_print'45'chunk_86 !v0
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
-- Cubed.Example.Queue.test
d_test_92 ::
  MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.T_ReaderT_62
d_test_92
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
         (coe
            MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
            (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))))
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
         (let !v0
                = coe
                    MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.C_mk_80
                    (coe
                       (\ !v0 ->
                          coe
                            MAlonzo.Code.Cubed.Effect.Functor.du__'60''36''62'__28
                            (MAlonzo.Code.Cubed.IO.Effectful.d_functor_8 (coe ()))
                            (\ !v1 ->
                               coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v0) (coe v1))
                            (coe
                               MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                               ("loading initial chunk" :: Data.Text.Text)))) in
          coe (coe (\ !v1 -> v0))))
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
               (\ !v0 ->
                  coe
                    MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.C_mk_80
                    (coe
                       (\ !v1 ->
                          coe
                            MAlonzo.Code.Cubed.IO.Base.d_pure_10 () erased
                            (coe
                               MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v1)
                               (coe d_initial_32 (coe v0))))))))
         (\ !v0 ->
            coe
              MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
              (coe
                 MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                 (coe
                    MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
                    (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))))
              (coe d_snoc'45'chunk_80 (coe v0))
              (coe
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
                                          coe
                                            MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v1)
                                            (coe v2))
                                       (coe
                                          MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                                          ("cycling through chunks" :: Data.Text.Text)))) in
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
                                          (coe d_chunks_34 (coe v1))))))))
                    (\ !v1 ->
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
                               (\ !v2 ->
                                  coe
                                    MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.C_mk_80
                                    (coe
                                       (\ !v3 ->
                                          coe
                                            MAlonzo.Code.Cubed.IO.Base.d_pure_10 () erased
                                            (coe
                                               MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v3)
                                               (coe d_chunk'45'size_30 (coe v2))))))))
                         (\ !v2 ->
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
                                 (coe v1)
                                 (coe
                                    (\ !v3 ->
                                       coe
                                         MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
                                         (coe
                                            MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                                            (coe
                                               MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
                                               (coe
                                                  MAlonzo.Code.Cubed.IO.Effectful.d_monad_24
                                                  (coe ()))))
                                         (coe d_snoc'45'chunk_80 (coe v3))
                                         (coe
                                            MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
                                            (coe
                                               MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                                               (coe
                                                  MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
                                                  (coe
                                                     MAlonzo.Code.Cubed.IO.Effectful.d_monad_24
                                                     (coe ()))))
                                            (d_pull'45'chunk_82 (coe v2)) d_print'45'chunk_86))))
                              (coe
                                 MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
                                 (coe
                                    MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.du_monad_92
                                    (coe
                                       MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_monad_126
                                       (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))))
                                 (coe
                                    MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                                    (let !v3
                                           = coe
                                               MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.C_mk_80
                                               (coe
                                                  (\ !v3 ->
                                                     coe
                                                       MAlonzo.Code.Cubed.Effect.Functor.du__'60''36''62'__28
                                                       (MAlonzo.Code.Cubed.IO.Effectful.d_functor_8
                                                          (coe ()))
                                                       (\ !v4 ->
                                                          coe
                                                            MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                            (coe v3) (coe v4))
                                                       (coe
                                                          MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
                                                          ("draining queue" :: Data.Text.Text)))) in
                                     coe (coe (\ !v4 -> v3))))
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
                                          (\ !v3 ->
                                             coe
                                               MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.C_mk_80
                                               (coe
                                                  (\ !v4 ->
                                                     coe
                                                       MAlonzo.Code.Cubed.IO.Base.d_pure_10 ()
                                                       erased
                                                       (coe
                                                          MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                          (coe v4)
                                                          (coe d_initial'45'load_28 (coe v3))))))))
                                    (\ !v3 ->
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
                                            (d_pull'45'chunk_82 (coe v3)) d_print'45'chunk_86)
                                         (coe
                                            MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.C_mk_74
                                            (let !v4
                                                   = coe
                                                       MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.C_mk_80
                                                       (coe
                                                          (\ !v4 ->
                                                             coe
                                                               MAlonzo.Code.Cubed.IO.Base.d_pure_10
                                                               () erased
                                                               (coe
                                                                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                                  (coe v4)
                                                                  (coe
                                                                     MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))) in
                                             coe (coe (\ !v5 -> v4)))))))))))))
main = coe d_main_104
-- Cubed.Example.Queue.main
d_main_104 ::
  MAlonzo.Code.Agda.Builtin.IO.T_IO_8
    AgdaAny MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6
d_main_104
  = coe
      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
      (MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))
      (coe
         MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
         (MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))
         MAlonzo.Code.Cubed.IO.Base.d_get'45'line_16 d_parse'45'input_52)
      (coe
         MAlonzo.Code.Cubed.Data.Maybe.Base.du_rec_12
         (coe
            MAlonzo.Code.Cubed.IO.Base.d_put'45'str'45'ln_14
            ("failed to read input data" :: Data.Text.Text))
         (coe
            (\ !v0 ->
               coe
                 MAlonzo.Code.Cubed.Effect.Monad.du__'62''62''61'__36
                 (MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))
                 (coe
                    MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.d_run_72
                    (d_setup_62 (coe v0))
                    (coe
                       C_Config'46'constructor_11 (coe (100000 :: Integer))
                       (coe (10000 :: Integer))))
                 (\ !v1 ->
                    coe
                      MAlonzo.Code.Cubed.Effect.Monad.du__'62''62'__38
                      (coe MAlonzo.Code.Cubed.IO.Effectful.d_monad_24 (coe ()))
                      (coe
                         MAlonzo.Code.Cubed.Effect.Monad.State.Trans.Base.du_eval_82
                         (coe MAlonzo.Code.Cubed.IO.Effectful.d_functor_8 (coe ()))
                         (coe
                            MAlonzo.Code.Cubed.Effect.Monad.Reader.Trans.d_run_72 d_test_92 v1)
                         (coe MAlonzo.Code.Cubed.Data.QQueue.Banker.Base.du_empty_62))
                      (coe
                         MAlonzo.Code.Cubed.IO.Base.d_pure_10 () erased
                         (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))))))
