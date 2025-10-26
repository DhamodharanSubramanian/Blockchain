//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract Sender{
    /* Function to receive funds */
    function receiver() public payable{

    }

    function withdrawBySend(address payable _to) public {
        bool isSent = _to.send(10); //Sends 10 Wei
        require(isSent , "Not enough funds!!!");
    }

    function withdrawByTransfer(address payable _to) public {
        _to.transfer(10); //Sends 10 Wei
    }
}

contract ReceiverNoAction{
    /* Receive function to receive funds */
    receive () external payable{}

    function balance() public view returns(uint){
        return address(this).balance;
    }
}

contract ReceiverWithAction{
    uint public balanceReceived;

    /* Receive function to receive funds */
    receive () external payable{
        balanceReceived += msg.value;
    }

}