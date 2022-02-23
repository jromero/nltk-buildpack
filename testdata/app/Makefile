BUILD_IMAGE_NAME?=test-python-app
BUILDPACK_PATH?=../../src

.PHONY: format
format:
	python -m black .

.PHONY: freeze
freeze:
	pip freeze > requirements.txt

.PHONY: build
build: format freeze
	pack build $(BUILD_IMAGE_NAME) \
		-B gcr.io/buildpacks/builder:v1 \
		--env GOOGLE_ENTRYPOINT="python main.py" \
		--env NLTK_MODULES="punkt" \
		-b google.python.runtime \
		-b google.python.pip \
		-b google.config.entrypoint \
		-b $(BUILDPACK_PATH) \
		-v