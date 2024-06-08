# syntax=docker/dockerfile:1
FROM debian:bookworm-slim
LABEL org.opencontainers.image.title="bats"
LABEL org.opencontainers.image.description="BATS"
LABEL org.opencontainers.image.authors="Andrey Gubarev"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    bats \
    bats-assert \
    bats-file \
    bats-support \
    ca-certificates \
    curl \
    tini \
    && rm -rf /var/lib/apt/lists/*

VOLUME /usr/local/src
WORKDIR /usr/local/src
ENTRYPOINT ["tini", "--", "bash", "bats"]
