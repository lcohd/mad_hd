// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

abstract contract Recoverable is Ownable {
    event Received(address indexed, uint256);
    event Recover(address indexed, uint256);
    event RecoverToken(address indexed, uint256);

    receive() external virtual payable {
        // custom function code
        emit Received(_msgSender(), msg.value);   
    }

    function recover(address toAddr) public virtual onlyOwner {
        uint256 balance = address(this).balance;

        Address.sendValue(payable(toAddr), balance);
        emit Recover(toAddr, balance);
    }

    function recoverToken(IERC20 token, address toAddr) public virtual onlyOwner {
        uint256 balance = token.balanceOf(address(this));

        token.transfer(toAddr, balance);
        emit RecoverToken(toAddr, balance);
    }
}