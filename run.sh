#!/bin/sh

# Simple run script for the C project

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
PROJECT_NAME=$(basename "$SCRIPT_DIR")
EXECUTABLE="$SCRIPT_DIR/dist/${PROJECT_NAME}"

if [ ! -f "$EXECUTABLE" ]; then
    echo "Executable dist/${PROJECT_NAME} not found. Please build it first with ./build.sh"
    exit 1
fi

"$EXECUTABLE" "$@"
