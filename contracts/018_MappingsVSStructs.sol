//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract myContract{
    
    /* structure to hold the amount and timestamp of the transaction */
    struct transaction_t{
        uint amount;
        uint timestamp;
    }

    /* structure to hold the balance and transaction status for each node */
    struct balance_t{
        uint totalBalance;
        uint numDeposit;
        mapping(uint => transaction_t) depositDetail;
        uint numWithdraw;
        mapping(uint => transaction_t) withdrawDetail;
    }

    /* Global variable to see the details for each address */
    mapping(address => balance_t) public balanceReceived;

    /* Function to record the deposit transaction */
    function depositMoney() public payable{
        /* First record a transaction */
        transaction_t memory current_transaction = transaction_t(msg.value, block.timestamp);

        /* Store the recorded transaction to respective address */
        /* temp address for the ease of programming */
        address curent_address = msg.sender;
        uint deposit_idx = balanceReceived[curent_address].numDeposit;

        balanceReceived[curent_address].totalBalance += current_transaction.amount;         /* Increment the amount received */
        balanceReceived[curent_address].depositDetail[deposit_idx] = current_transaction;   /* Link the transsaction details to this address */
        balanceReceived[curent_address].numDeposit++;                                       /* Increment the idx for the next transaction */
    }

    /* Function to record the withdraw transaction */
    function withdrawMoney(address payable _to, uint _amount) public {
        /* First record a transaction */
        transaction_t memory current_transaction = transaction_t(_amount, block.timestamp);

        /* Store the recorded transaction to respective address */
        /* temp address for the ease of programming */
        address curent_address = msg.sender;
        uint withdraw_idx = balanceReceived[curent_address].numWithdraw;

        balanceReceived[curent_address].totalBalance -= current_transaction.amount;         /* Decrement the amount received */
        balanceReceived[curent_address].withdrawDetail[withdraw_idx] = current_transaction;  /* Link the transsaction details to this address */
        balanceReceived[curent_address].numWithdraw++;                                      /* Increment the idx for the next transaction */

        /* Send the amount out */
        _to.transfer(_amount);
    }

    /* Debug function to show the deposit detail */
    function showDepositDetail(address _addr, uint _deposit_idx) public view returns(transaction_t memory){
        return balanceReceived[_addr].depositDetail[_deposit_idx];
    }

    /* Debug function to show the withdraw detail */
    function showWithdrawDetail(address _addr, uint _withdraw_idx) public view returns(transaction_t memory){
        return balanceReceived[_addr].withdrawDetail[_withdraw_idx];
    }
}