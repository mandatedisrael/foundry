// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Pool {
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
        balance = 5 ether;
    }

    function setOwner(address _newOwner) public {
        require(msg.sender == owner, "only owner can change owner");
        owner = _newOwner;
    }

    function deposit() public payable {
        balance += msg.value;
    }

    function withdraw(address _destination, uint256 _amount) public payable {
        require(msg.sender == owner, "only owner can withdraw");
        require(_amount <= balance, "not enough balance");
        balance -= _amount; 
        payable(_destination).transfer(_amount);
    }
}
