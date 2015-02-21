# Get Makefile directory name: http://stackoverflow.com/a/5982798/376773.
# This is a defensive programming approach to ensure that this Makefile
# works even when invoked with the `-C`/`--directory` option.
THIS_MAKEFILE_PATH:=$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
THIS_DIR:=$(shell cd $(dir $(THIS_MAKEFILE_PATH));pwd)

# BIN directory
BIN := $(THIS_DIR)/node_modules/.bin
SIX_TO_FIVE ?= $(NODE) $(BIN)/babel

ES6_FILES := $(wildcard *.es6)
$(info $$ES6_FILES is [${ES6_FILES}])
JS_FILES := $(wildcard *.js)
$(info $$JS_FILES is [${JS_FILES}])


COMPILED_FILES := $(ES6_FILES:.es6=.js)

build: install $(COMPILED_FILES) dist

install: node_modules

clean: $(COMPILED_FILES)
	rm $(COMPILED_FILES)

distclean: clean
	rm -r node_modules

node_modules:
	npm install

%.js: %.es6
	$(SIX_TO_FIVE) -i runtime -e $< --out-file $@

dist:
	mkdir -p dist
	jspm bundle index dist/jspm-play.js --inject
