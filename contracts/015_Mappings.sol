//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;


contract myContract{

    mapping (uint => bool) public myMapping;
    mapping (address =>  bool) public myAddressMapping;
    mapping (uint => mapping(uint => bool)) public myUintUintMapping;

    function showMyMapping(uint _index) public view returns(bool){
        return myMapping[_index];
    }

    function changeMap(uint _index) public {
        myMapping[_index] = true;
    }

    function changeSenderAddressMap() public {
        myAddressMapping[msg.sender] = true;
    }

    function setmyUintUintMapping(uint _uint1, uint _uint2) public {
        myUintUintMapping[_uint1][_uint2] =true;
    }
}