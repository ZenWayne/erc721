// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./BaseTest.t.sol";
import {ERC721Test} from "./ERC721.t.sol";
import {IERC721} from "../src/erc721/IERC721.sol";
import "../src/NFT.sol";

contract ERC721EnumerableTest is ERC721Test {
    uint256 private testNumber;

    function setUp() public virtual override {
        super.setUp();
        testNumber = 721;
    }

    function test_supportsInterface() public override {
        assertEq(nft_contract.supportsInterface(0x780e9d63), true);
        super.test_supportsInterface();
    }
}
//why the function call in nft_contract.mint will revert?
