//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract exampleAddress{
    address public myAddress;

    function changeAddr(address _getaddr) public{
        myAddress = _getaddr;
    }

    function getBalance() public view returns(uint){
        return myAddress.balance;
    }

}