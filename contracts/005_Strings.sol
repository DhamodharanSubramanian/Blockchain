//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract Strings{
    string public myString = unicode"Hello Wörld";

    bytes myBytes = unicode"Hello Wörld";


    function updateString(string memory _getString) public {
        myString = _getString;
    }

    function get_No_of_bytes() public view returns (uint){
        return myBytes.length;
    }
}