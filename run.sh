#!/usr/bin/env bash
docker network create raspi_network
docker build -t ansible-pi-template .
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v ./dist:/dist --network raspi_network ansible-pi-template
docker network remove raspi_network
