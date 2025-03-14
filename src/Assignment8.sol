// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Make this contract inherit from ERC721URIStorage and Ownable
contract Assignment8 is ERC721URIStorage, Ownable {
    // Declare a private uint called _tokenIdCounter
    uint private _tokenIdCounter;

    // Pass name and symbol of the NFT token collection
    constructor() ERC721("NFT", "NFT") {
        // Set _tokenIdCounter to 0
        _tokenIdCounter = 0;
    }

    // Function to mint an NFT
    // Visibility: external
    // Pass a string json uri parameter
    // Restrict this function to be called only by the owner
    function mintNFT(address to, string memory tokenURI) external onlyOwner {
        // Increment token ID counter
        _tokenIdCounter++;

        // Mint a new NFT to the function caller
        _mint(to, _tokenIdCounter);

        // Set token URI to the token ID using _setTokenURI
        _setTokenURI(_tokenIdCounter, tokenURI);
    }
}
