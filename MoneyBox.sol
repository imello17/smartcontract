// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Moneybox{
    uint256 public balance;
    address private owner;

    receive() external payable { // 0xdude_yours#1(*HwalletNumber
        balance += msg.value;
     }

     constructor(){
        owner = msg.sender;
     }

    function withdraw (uint amount, address payable destAddr) public {
        require(msg.sender == owner, "ONLY OWNER CAN WITHDRAW");
        require(amount <= balance, "NOT ENOUGH MONEY");
    
        destAddr.transfer(amount);
        balance -= amount;
    }

}
