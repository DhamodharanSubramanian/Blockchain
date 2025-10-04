//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract myContract {
    bool public myBool ;
    
    function init_Bool(bool _getBool) public {
        myBool = _getBool;
    }
}