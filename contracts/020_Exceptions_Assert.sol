//SPDX-License-Identifier: MIT

pragma solidity 0.7.0;

contract myContract{

    mapping(address => uint8) public balanceAvailable;

    function depositMoney() public payable {
        assert(msg.value == uint8(msg.value));
        balanceAvailable[msg.sender] += uint8(msg.value);
        assert(balanceAvailable[msg.sender] >= uint8(msg.value));
    }

    function withdrawMoney(address payable _to, uint8 _amount) public {
        require(balanceAvailable[msg.sender] >= _amount, "Not enough funds!!!");
        balanceAvailable[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}