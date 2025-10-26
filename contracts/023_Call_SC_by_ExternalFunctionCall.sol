//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract contractOne{

    mapping(address => uint) public addressBalance; // stores which address sent the money

    function deposit() public payable{
       addressBalance[msg.sender] += msg.value; 
    }

    function getThisSCBalance() public view returns(uint){
        return address(this).balance;
    }

}

contract contractTwo{
    function deposit() public payable{}

    function depositOnContractOne(address _address) public {
        contractOne insConOne = contractOne(_address);
        insConOne.deposit{value:10, gas:100000}();  // Send 10 Wei to Contract One
    }

}