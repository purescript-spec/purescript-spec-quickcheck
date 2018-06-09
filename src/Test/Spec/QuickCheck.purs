module Test.Spec.QuickCheck (
  quickCheck,
  quickCheck',
  quickCheckPure
  ) where

import Prelude

import Control.Monad.Error.Class (throwError)
import Data.Foldable             (intercalate)
import Data.List                 (mapMaybe, length)
import Data.Maybe                (Maybe(..))
import Effect.Aff                (Aff)
import Effect.Class              (liftEffect)
import Effect.Exception          (error)
import Random.LCG                (Seed, randomSeed)
import Test.QuickCheck           as QC

-- | Runs a Testable with a random seed and 100 inputs.
quickCheck :: forall p.
              QC.Testable p =>
              p ->
              Aff Unit
quickCheck = quickCheck' 100

-- | Runs a Testable with a random seed and the given number of inputs.
quickCheck' :: forall p.
               QC.Testable p =>
               Int ->
               p ->
               Aff Unit
quickCheck' n prop = do
  seed <- liftEffect randomSeed
  quickCheckPure seed n prop

getErrorMessage :: QC.Result -> Maybe String
getErrorMessage (QC.Failed msg) = Just msg
getErrorMessage _ = Nothing

-- | Runs a Testable with a given seed and number of inputs.
quickCheckPure :: forall p.
                  (QC.Testable p) =>
                  Seed ->
                  Int ->
                  p ->
                  Aff Unit
quickCheckPure seed n prop = do
  let results = QC.quickCheckPure seed n prop
  let msgs = mapMaybe getErrorMessage results

  if length msgs > 0
    then throwError $ error $ intercalate "\n  " msgs
    else pure unit
