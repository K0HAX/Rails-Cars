#!/bin/bash
read -p "BUILD_VER: " BUILD_VER
docker build --progress plain --build-arg RAILS_ENV=development --build-arg NODE_ENV=development --build-arg BUILD_VER=$BUILD_VER --tag k0hax/lab-enginestats:$BUILD_VER --tag k0hax/lab-enginestats:latest .

