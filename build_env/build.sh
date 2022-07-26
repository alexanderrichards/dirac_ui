#!/bin/bash
docker build --tag dirac_build_env:latest .
docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v /home/arichard/.globus:/root/.globus -v $(dirname $PWD):/root/build_dir dirac_build_env:latest
docker rmi dirac_build_env:latest