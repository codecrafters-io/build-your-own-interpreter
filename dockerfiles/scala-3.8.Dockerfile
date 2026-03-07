# syntax=docker/dockerfile:1.7-labs
FROM maven:3.9.12-eclipse-temurin-25-noble

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="build.sbt,project/assembly.sbt,project/build.properties"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && \
    apt-get install --no-install-recommends gnupg=2.4.4-2ubuntu17.4 -yqq && \
    echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list && \
    echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list && \
    curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/scalasbt-release.gpg --import && \
    chmod 644 /etc/apt/trusted.gpg.d/scalasbt-release.gpg && \
    apt-get update && \
    apt-get install --no-install-recommends sbt=1.12.5 -yqq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV PATH=/usr/local/sbt/bin:$PATH

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

WORKDIR /app

RUN .codecrafters/compile.sh