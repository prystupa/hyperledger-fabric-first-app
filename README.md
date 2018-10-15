# hyperledger-fabric-first-app
My first app trying out Hyperledger Fabric. Steps below are to get the app up-and-running.

#### 1. Generate cryptographic keys for 1 orderer and 3 different organizations
```sh
hyperledger-fabric-first-app $ ./scripts/01-generate-key-material.sh
```
This command runs cryptogen to generate keys and stores them on your local drive in .volumes/crypto-config.

#### 2. Generate orderer genesis block and a test channel with 3 organizations in it
```sh
hyperledger-fabric-first-app $ ./scripts/02-generate-channel-config.sh
```
This command runs configtxgen (5 times) to generate:
- orderer genesis block
- channel creation transaction 
- anchor peer update transactions (one for each organization)

and stores them on your local drive in .volumes/channel-config.
