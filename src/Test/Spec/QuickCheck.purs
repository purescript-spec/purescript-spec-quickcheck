module Test.Spec.QuickCheck (
  quickCheck,
  quickCheck',
  quickCheckPure
  ) where

import Prelude

import Data.Array (fold)
import Data.Foldable (intercalate)
import Data.List (mapMaybe, null)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested (type (/\), (/\))
import Effect.Aff (Aff, error, throwError)
import Effect.Class (liftEffect)
import Test.QuickCheck as QC

-- | Runs a Testable with a random seed and 100 inputs.
quickCheck :: ∀ p. (QC.Testable p) => p -> Aff Unit
quickCheck = quickCheck' 100

-- | Runs a Testable with a random seed and the given number of inputs.
quickCheck' :: ∀ p. (QC.Testable p) => Int -> p -> Aff Unit
quickCheck' n prop = do
  seed <- liftEffect QC.randomSeed
  quickCheckPure seed n prop

getErrorMessage :: QC.Seed /\ QC.Result -> Maybe String
getErrorMessage (_ /\ QC.Success) =
  Nothing
getErrorMessage (seed /\ QC.Failed msg) =
  Just $ fold ["Test (seed ", show (QC.unSeed seed), ") failed: \n", msg]

-- | Runs a Testable with a given seed and number of inputs.
quickCheckPure :: ∀ p. (QC.Testable p) => QC.Seed -> Int -> p -> Aff Unit
quickCheckPure seed n prop = do
  let results = QC.quickCheckPure' seed n prop
  let msgs = mapMaybe getErrorMessage results

  unless (null msgs) $
    throwError $ error $ intercalate "\n  " msgs
