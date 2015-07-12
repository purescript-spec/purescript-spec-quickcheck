OUTPUT = output

SRC = $(shell find src -type f -name '*.purs')
LIB = $(shell find bower_components/purescript-*/src -type f -name '*.purs')

TESTS = $(shell find test -type f -name '*.purs')

build: $(OUTPUT)
	psc-make -o output/lib $(SRC) $(LIB)

$(OUTPUT):
	mkdir -p $@

docs:
	psc-docs $(SRC) > API.md

ctags:
	psc-docs --format ctags $(SRC) $(LIB) > tags

run-tests:
	psc-make -o $(OUTPUT)/test $(TESTS) $(SRC) $(LIB)
	@NODE_PATH=$(OUTPUT)/test node -e "require('Main').main();"

watch-tests:
	nodemon --watch src --watch test -e purs --exec make run-tests
