//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract myContract{

    mapping(address => uint) moneySentBySender;

    function sendMoney() public payable{
        moneySentBySender[msg.sender] += msg.value; 
    }

    function getSCBalance() public view returns(uint){
        return address(this).balance;
    }

    function getSenderBalance() public view returns(uint){
        return moneySentBySender[msg.sender];
    }

    function withdrawAllMoney(address payable _to) public{
        _to.transfer(getSCBalance());
    }

    function withdrawMoneySentBySender(address payable _to) public{
        uint moneyToBeSent = moneySentBySender[msg.sender];
        moneySentBySender[msg.sender] = 0;
        _to.transfer(moneyToBeSent);
    }

}