VERSION:=$(shell cat src/buildpack.toml | yj -tj | jq -r '.buildpack.version')
PACKAGED_PATH:=$(PWD)/out/nltk-buildpack-$(VERSION).tgz

.PHONY: test
test: export TEST_IMAGE_NAME:="test-nltk-buildpack-image"
test:
	cd testdata/app && BUILD_IMAGE_NAME=$(TEST_IMAGE_NAME) BUILDPACK_PATH=$(PWD)/src make build
	echo "This is a sentence. This is another sentence." | docker run -i --rm $(TEST_IMAGE_NAME)
	-@docker rmi $(TEST_IMAGE_NAME) &>/dev/null

.PHONY: clean
clean:
	rm -rf out

.PHONY: out
out:
	mkdir -p out

.PHONY: package
package: clean out
	tar -czvf $(PACKAGED_PATH) -C src .

.PHONY: e2e
e2e: export TEST_IMAGE_NAME:="test-nltk-buildpack-image"
e2e: package
	cd testdata/app && BUILD_IMAGE_NAME=$(TEST_IMAGE_NAME) BUILDPACK_PATH=$(PACKAGED_PATH) make build
	echo "This is a sentence. This is another sentence." | docker run -i --rm $(TEST_IMAGE_NAME)
	-@docker rmi $(TEST_IMAGE_NAME) &>/dev/null