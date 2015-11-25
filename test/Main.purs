module Test.Main where

import Prelude

import Control.Monad.Eff          (Eff())
import Control.Monad.Eff.Console  (CONSOLE())
import Control.Monad.Eff.Random   (RANDOM())
import Test.Spec                  (describe, it)
import Test.Spec.Runner           (Process(), run)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.QuickCheck            ((===), (/==))

import Test.Spec.QuickCheck       (quickCheck)

main :: forall e. Eff (random :: RANDOM, console :: CONSOLE, process :: Process | e) Unit
main = run [consoleReporter] do
  describe "Math" do
    it "works" $
      quickCheck \n -> (n * 2 / 2) === n
    it "works again" $
      quickCheck \n -> ((n + 1) * 2) /== n
