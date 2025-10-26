//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

/* This contract shows from whom the amount is received and how much is the amount received */
contract myChildContract{
    address public from;
    uint public amount_received;

    constructor (address  _from, uint  _amount_received){
        from = _from;
        amount_received = _amount_received;
    }
}

/* This contract calls the child contract to store the address & value of the amount received */
contract myContract1{
    /* create an instance */
    myChildContract public paymentDetails;

    function getPayment() public payable{
        /* Call child contract */
        paymentDetails = new myChildContract(msg.sender, msg.value);
    }
}

/* Instead of child contract, this contract uses struct to use the details of the sender and the amount received */
contract myContract2{
    struct myWalletStruct_t{
        address from;
        uint value;
    }

    myWalletStruct_t public myWallet;

    function getPayment() public payable{
        /* Save in struct */
//        myWallet = myWalletStruct_t(msg.sender, msg.value);
          myWallet.from = msg.sender;
          myWallet.value = msg.value;
    }

}