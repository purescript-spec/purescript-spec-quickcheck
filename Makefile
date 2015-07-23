OUTPUT = output

SRC = 'src/**/*.purs'
LIB = 'bower_components/purescript-*/src/**/*.purs'
SRC_FFI = 'src/**/*.js'
LIB_FFI = 'bower_components/purescript-*/src/**/*.js'
TESTS = 'test/**/*.purs'

DEFAULT_PSC_ARGS = $(SRC) $(LIB) --ffi $(SRC_FFI) --ffi $(LIB_FFI)

build: $(OUTPUT)
	psc $(DEFAULT_PSC_ARGS) -o $(OUTPUT)/lib

$(OUTPUT):
	mkdir -p $@

ctags:
	psc-docs --format ctags $(SRC) $(LIB) > tags

run-tests:
	psc $(TESTS) $(DEFAULT_PSC_ARGS) -o $(OUTPUT)/test
	@NODE_PATH=$(OUTPUT)/test node -e "require('Test.Main').main();"

watch-tests:
	nodemon --watch src --watch test -e purs --exec make run-tests
