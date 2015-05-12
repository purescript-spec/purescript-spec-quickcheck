# purescript-spec-quickcheck

purescript-spec-quickcheck is a tiny adapter between the
[purescript-spec](https://github.com/owickstrom/purescript-spec) test framework
and [purescript-quickcheck](https://github.com/purescript/purescript-quickcheck).

## Usage

```bash
bower install purescript-spec-quickcheck
```

```purescript
module Main where

import Data.Array
import Test.QuickCheck ((===))
import Test.Spec (describe, pending, it)
import Test.Spec.Node
import Test.Spec.Assertions
import Test.Spec.QuickCheck

main = runNode do
  describe "Math" $
    it "works" $
      quickCheck \n -> (n * 2 / 2) === n
```

## Contribute

If you have any issues or possible improvements please file them as
[GitHub Issues](https://github.com/owickstrom/purescript-spec-quickcheck/issues).
Pull requests requests are encouraged.

## License

[MIT License](LICENSE.md).
