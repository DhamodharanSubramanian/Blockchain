//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract msgSender{

    function getMsgSender() public view returns(address)
    {
        return msg.sender;
    }
}