# syntax=docker/dockerfile:1.7-labs
FROM rust:1.77-buster

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

RUN cargo build --release --target-dir=/tmp/codecrafters-interpreter-target

RUN rm /tmp/codecrafters-interpreter-target/release/interpreter-starter-rust
RUN rm /tmp/codecrafters-interpreter-target/release/interpreter-starter-rust.d

# Build caching schenanigans, see if this can be simplified
RUN find /tmp/codecrafters-interpreter-target/release -type f -maxdepth 1 -delete
RUN rm -f /tmp/codecrafters-interpreter-target/release/deps/*interpreter_starter_rust*
RUN rm -f /tmp/codecrafters-interpreter-target/release/deps/interpreter_starter_rust*
RUN rm -f /tmp/codecrafters-interpreter-target/release/.fingerprint/*interpreter_starter_rust*
RUN rm -f /tmp/codecrafters-interpreter-target/release/.fingerprint/interpreter_starter_rust*

RUN rm -rf /app/src

RUN echo "cd \${CODECRAFTERS_SUBMISSION_DIR} && cargo build --release --target-dir=/tmp/codecrafters-interpreter-target --manifest-path Cargo.toml" > /codecrafters-precompile.sh
RUN chmod +x /codecrafters-precompile.sh

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="Cargo.toml,Cargo.lock"

# Once the heavy steps are done, we can copy all files back
COPY . /app