# Docker image (Alpine/php7) for composer and prestissimo

## Docker-compose

```
version: '2'
services:
  composer:
    image: ypereirareis/composer:1.3.2-prestissimo-alpine
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
    image: ypereirareis/composer:1.3.2-prestissimo-alpine
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