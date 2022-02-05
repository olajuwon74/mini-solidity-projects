// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Bank{

    // everybody should have an account
    //anybody should be able to pay into the account
    //only the owner of the account should be able to withdaw from his account
    address payable Owner;
     constructor(){
        Owner == msg.sender;
    }

    
    mapping(address => uint) public balances;
    uint bank_balance;


    function deposit(address _to) public payable returns(uint){
        balances[_to] += msg.value;
        return balances[msg.sender];
    }

    function withdraw(uint _amount) public payable {
        require(balances[msg.sender] >= _amount, "input a lesser amount");
        balances[msg.sender] -= _amount;
        bank_balance -= _amount;
        msg.sender.call{value: _amount}("");
    }

    function transfer(address _to, uint _amount) public {
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }

}