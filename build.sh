#!/bin/sh

USER=znibb
NAME=wireviz

docker buildx build -t $USER/$NAME:latest .