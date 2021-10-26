# escoria-docs

## Introduction

This repository holds the official Escoria framework documentation, which is hosted by [https://readthedocs.org/] at https://docs.escoria-framework.org.

## Building

To build the documentation locally, run the following using [Docker](https://docker.com):

    docker run -it --rm -v (pwd):/docs --entrypoint "/bin/bash" sphinxdoc/sphinx -c "pip install sphinx_rtd_theme myst_parser && sphinx-build -a . _build"
