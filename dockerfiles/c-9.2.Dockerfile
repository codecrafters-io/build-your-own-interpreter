FROM n0madic/alpine-gcc:9.2.0

# We need to install Go to build the custom executable.
RUN apk add --no-cache "go>=1.12"
