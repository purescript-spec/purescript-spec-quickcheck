module Test.Spec.QuickCheck (
  quickCheckWithSeed,
  quickCheck',
  quickCheck
  ) where

import Data.Maybe
import Data.Array
import Data.Either
import Data.String (joinWith)
import Control.Monad.Eff
import Control.Monad.Eff.Exception
import Control.Monad.Eff.Random (Random(), random)
import Control.Monad.Aff
import Control.Monad.Trans
import Control.Monad.Error.Class
import Test.Spec.QuickCheck
import qualified Test.QuickCheck as QC

-- | Runs a Testable with a random seed and 100 inputs.
quickCheck :: forall r p e.
              (QC.Testable p) =>
              p ->
              Aff (random :: Random | e) Unit
quickCheck = quickCheck' 100

randomAff :: forall e. Aff (random :: Random | e) Number
randomAff = makeAff \_ success -> do n <- random
                                     success n

-- | Runs a Testable with a random seed and the given number of inputs.
quickCheck' :: forall r p e.
               (QC.Testable p) =>
               Number ->
               p ->
               Aff (random :: Random | e) Unit
quickCheck' n prop = do
  seed <- randomAff
  quickCheckWithSeed 0 n prop

getErrorMessage :: QC.Result -> Maybe String
getErrorMessage (QC.Failed msg) = Just msg
getErrorMessage _ = Nothing

-- | Runs a Testable with a given seed and number of inputs.
quickCheckWithSeed :: forall r p e.
                      (QC.Testable p) =>
                      Number ->
                      Number ->
                      p ->
                      Aff e Unit
quickCheckWithSeed seed n prop = do
  let results = QC.quickCheckPure seed n prop
  let msgs = mapMaybe getErrorMessage results

  if length msgs > 0
    then throwError $ error $ joinWith "\n  " msgs
    else return unit
