# Sphinx Documentation Builder Docker Image

[![Image Size](https://images.microbadger.com/badges/image/procraft/sphinx-doc.svg)](https://microbadger.com/images/procraft/sphinx-doc)
[![Docker Stars](https://img.shields.io/docker/stars/procraft/sphinx-doc.svg)](https://hub.docker.com/r/procraft/sphinx-doc/)
[![Docker Pulls](https://img.shields.io/docker/pulls/procraft/sphinx-doc.svg)](https://hub.docker.com/r/procraft/sphinx-doc/)
[![Docker Automated build](https://img.shields.io/docker/automated/procraft/sphinx-doc.svg)](https://hub.docker.com/r/procraft/sphinx-doc/)

Minimalistic Alpine-based [Sphinx](http://www.sphinx-doc.org) builder image without any custom themes installed. This image is intented to be used in CI environments, so no watch/autobuild-features included.


## Features

* Based on official Alpine 3.7 Python 3.6.6 image
* Markdown support included via [recommonmark](https://recommonmark.readthedocs.io) and [m2r](https://github.com/miyakogi/m2r) extensions
* Multiple sources support included via [sphinx-multibuild](https://github.com/rowanG077/sphinx-multibuild)
* No custom themes included. You should create your own image with the desired theme like this:
```Dockerfile
FROM procraft/sphinx-doc:1.7.5

RUN pip install sphinx_rtd_theme && \
    rm -rf $PIP_CACHE_DIR/* && pyclean
```

## Usage

```shell
docker run --rm -it \
  -v $(pwd)/docs:/docs \
  procraft/sphinx-doc \
  sphinx-multibuild -i doc-source-1 -i doc-source-2 -o built-docs -c .
```
