module Test.Spec.QuickCheck (
  quickCheck,
  quickCheck',
  quickCheckPure
  ) where

import Prelude

import Effect.Class                (liftEffect)
import Data.Foldable               (intercalate)
import Data.List                   (mapMaybe, length)
import Data.Maybe                  (Maybe(..))
import Data.Tuple                  (Tuple(..))
import Effect.Aff                  (Aff, error, throwError)
import Test.QuickCheck             as QC

-- | Runs a Testable with a random seed and 100 inputs.
quickCheck :: forall p.
              (QC.Testable p) =>
              p ->
              Aff Unit
quickCheck = quickCheck' 100

-- | Runs a Testable with a random seed and the given number of inputs.
quickCheck' :: forall p.
               (QC.Testable p) =>
               Int ->
               p ->
               Aff Unit
quickCheck' n prop = do
  seed <- liftEffect QC.randomSeed
  quickCheckPure seed n prop

getErrorMessage :: Tuple QC.Seed QC.Result -> Maybe String
getErrorMessage (Tuple seed result) =
  case result of
    QC.Success -> Nothing
    QC.Failed msg ->
      Just $
        "Test failed for seed " <> show (QC.unSeed seed) <> ":\n" <> msg

-- | Runs a Testable with a given seed and number of inputs.
quickCheckPure :: forall p.
                  (QC.Testable p) =>
                  QC.Seed ->
                  Int ->
                  p ->
                  Aff Unit
quickCheckPure seed n prop = do
  let results = QC.quickCheckPure' seed n prop
  let msgs = mapMaybe getErrorMessage results

  if length msgs > 0
    then throwError $ error $ intercalate "\n  " msgs
    else pure unit
