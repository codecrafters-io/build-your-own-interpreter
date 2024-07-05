# syntax=docker/dockerfile:1.7-labs
FROM rust:1.77-buster

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="Cargo.toml,Cargo.lock"

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

RUN cargo build --release --target-dir=/tmp/codecrafters-interpreter-target

# Once the heavy steps are done, we can copy all files back
COPY . /app