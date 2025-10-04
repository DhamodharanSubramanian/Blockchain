//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleIntegers{

    uint8 public myUint;

    function increment_unsigned() public{
        myUint++;
    }

    function decrement_unsigned() public{
        unchecked{
            myUint--;
        }

    }
}