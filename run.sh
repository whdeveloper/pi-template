#!/usr/bin/env bash
docker network create raspi_network
docker build -t ansible-pi-template .
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -e DIST_DIR=./dist --network raspi_network ansible-pi-template
docker network remove raspi_network
