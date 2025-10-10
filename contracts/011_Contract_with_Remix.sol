//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract MyContract{
    string public MyString = "Hello World";

    function UpdateTheString(string memory _newstring) public {
        MyString = _newstring;
    }
}