#!/usr/bin/env bash

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null && pwd )"

function listChannel() {
  local peer=$1
  local org=$2
  local peerMSP=$3

  docker container exec -it \
    -e CORE_PEER_ADDRESS=${peer}.${org}:7051 \
    -e CORE_PEER_LOCALMSPID=${peerMSP} \
    -e CORE_PEER_TLS_CERT_FILE=/app/volumes/crypto-cinfig/peerOrganizations/${org}/peers/${peer}.${org}/tls/server.crt \
    -e CORE_PEER_TLS_KEY_FILE=/app/volumes/crypto-config/peerOrganizations/${org}/peers/${peer}.${org}/tls/server.key \
    -e CORE_PEER_TLS_ROOTCERT_FILE=/app/volumes/crypto-config/peerOrganizations/${org}/peers/${peer}.${org}/tls/ca.crt \
    -e CORE_PEER_MSPCONFIGPATH="/app/volumes/crypto-config/peerOrganizations/${org}/users/Admin@${org}/msp" \
    cli \
    /bin/bash -c "peer channel list"
}


(echo "Listing channels for peer0@org1" &&
listChannel "peer0" "org1.first-app.com" "Org1MSP" &&
echo "Listing channels for peer0@org2" &&
listChannel "peer0" "org2.first-app.com" "Org2MSP" &&
echo "Listing channels for peer0@org3" &&
listChannel "peer0" "org3.first-app.com" "Org3MSP") ||
echo "Failed"
