## Module Test.Spec.QuickCheck

#### `quickCheck`

``` purescript
quickCheck :: forall p. Testable p => p -> Aff Unit
```

Runs a Testable with a random seed and 100 inputs.

#### `quickCheck'`

``` purescript
quickCheck' :: forall p. Testable p => Int -> p -> Aff Unit
```

Runs a Testable with a random seed and the given number of inputs.

#### `quickCheckPure`

``` purescript
quickCheckPure :: forall p e. Testable p => Seed -> Int -> p -> Aff Unit
```

Runs a Testable with a given seed and number of inputs.


