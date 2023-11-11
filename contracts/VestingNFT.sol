// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract VestingNFT is ERC721 {
    constructor() ERC721("Vesting NFT", "VNFT") {
    }

    function mint(address sender, uint256 amount) external {
        _safeMint(sender, amount);
    }
}
