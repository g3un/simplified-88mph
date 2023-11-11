// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WETH is ERC20 {
    constructor() ERC20("Wrapping ETH", "WETH") {
    }

    function mint(address sender, uint256 amount) external {
        _mint(sender, amount);
    }
}
