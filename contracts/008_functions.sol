//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract TypesOfFunctions{

    uint public var1;

    function pure_func(uint _getVar) public pure{
 //     var1  = _getVar; /* Cannot do this as we can't access variables outside the function */
    }

    function pure_func_working(uint8 a, uint8 b) public pure returns(uint) {
        return  a+b;
    }

    function view_func(uint _getVar) public view{
 //     var1  = _getVar; /* Cannot do this as we can't wirte variables outside the function */
    }

    function normal_func(uint _getVar) public {
      var1  = _getVar; /* Cannot do this as we can't wirte variables outside the function */
    }

}