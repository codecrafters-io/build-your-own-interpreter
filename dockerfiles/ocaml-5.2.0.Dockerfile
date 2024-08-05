FROM ocaml/opam:alpine-3.20-ocaml-5.2

# Ensures the container is re-built if pom.xml changes
ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="opam"

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

# Cache dependencies
RUN opam update
RUN opam install . --deps-only --yes

# Once the heavy steps are done, we can copy all files back
COPY . /app