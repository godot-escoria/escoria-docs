#!/bin/bash

docker run -it --rm -v $(pwd):/docs \
    --entrypoint "/bin/bash" \
    sphinxdoc/sphinx -c "pip install sphinx_rtd_theme myst_parser && sphinx-build -a . _build"
