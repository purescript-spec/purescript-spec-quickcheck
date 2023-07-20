# purescript-spec-quickcheck

purescript-spec-quickcheck is a tiny adapter between the
[purescript-spec](https://github.com/purescript-spec/purescript-spec) test framework
and [purescript-quickcheck](https://github.com/purescript/purescript-quickcheck).

## Usage

```bash
bower install purescript-spec-quickcheck
```

```purescript
module Test.Main where

import Prelude
import Effect (Effect)
import Test.QuickCheck ((===), (/==))
import Test.Spec (describe, it)
import Test.Spec.QuickCheck (quickCheck)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (runSpec)

main :: Effect Unit
main = runSpec [consoleReporter] do
  describe "Math" do
    it "works" $
      quickCheck \n -> (n * 2 / 2) === n
    it "works again" $
      quickCheck \n -> ((n + 1) * 2) /== n
```

## API Docs

This module is published, and has its API documentation, [on
Pursuit](https://pursuit.purescript.org/packages/purescript-spec-quickcheck).

## Contribute

If you have any issues or possible improvements please file them as
[GitHub Issues](https://github.com/purescript-spec/purescript-spec-quickcheck/issues).
Pull requests are encouraged.

## License

[MIT License](LICENSE.md).
