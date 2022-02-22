
.PHONY: test
test: export TEST_IMAGE_NAME:="test-nltk-buildpack-image"
test:
	cd testdata/app && BUILD_IMAGE_NAME=$(TEST_IMAGE_NAME) make build
	echo "This is a sentence. This is another sentence." | docker run -i --rm $(TEST_IMAGE_NAME)
	-@docker rmi $(TEST_IMAGE_NAME) &>/dev/null