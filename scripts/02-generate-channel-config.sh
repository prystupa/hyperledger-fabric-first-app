#!/usr/bin/env bash

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null && pwd )"

[ -d $ROOT_DIR/.volumes/channel-config ] && rm -rf $ROOT_DIR/.volumes/channel-config
mkdir -p ./volumes/channel-config

docker container run --rm \
  -v "$ROOT_DIR/.volumes/crypto-config:/app/input/crypto-config" \
  -v "$ROOT_DIR/config/configtx.yml":/app/input/configtx.yml \
  -v "$ROOT_DIR/.volumes/channel-config":/app/output \
  -e FABRIC_CFG_PATH=/app/input \
  hyperledger/fabric-tools \
  /bin/bash -c \
  "configtxgen -profile ThreeOrgsOrdererGenesis -channelID orderer-system-channel -outputBlock /app/output/genesis.block && \
  configtxgen -profile ThreeOrgsChannel -channelID first-channel -outputCreateChannelTx /app/output/channel.tx && \
  configtxgen -profile ThreeOrgsChannel -channelID first-channel -outputAnchorPeersUpdate /app/output/org1MspAnchors.tx -asOrg Org1MSP && \
  configtxgen -profile ThreeOrgsChannel -channelID first-channel -outputAnchorPeersUpdate /app/output/org2MspAnchors.tx -asOrg Org2MSP && \
  configtxgen -profile ThreeOrgsChannel -channelID first-channel -outputAnchorPeersUpdate /app/output/org3MspAnchors.tx -asOrg Org3MSP"
