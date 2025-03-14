// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Assignment8} from "../src/Assignment8.sol";

contract Assignment8Test is Test {
    Assignment8 assignment;
    string public temporaryUriForTesting = "https://azure-yearning-shrew-339.mypinata.cloud/ipfs/bafkreifo3hg2hnig5ojay3tonmf6un3qlxqjienffsmpkq5cfpept2fake";
    address owner;
    address nonOwner;

    function setUp() public {
        owner = address(this);
        nonOwner = makeAddr("nonOwner");
        assignment = new Assignment8();
    }

    function testMintNFTByOwner() public {
        // Mint an NFT to the test contract (owner calling)
        assignment.mintNFT(owner, temporaryUriForTesting);

        // Check ownership of the minted NFT
        address nftOwner = assignment.ownerOf(1);
        assertEq(nftOwner, owner, "Owner of token ID 1 should be the test contract");
    }

    function testMintNFTByNonOwner() public {
        // Simulate a non-owner calling the function
        vm.prank(nonOwner);
        vm.expectRevert();
        assignment.mintNFT(nonOwner, temporaryUriForTesting);
    }
}
