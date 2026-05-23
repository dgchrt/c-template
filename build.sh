#!/bin/sh

# Simple build script for the C project
# Requires: gcc, make

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
PROJECT_NAME=$(basename "$SCRIPT_DIR")

echo "Building ${PROJECT_NAME}..."
if make -C "$SCRIPT_DIR"; then
    echo "Build successful! Executable is at dist/${PROJECT_NAME}"
else
    echo "Build failed."
    exit 1
fi
