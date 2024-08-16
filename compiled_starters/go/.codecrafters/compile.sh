#!/bin/sh
#
# This script is used to compile your program on CodeCrafters
#
# This runs before .codecrafters/run.sh
#
# Learn more: https://codecrafters.io/program-interface

# Exit early if any commands fail
set -e

echo "ls -la"
ls -la

echo "git --version"
git --version

echo "git config --list"
git config --list

echo "git status"
git status

echo "ls -la .git"
ls -la .git

go build -o /tmp/interpreter-target ./cmd/myinterpreter
