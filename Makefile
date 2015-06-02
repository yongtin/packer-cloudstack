TEST?=./...

default: test

bin:
	@sh -c "$(CURDIR)/scripts/build.sh"

dev:
	@TF_DEV=1 sh -c "$(CURDIR)/scripts/build.sh"

test:
	go test $(TEST) $(TESTARGS) -timeout=10s

testrace:
	go test -race $(TEST) $(TESTARGS)

updatedeps:
	go get -u github.com/tools/godep && export PATH=${PATH}:${GOPATH}/bin && godep restore

.PHONY: bin default test updatedeps
