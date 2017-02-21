#!/usr/bin/env bash

function setup_rsa() {
  echo "-----------------------------------------------------"
  echo "Moving ssh config to root user ssh directory"
  echo "-----------------------------------------------------"

  mkdir -p /root/.ssh
  test -e /var/tmp/id && cp /var/tmp/id /root/.ssh/id_rsa
  test -e /var/tmp/known_hosts && cp /var/tmp/known_hosts /root/.ssh/known_hosts
  test -e /root/.ssh/id_rsa && chmod 600 /root/.ssh/id_rsa
}

function setup_vendor_access() {
  echo "-----------------------------------------------------"
  echo "Updating owner for vendor directory"
  echo "-----------------------------------------------------"

  local CURRENT_GID=`id -g`
  local CURRENT_UID=`id -u`

  local USED_GID=${HOST_GID:-$CURRENT_GID}
  local USED_UID=${HOST_UID:-$CURRENT_UID}

  test -e vendor && chown -R ${USED_UID}:${USED_GID} vendor
}

# We need to have host ssh configuration to access private repo for instance
setup_rsa

"$@"

# Sometimes we need to change vendors access rights
# Env vars to give to container :
# HOST_USER
# HOST_GID
# HOST_UID
setup_vendor_access
