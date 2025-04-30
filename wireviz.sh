#!/bin/sh

# Path to mount into container
SRC=$PWD

# Check if `docker` command is available
if ! command -v docker 2>&1 > /dev/null; then
    echo "Requires docker to be installed and in PATH"
    exit 1
fi

# Script help if no args
if [ $# -eq 0 ]; then
    echo "Use ./wireviz.sh as you would the wireviz executable"
    exit 2
fi

# Exec
docker run --rm -v $SRC:/root/src znibb/wireviz:latest "wireviz $*"