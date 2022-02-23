# NLTK Buildpack

A buildpack to install [NLTK modules](https://www.nltk.org/).

## Usage

This buildpack is applied when python is detected and `requirements.txt` contains the `nltk` module.

## Parameters

Parameters are provided as environment variables. For example, via [`pack`'s `--env` argment](https://buildpacks.io/docs/tools/pack/cli/pack_build/#options).

- `NLTK_MODULES`: _(Optional, Default: "all")_ A comma-seperated list of modules or collections to install.

## Supported Stacks

- [x] [Google](https://github.com/GoogleCloudPlatform/buildpacks)

_Happy to accept pull requests for support of additional stacks._