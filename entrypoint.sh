#!/bin/bash

function error() {
  if [[ ! -z $1 ]]; then
    echo $1
  fi

  sleep 10
  exit 1
}

# Normal startup
if [[ "${1:0:1}" = '-' ]]; then
  set -- /usr/local/bin/borgmatic "$@"
fi

exec "$@"
