# syntax=docker/dockerfile:1.7-labs
FROM ocaml/opam:alpine-3.20-ocaml-5.2

# Change to root user. All other images seem to use root, so let's do the same here
# hadolint ignore=DL3002
USER root
RUN opam init --disable-sandboxing -y

# Install dune
RUN opam update && opam install dune.3.16.0 --yes

# Dune path is /root/.opam/default/bin/dune
ENV PATH="/root/.opam/default/bin:${PATH}"

# Ensures the container is re-built if dune/dune-project changes
ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="dune,dune-project"

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

# Cache dependencies
RUN opam install . --yes
RUN dune build

# Once the heavy steps are done, we can copy all files back
COPY . /app