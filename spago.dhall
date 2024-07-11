{ name = "spec-quickcheck"
, license = "MIT"
, repository = "https://github.com/purescript-spec/purescript-spec-quickcheck"
, dependencies =
  [ "aff"
  , "arrays"
  , "effect"
  , "foldable-traversable"
  , "lists"
  , "maybe"
  , "prelude"
  , "quickcheck"
  , "spec"
  , "tuples"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
