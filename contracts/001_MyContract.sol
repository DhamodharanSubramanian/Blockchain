//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract MyContract{

    string public myString = "Hello World";

    function UpdateTheString(string memory _newString) public {
       myString = _newString; 
    }

}

contract trySecond {
    
}