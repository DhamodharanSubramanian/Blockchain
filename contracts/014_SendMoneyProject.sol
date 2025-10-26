//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract myContract{

    uint public currentBalance;

    /* Deposits the eth irrespective of the sender */
    function Deposit() public payable{
        currentBalance += msg.value;
    }

    /* Get the current account's balance */
    function getSCBalance() public view returns(uint){
        return address(this).balance;
    }

    /* Send money to the request */
    function WithdrawToSender() public payable {
        address payable to = payable(msg.sender);
        to.transfer(getSCBalance());
    }

    /* Send money to the specified address */
    function WithdrawMoneyToAddress(address payable to) public{
        to.transfer(getSCBalance());
    }
}
