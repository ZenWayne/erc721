// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC721Test} from "./ERC721.t.sol";
import {IERC721} from "../src/erc721/IERC721.sol";

contract NFTTest is ERC721Test {
    uint256 private testNumber;

    function setUp() public override {
        testNumber = 100001;
        super.setUp();
    }

    struct tokenURI {
        uint256 tokenId;
        string uri;
    }

    function test_create() public {
        uint256 previous_balance = nft_contract.balanceOf(deployer);
        tokenURI[] memory tokens = new tokenURI[](1);
        tokens[0] = tokenURI(16353, "https://ipfs.filebase.io/ipfs/QmVgv9wFmfqaWXPyciiqoSB3KGMUuJNRLvfUV3U7Dvzsxs");

        for (uint256 i = 0; i < tokens.length; i++) {
            //msg.sender change
            vm.prank(deployer);
            vm.expectEmit();
            emit IERC721.Transfer(address(0), deployer, tokens[i].tokenId);
            nft_contract.create(tokens[i].uri, tokens[i].tokenId);
        }
        uint256 totalsupply = nft_contract.totalSupply();
        for (uint256 i = 0; i < totalsupply; i++) {
            uint256 tokenId = nft_contract.tokenByIndex(i);
            assertEq(nft_contract.tokenURI(tokenId), tokens[i].uri);
            assertEq(nft_contract.ownerOf(tokenId), deployer);
        }
        assertEq(nft_contract.balanceOf(deployer), previous_balance + tokens.length);
    }
}
