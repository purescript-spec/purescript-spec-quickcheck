## Module Test.Spec.QuickCheck

#### `quickCheck`

``` purescript
quickCheck :: forall r p e. Testable p => p -> Aff (random :: RANDOM | e) Unit
```

Runs a Testable with a random seed and 100 inputs.

#### `quickCheck'`

``` purescript
quickCheck' :: forall r p e. Testable p => Int -> p -> Aff (random :: RANDOM | e) Unit
```

Runs a Testable with a random seed and the given number of inputs.

#### `quickCheckPure`

``` purescript
quickCheckPure :: forall r p e. Testable p => Seed -> Int -> p -> Aff e Unit
```

Runs a Testable with a given seed and number of inputs.


