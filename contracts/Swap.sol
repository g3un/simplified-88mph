// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import { console } from "hardhat/console.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import { WETH } from "./WETH.sol";
import { MPHToken } from "./MPHToken.sol";

interface IUniswapV2Callee {
  function uniswapV2Call(address sender, uint amount0, uint amount1, bytes calldata data) external;
}

contract Swap {
  WETH public wETH; 
  MPHToken public mphToken;

  constructor(address _wETH, address _mphToken) {
    wETH = WETH(_wETH);
    mphToken = MPHToken(_mphToken);

    wETH.mint(address(this), type(uint32).max);
    mphToken.mint(address(this), type(uint64).max);
  }

  function _getExchange(uint amount0Out, uint amount1Out) public returns (uint) {
    return amount0Out != 0 ? amount0Out * 2 : amount1Out / 2;
  }

  function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external {
    address _from;
    address _to;
    uint _amount;

    if (amount0Out != 0) {
      _from = address(wETH);
      _to = address(mphToken);
      _amount = amount0Out;
    } else {
      _to = address(wETH);
      _from = address(mphToken);
      _amount = amount1Out;
    }

    if (data.length == 0) {
      IERC20(_to).transfer(to, _getExchange(amount0Out, amount1Out));
      IERC20(_from).transferFrom(to, address(this), _amount);
    } else {
      uint balanceBefore = IERC20(_from).balanceOf(address(this));

      IERC20(_from).transfer(to, _amount);
      IUniswapV2Callee(to).uniswapV2Call(to, amount0Out, amount1Out, data);

      uint balanceAfter = IERC20(_from).balanceOf(address(this));

      require(balanceBefore <= balanceAfter);
    }
  }
}
