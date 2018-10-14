# hyperledger-fabric-first-app
My first app trying out Hyperledger Fabric. Steps below are to get the app up-and-running.

#### 1. Generate cryptographic keys for 1 orderer and 3 different organizations
```sh
hyperledger-fabric-first-app $ ./scripts/00-generate-key-material.sh
```
This command runs cryptogen to generate keys and stores them on your local drive in .volumes/crypto-config.
