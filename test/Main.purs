module Main where

import Data.Array
import Test.QuickCheck ((===), (/==))
import Test.Spec (describe, pending, it)
import Test.Spec.Node
import Test.Spec.Assertions
import Test.Spec.Reporter.Console
import Test.Spec.QuickCheck

main = runNode [consoleReporter] do
  describe "Math" do
    it "works" $
      quickCheck \n -> (n * 2 / 2) === n
    it "works again" $
      quickCheck \n -> ((n + 1) * 2) /== n
