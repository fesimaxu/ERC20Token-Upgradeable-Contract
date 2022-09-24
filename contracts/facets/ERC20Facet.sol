// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../interfaces/IERC20.sol";
import "../libraries/LibERC20.sol";

contract ERC20Facet is IERC20{
        
        LibERC20Storage internal s;

        function name() external view returns(string memory){
          return s.name;
        }

        function symbol() external view returns(string memory){
           return s.symbol;
        }
        function totalSupply() external view override virtual returns(uint256){

            return s.totalSupply;
        }

        function decimal() external view returns(uint256){
           return s.decimal;
        }

        function allowance(address from, address _to) external view override virtual returns(uint256){
           return s.ownerAllowance[from][_to]; 
        }

        function balanceOf(address _address) external view override virtual returns(uint256){
            return s.balance[_address];
        }

        function transfer(address _to, uint256 amount) external override virtual returns(bool){
            
            require(_to != address(0), "Invalid address");
            require(s.balance[msg.sender] >= amount, "Insufficient fund");

            s.balance[msg.sender] -= amount;
            s.balance[msg.sender] = 0;
            s.balance[_to] += amount;

            emit Transfer(msg.sender, _to, amount);

            return true;
        }


        function approve(address spender, uint256 amount) external override virtual returns(bool){
            require(spender != address(0), "invalid address");
            s.ownerAllowance[msg.sender][spender] = amount;

            emit Approve(msg.sender, spender, amount);

             return true;
        }

        function transferFrom(address from, address _to, uint256 amount) external override virtual returns(bool){
            require(from != address(0), "Invalid address");
            require(_to != address(0), "Invalid address");
            require(s.balance[from] >= amount, "Insufficient fund");
           
            s.ownerAllowance[from][_to] -= amount;
            s.balance[from] -= amount;
            s.balance[from] = 0;
            s.balance[_to] += amount;

            emit Transfer(from, _to, amount);

            return true;
        }


        function mint(uint256 amount) external {
            s.balance[msg.sender] += amount;
            s.totalSupply += amount;

            emit Transfer(address(0), msg.sender, amount);
        }

        function burn(uint256 amount) external {
            s.balance[msg.sender] -= amount;
            s.totalSupply -= amount;

            emit Transfer(msg.sender, address(0), amount);
        }



}