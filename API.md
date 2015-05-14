# Module Documentation

## Module Test.Spec.QuickCheck

#### `quickCheck`

``` purescript
quickCheck :: forall r p e. (QC.Testable p) => p -> Aff (random :: Random | e) Unit
```

Runs a Testable with a random seed and 100 inputs.

#### `quickCheck'`

``` purescript
quickCheck' :: forall r p e. (QC.Testable p) => Number -> p -> Aff (random :: Random | e) Unit
```

Runs a Testable with a random seed and the given number of inputs.

#### `quickCheckWithSeed`

``` purescript
quickCheckWithSeed :: forall r p e. (QC.Testable p) => Number -> Number -> p -> Aff e Unit
```

Runs a Testable with a given seed and number of inputs.



