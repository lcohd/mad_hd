// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Public class
library Model {

    uint256 public constant uint256_0 = 0;
    uint256 public constant uint256_1 = 1;
    uint256 public constant uint256_2 = 2;
    uint256 public constant uint256_3 = 3;
    uint256 public constant uint256_4 = 4;
    uint256 public constant uint256_5 = 5;
    uint256 public constant uint256_6 = 6;
    uint256 public constant uint256_7 = 7;
    uint256 public constant uint256_8 = 8;
    uint256 public constant uint256_9 = 9;
    uint256 public constant uint256_20 = 20;

    // user
    struct User {
        address addr;
        address inviterAddr;
    }

    // level
    struct Level  {
        string name;                  // 名称
        uint256 levelNo;              // 级别号
        uint256 commissionGen;        // 佣金代数
        uint256 maxCommissionGen;     // 最大佣金代数
        uint256 price;                // 需要的usdt数量
        uint256 needOut;              // 需要出局才能升级到该等级
        uint256 genCountPerOut;       // 出局一次增加的代数奖励
    }

}