module Prologue
( module X
, lookup
, (&&&)
, (***)
, hylo, cata, para, ana
, cofree, runCofree, free, runFree
, module Data.Hashable
) where

import Protolude as X
import Data.List (lookup)

import Control.Comonad.Cofree as X hiding ((:<), unfold, unfoldM)
import Control.Monad.Free as X (Free())
import Control.Monad.Free as X hiding (Free(Free, Pure), unfold, unfoldM)
import Control.Comonad.Trans.Cofree as X (CofreeF(..), headF, tailF)
import Control.Monad.Trans.Free as X (FreeF(..))
import Control.Comonad as X
import qualified Control.Comonad.Cofree as Cofree

import Control.Arrow ((&&&), (***))

import Data.Functor.Foldable (hylo, cata, para, ana, project, embed)

import Data.Hashable

cofree :: CofreeF f a (Cofree f a) -> Cofree f a
cofree (a :< f) = a Cofree.:< f

runCofree :: Cofree f a -> CofreeF f a (Cofree f a)
runCofree (a Cofree.:< f) = a :< f

free :: Functor f => FreeF f a (Free f a) -> Free f a
free = embed

runFree :: Functor f => Free f a -> FreeF f a (Free f a)
runFree = project
