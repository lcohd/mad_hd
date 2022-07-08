// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

import "./abstractContract/Recoverable.sol";
import "./abstractContract/Initializable.sol";

contract Take2 is Initializable,Ownable,Recoverable{

    address madToken;
    address usdtToken = 0x55d398326f99059fF775485246999027B3197955;

    function init(address _madToken) public onlyOwner {
        madToken = _madToken;
        require(madToken != address(0), "Invalid madToken");
        initialized = true;
    }

    // take contract usdt
    function takeUsdt(address recipient, uint256 amount) external onlyOwner {
        IERC20(usdtToken).transfer(recipient, amount);
    }

    // query contract usdt
    function queryUsdt() external view returns(uint256){
       return IERC20(usdtToken).balanceOf(address(this));
    }

    // take contract mad
    function takeMad(address recipient, uint256 amount ) external needInit {
        IERC20(madToken).transfer(recipient, amount);
    }

    // query contract mad
    function queryMad() external view returns(uint256){
       return IERC20(madToken).balanceOf(address(this));
    }

}