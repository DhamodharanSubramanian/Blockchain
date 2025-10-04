//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleIntegers{

    uint public myUint1;

    uint256 public myUint2;

    int public myInt1;

    function increment_unsigned() public{
        myUint1++;
    }

    function decrement_unsigned() public{
        myUint1--;
    }

    function increment_signed() public{
        myInt1++;
    }

    function decrement_signed() public{
        myInt1--;
    }


}