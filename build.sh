#!/bin/bash
# Run with ID=$ID ./build.sh
DOCKER_BUILDKIT=1 docker build --no-cache --progress=plain --secret id=proxy,src=/tmp/x509up_u$ID .
