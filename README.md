# Docker image (Alpine/php7) for composer and prestissimo

## Docker-compose

```
version: '2'
services:
  composer:
    image: zolweb/docker-composer-prestissimo:1.3.2-prestissimo-alpine
    working_dir: /src
```

## SSH config

Add volumes to allow container to access your ssh configuration

```
version: '2'
services:
  composer:
    ...
    volumes:
      - ~/.composer/cache:/root/.composer/cache
      - ~/.ssh/id_rsa:/var/tmp/id
      - ~/.ssh/known_hosts:/var/tmp/known_hosts
      - "./:/src"
```

## Vendor owner

Add environment variables to allow container to change the owner of generated files

```
version: '2'
services:
  composer:
    ...
    environment:
      HOST_GID: ${GID} # Need exporting
      HOST_UID: ${UID} # Need exporting
```

## Full configuration

```
version: '2'
services:
  composer:
    image: zolweb/docker-composer-prestissimo:1.3.2-prestissimo-alpine
    working_dir: /src
    environment:
      HOST_GID: ${GID} # Need exporting
      HOST_UID: ${UID} # Need exporting
    volumes:
      - ~/.composer/cache:/root/.composer/cache
      - ~/.ssh/id_rsa:/var/tmp/id
      - ~/.ssh/known_hosts:/var/tmp/known_hosts
      - "./:/src"
```

# Composer VS Prestissimo

This script will create directory and files into `/tmp` directory.
Tested on Linux NOT on OSX.

The script install a new fresh symfony app, then run vendors install:

* Symfony install
* Remove vendors
* Composer install
* Remove vendors
* Prestissimo install

**~50s VS ~7s**

```
./compare.sh
```

## Composer

![Composer](./composer.png)

## Prestissimo

![Prestissimo](./prestissimo.png)
