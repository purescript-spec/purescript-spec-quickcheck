{ name = "spec-quickcheck"
, license = "MIT"
, repository = "https://github.com/purescript-spec/purescript-spec-quickcheck"
, dependencies =
  [ "aff"
  , "effect"
  , "foldable-traversable"
  , "lists"
  , "maybe"
  , "prelude"
  , "quickcheck"
  , "spec"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
