// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


struct LibERC20Storage {
    
    // Name of the Token
    string name;

    // Symbol of the Token
    string symbol;

    // Total Supply of the Token
    uint256 totalSupply;
    
    // Decimal value of the Token
    uint256 decimal;
    
    // Balance of the Token
    mapping(address => uint256) balance;
    
    // Allowance to spend
    mapping(address => mapping(address => uint256)) ownerAllowance;
}