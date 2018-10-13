FROM python:3.6.6-alpine3.7

LABEL maintainer="Procraft Team"

ENV SPHINX_VERSION=1.8.1 \
    PIP_NO_COMPILE=1 \
    PIP_CACHE_DIR=/pip-cache

RUN mkdir "$PIP_CACHE_DIR" && chmod a+rwx "$PIP_CACHE_DIR" && \
    pip install \
      sphinx==$SPHINX_VERSION \
      m2r \
      recommonmark \
      sphinx-multibuild && \
    rm -rf $PIP_CACHE_DIR/*

WORKDIR /docs/

CMD [sphinx]
