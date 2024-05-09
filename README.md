## ERC721

An ERC721 library

IERC721Enumerable implemente via link-list

## Documentation

## Usage

abi file is generated on out directory
use the abi file to interact with the contract

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Deploy

#### Deploy to localnet
```shell
$ forge script src/NFT.sol:NFT --rpc-url <your_rpc_url> --private-key <your_private_key>
```

#### Deploy to testnet

1. deploy
```shell
forge create --constructor-args "My First NFT" "MFNFT" --rpc-url https://eth-sepolia.g.alchemy.com/v2/<your_project_api_key> --private-key <your_private_key> src/NFT.sol:NFT
```

2. verify
```shell
forge verify-contract 
    --chain-id 11155111  
    --watch 
    --constructor-args $(cast abi-encode "constructor(string, string)" "My First NFT" "MFNFT")
    --etherscan-api-key <your_ether_scan_api_key>
    --compiler-version <compiler_version>
    <contract_address>
    src/NFT.sol:NFT
```
