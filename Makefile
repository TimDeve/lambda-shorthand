.PHONY: all
all: build build-example test

.PHONY: build
build:
	carp -b lambda-shorthand.carp

.PHONY: repl
repl:
	carp lambda-shorthand.carp

.PHONY: build-example
build-example:
	carp -b example.carp

.PHONY: test
test:
	carp -x test.carp
