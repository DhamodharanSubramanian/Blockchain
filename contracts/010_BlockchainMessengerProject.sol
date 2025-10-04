//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract myBlockchainMessenger{

    string public myString = "Hello World";
    uint public change_counter;
    address  owner = msg.sender;

    function updateMyString(string memory _getString) public {
        if(msg.sender == owner)
        {
           myString = _getString;
        change_counter++; 
        }   
   }
}