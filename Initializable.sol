// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 可被主合约调用的
abstract contract Initializable {
    // 是否已初始化
    bool public initialized = false;

    modifier needInit() {
        require(initialized, "Contract not init.");
        _;
    }
}