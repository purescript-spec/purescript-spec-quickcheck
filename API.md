# Module Documentation

## Module Test.Spec.QuickCheck

#### `quickCheck`

``` purescript
quickCheck :: forall r p. (QC.Testable p) => p -> QC.QC Unit
```

Runs a Testable with a random seed and 100 inputs.

#### `quickCheck'`

``` purescript
quickCheck' :: forall r p. (QC.Testable p) => Number -> p -> QC.QC Unit
```

Runs a Testable with a random seed and the given number of inputs.

#### `quickCheckWithSeed`

``` purescript
quickCheckWithSeed :: forall r p. (QC.Testable p) => Number -> Number -> p -> QC.QC Unit
```

Runs a Testable with a given seed and number of inputs.



