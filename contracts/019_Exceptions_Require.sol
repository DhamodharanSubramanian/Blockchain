//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract myContract{

    mapping(address => uint) public balanceAvailable;

    function depositMoney() public payable {
        balanceAvailable[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(balanceAvailable[msg.sender] >= _amount, "Not enough funds!!!");
        balanceAvailable[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}