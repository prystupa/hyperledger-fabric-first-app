#!/usr/bin/env bash

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null && pwd )"

[ -d $ROOT_DIR/.volumes ] && rm -rf $ROOT_DIR/.volumes
mkdir -p ./volumes/crypto-config

docker container run --rm \
  -v "$ROOT_DIR/config/crypto-config.yml":/app/input/crypto-config.yml \
  -v "$ROOT_DIR/.volumes/crypto-config":/app/output \
  hyperledger/fabric-tools \
  /bin/bash -c \
  "cryptogen generate --config /app/input/crypto-config.yml --output /app/output"
