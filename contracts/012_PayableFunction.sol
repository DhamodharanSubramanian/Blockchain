//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract MyContract{
    string public MyString = "Hello World";

    function UpdateTheString(string memory _newstring) public payable{
        
        if(msg.value == 1 ether)
        {
            /* Update the string only if the value is equal to 1 Eth */
            MyString = _newstring;
        }
        else 
        {
            /* Else send the Eth back */
            payable(msg.sender).transfer(msg.value);
        }
        
    }
}