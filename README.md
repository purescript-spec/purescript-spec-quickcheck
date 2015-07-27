# purescript-spec-quickcheck

purescript-spec-quickcheck is a tiny adapter between the
[purescript-spec](https://github.com/owickstrom/purescript-spec) test framework
and [purescript-quickcheck](https://github.com/purescript/purescript-quickcheck).

## Usage

```bash
bower install purescript-spec-quickcheck
```

```purescript
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
```

## API

See [API](API.md).

## Contribute

If you have any issues or possible improvements please file them as
[GitHub Issues](https://github.com/owickstrom/purescript-spec-quickcheck/issues).
Pull requests requests are encouraged.

## License

[MIT License](LICENSE.md).
