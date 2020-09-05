#!/bin/sh

docker build -t my_ubuntu .
docker run -it -d --name my_ubuntu my_ubuntu:latest
cd ~
docker cp ./dotfiles my_ubuntu:/root
docker exec -it my_ubuntu bash
