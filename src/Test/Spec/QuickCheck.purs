module Test.Spec.QuickCheck (
  quickCheck,
  quickCheck',
  quickCheckPure
  ) where

import Prelude

import Control.Monad.Aff           (Aff)
import Control.Monad.Eff.Exception (error)
import Control.Monad.Eff.Class     (liftEff)
import Control.Monad.Eff.Random    (RANDOM)
import Control.Monad.Error.Class   (throwError)
import Data.Foldable               (intercalate)
import Data.List                   (mapMaybe, length)
import Data.Maybe                  (Maybe(..))
import Test.QuickCheck             as QC
import Test.QuickCheck.LCG         (Seed, randomSeed)

-- | Runs a Testable with a random seed and 100 inputs.
quickCheck :: forall p e.
              (QC.Testable p) =>
              p ->
              Aff (random :: RANDOM | e) Unit
quickCheck = quickCheck' 100

-- | Runs a Testable with a random seed and the given number of inputs.
quickCheck' :: forall p e.
               (QC.Testable p) =>
               Int ->
               p ->
               Aff (random :: RANDOM | e) Unit
quickCheck' n prop = do
  seed <- liftEff randomSeed
  quickCheckPure seed n prop

getErrorMessage :: QC.Result -> Maybe String
getErrorMessage (QC.Failed msg) = Just msg
getErrorMessage _ = Nothing

-- | Runs a Testable with a given seed and number of inputs.
quickCheckPure :: forall p e.
                  (QC.Testable p) =>
                  Seed ->
                  Int ->
                  p ->
                  Aff e Unit
quickCheckPure seed n prop = do
  let results = QC.quickCheckPure seed n prop
  let msgs = mapMaybe getErrorMessage results

  if length msgs > 0
    then throwError $ error $ intercalate "\n  " msgs
    else pure unit
