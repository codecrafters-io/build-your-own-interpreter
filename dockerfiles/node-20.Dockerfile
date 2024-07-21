# syntax=docker/dockerfile:1.7-labs
FROM node:20-alpine

# Ensures the container is re-built if package.json changes
ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="package.json"

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

# Cache dependencies
RUN npm install

# Once the heavy steps are done, we can copy all files back
COPY . /app