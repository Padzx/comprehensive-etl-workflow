#!/bin/bash

docker stop python-container
docker rm python-container

# Clear Images 
docker image prune -f