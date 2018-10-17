#!/usr/bin/env bash

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null && pwd )"

docker-compose -f "$ROOT_DIR/docker-compose.yml" up -d
