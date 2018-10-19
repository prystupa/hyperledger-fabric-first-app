#!/usr/bin/env bash

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null && pwd )"

[ -d $ROOT_DIR/.volumes/first-channel ] && rm -rf $ROOT_DIR/.volumes/first-channel
mkdir -p ./.volumes/first-channel

docker container exec -it \
  -e CORE_PEER_ADDRESS=peer0.org1.first-app.com:7051 \
  -e CORE_PEER_LOCALMSPID=Org1MSP \
  -e CORE_PEER_TLS_CERT_FILE=/app/volumes/crypto-cinfig/peerOrganizations/org1.fist-app.com/peers/peer0.org1.first-app.com/tls/server.crt \
  -e CORE_PEER_TLS_KEY_FILE=/app/volumes/crypto-config/peerOrganizations/org1.first-app.com/peers/peer0.org1.first-app.com/tls/server.key \
  -e CORE_PEER_TLS_ROOTCERT_FILE=/app/volumes/crypto-config/peerOrganizations/org1.first-app.com/peers/peer0.org1.first-app.com/tls/ca.crt \
  -e CORE_PEER_MSPCONFIGPATH=/app/volumes/crypto-config/peerOrganizations/org1.first-app.com/users/Admin@org1.first-app.com/msp \
  cli \
  /bin/bash -c \
  "peer channel create \
    --orderer orderer.first-app.com:7050 \
    --channelID first-channel \
    --file /app/volumes/channel-config/channel.tx \
    --tls \
    --cafile /app/volumes/crypto-config/ordererOrganizations/first-app.com/orderers/orderer.first-app.com/msp/tlscacerts/tlsca.first-app.com-cert.pem \
    --outputBlock /app/volumes/first-channel/first-channel.block \
  "
