//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract myContract{

    string public functionCalled; 

    /* Address of this function
        0xc3780a3a
        */
    function myFunction() public {
        functionCalled = "myFunction";
    }

    /* fallback function will be called when no address 
        or it can't find the address of the function 
    */
    fallback() external {
        functionCalled = "fallback";
    }

    /* receive function will be called when there is no address present.
        This overrides fallback function when no address present */
    receive() external payable{
        functionCalled = "receive";
    }
}