#!/bin/sh

docker build -t ubuntu_with_vim .
docker run -it -v ${pwd}:/tmp ubuntu_with_vim:latest
