docker run -v $(pwd):/erc721 ethereum/solc:stable -o /erc721/out/NFT.sol/ --abi --bin /erc
721/src/NFT.sol
#abigen --bin=./erc721/out/NFT.bin --abi=./erc721/out/NFT.abi --pkg=NFT --out=Contract.go