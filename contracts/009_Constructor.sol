//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract exampleConstructor{

    uint8 public myVar;

    constructor (uint8 _getVar){
        myVar = _getVar;
    }
}