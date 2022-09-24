// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    
    function totalSupply () external view returns(uint256);

    function balanceOf(address _address) external view returns(uint256);

    function transfer(address _to, uint256 amount) external returns(bool);

    function allowance(address owner, address spender) external view returns(uint256);

    function approve(address spender, uint256 amount) external returns(bool);

    function transferFrom(address from, address _to, uint256 amount) external returns(bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approve(address indexed owner , address indexed spender , uint256 value);
}