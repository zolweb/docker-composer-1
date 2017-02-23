#!/usr/bin/env bash

PROJECT_NAME="sf-composer-compare"
cd /tmp && rm -rf "${PROJECT_NAME}"

function clear_vendors() {
  rm -rf /tmp/"${PROJECT_NAME}"/vendor/*
}

function create_sf_project() {
  docker run -it --rm \
    -u $(id -u):$(id -g) \
    -v $(pwd):/app \
      ypereirareis/symfony-installer \
        new "$1"

  clear_vendors
}

# Not using volume for composer cache, so cache is destroyed with the container.
# And we do not care about scripts for this benchmark.
function run_composer() {
  time docker run -it --rm \
    -u $(id -u):$(id -g) \
    -v $(pwd):/app \
      composer/composer \
        install --no-scripts

  clear_vendors
}

# Not using volume for composer cache, so cache is destroyed with the container.
# And we do not care about scripts for this benchmark.
function run_prestissimo() {
  time docker run -it --rm \
    -e HOST_UID=`id -u` \
    -e HOST_GID=`id -g` \
    -v $(pwd):/app \
      ypereirareis/composer:1.3.2-prestissimo-alpine \
        composer install --no-scripts

  clear_vendors
}

function clear() {
 cd /tmp && rm -rf "${PROJECT_NAME}"
}


clear
create_sf_project "${PROJECT_NAME}"
cd "${PROJECT_NAME}"
run_composer
run_prestissimo
clear
