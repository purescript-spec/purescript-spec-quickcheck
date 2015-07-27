module Test.Main where

import Prelude

import Test.Spec                  (describe, it, pending)
import Test.Spec.Runner           (run)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.QuickCheck            ((===), (/==))

import Test.Spec.QuickCheck       (quickCheck)

main = run [consoleReporter] do
  describe "Math" do
    it "works" $
      quickCheck \n -> (n * 2 / 2) === n
    it "works again" $
      quickCheck \n -> ((n + 1) * 2) /== n
