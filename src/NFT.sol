// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC721Enumerable} from "./erc721/ERC721Enumerable.sol";

contract NFT is ERC721Enumerable {
    address m_founder;

    constructor(string memory _name, string memory _symbol) {
        m_name = _name;
        m_symbol = _symbol;
        m_founder = msg.sender;
    }

    //the mint function in another contract
    function create(string memory _uri, uint256 _tokenId) public {
        //this condition is not satisfied
        //require(msg.sender == owner, "you can only create your own NFT");
        require(_tokenOwner[_tokenId] == address(0), "token created");
        //Data of ERC721Enumerable
        _tokenListLen += 1;
        Node storage new_node = _tokens[_tokenId];
        new_node._previousTokenId = _tokenListTail.tokenId;
        new_node.tokenId = _tokenId;
        _tokenListTail = new_node;

        _tokenURI[_tokenId] = _uri;

        //Transfer Operation
        _balance[address(0)] += 1;
        super._transferfrom(address(0), msg.sender, _tokenId, "");
    }

    function founder() external view returns (address) {
        return m_founder;
    }
}
