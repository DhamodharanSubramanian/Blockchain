//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract contractOne{

    mapping(address => uint) public addressBalance; // stores which address sent the money

    function deposit() public payable{
       addressBalance[msg.sender] += msg.value; 
    }

    receive() external payable{
       addressBalance[msg.sender] += msg.value; 
    }

    function getThisSCBalance() public view returns(uint){
        return address(this).balance;
    }

}

contract contractTwo{
    function deposit() public payable{}

    function depositOnContractOneByFallBack(address _address) public {
        (bool success, ) = _address.call{value:10, gas:100000}("");     //call returns 2 values, capturing the first one
        require(success, "Function call failed");
    }

    function depositOnContractOneByFunction(address _address) public {
        bytes memory payload = abi.encodeWithSignature("deposit()");
        (bool success, ) = _address.call{value:10, gas:100000}(payload);     //call returns 2 values, capturing the first one
        require(success, "Function call failed");
    }
}