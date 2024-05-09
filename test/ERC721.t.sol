// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./BaseTest.t.sol";
import {ERC165Test} from "./ERC165.t.sol";

contract ERC721MetadataTest is BaseTest {
    uint256 private testNumber;

    function setUp() public virtual override {
        testNumber = 721;
        super.setUp();
    }

    function test_name() public view {
        assertEq(nft_contract.name(), _name);
    }

    function test_symbol() public view {
        assertEq(nft_contract.symbol(), _symbol);
    }
}

contract ERC721Test is ERC165Test, ERC721MetadataTest {
    uint256 private testNumber;

    function setUp() public virtual override(ERC165Test, ERC721MetadataTest) {
        testNumber = 721;
        super.setUp();
    }

    function test_supportsInterface() public virtual override {
        //edge test
        assertEq(nft_contract.supportsInterface(0), false);
        //code test
        assertEq(nft_contract.supportsInterface(0x80ac58cd), true);
        assertEq(nft_contract.supportsInterface(0x5b5e139f), true);
        super.test_supportsInterface();
    }
}
