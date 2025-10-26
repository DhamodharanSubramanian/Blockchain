/* 1. The wallet has one owner
 * 2. The wallet should be able to receive funds, no matter what
 * 3. It is possible for the owner to spend funds on any kind of address,
 *    no matter if its a so-called Externally Owned Account (EOA - with a private key),
 *    or a Contract Address.
 * 4. It should be possible to allow certain people to spend up to a certain amount of funds.
 * 5. It should be possible to set the owner to a different address by a minimum of 3 out of 5 guardians, in case funds are lost. */

//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

/****************************************************************************************************************************************
 ************************************************Smart Wallet Implementation ************************************************************
 ****************************************************************************************************************************************/
contract mySmartWallet{

    address payable public owner;   //Owner of the wallet ie., the deployer of the Smart contract
    mapping (address => bool) isAllowed;    //if an address shall able to send money from this wallet
    mapping (address => uint) allowanceLimit;   //Limit of money that is allowed to send from this wallet
    uint constant maxNoOfGuardians = 5;     // Maximum guardians allowed for this wallet
    uint noOfGuardians; //Curreny number of guardians nominated for this wallet
    mapping(address => bool) public guardianList;// Guardians list for this wallet
    mapping(address => bool) public isGuardianVoted; //if this guardian has already voted
    mapping(address => uint) public nextOwnerList;  //Voting count to elect the next owner for this wallet
    uint constant maxNoOfVotesForNewOwner = 3;  //Maximum number of votes required to select a new owner
    bool public isOwnerChangedAlready; //Only once owner shall be changed for this Wallet

    /* Store the deployer of the Wallet as the owner */
    constructor(){
        owner = payable(msg.sender);
    }

    /* Fallback function to receive funds to the wallet */
    receive() external payable {}

    /* Function to return the current balance of this smart contract */
    function getWalletBalance() public view returns(uint){
        return address(this).balance;
    }

     /* Function to send money to a function/smart contract.
      * param - _to: Address of the smart contract
      *         _amount: amount to be sent
      *         payload: Address of the function(This you will get from the input data)
      */
     function sendMoney(address payable _to, uint _amount, bytes memory payload) public returns (bytes memory){
        require(_amount <= address(this).balance, "Aborting!! Not enough funds");   // Check if there are enought funds in this Smart Contract

        
        if(owner != msg.sender){
            require(isAllowed[msg.sender], "Aborting!! You are not allowed to send money"); // Check if the node is allowed to send money
            require(allowanceLimit[msg.sender] >= _amount, "Aborting!! You are not allowed to send this much amount");  //Check the amount limit the node can send 
            allowanceLimit[msg.sender] -= _amount;  // Reduce the allowance limit
        }
  
        (bool isSent, bytes memory returnData) = _to.call{value:_amount}(payload);  //Send transaction
        require(isSent, "Aborting!! Sending unsuccessful!");    //Check if it is successfully sent 

        return returnData;
     }

    /* Function to set the allowance and allowance limit to an address.
     * param - _address: Address
     *         _allowanceLimit: Allowance limit
     */
    function setAllowance(address _address, uint _allowanceLimit) public{
        require(owner == msg.sender, "Aborting!! You are not the owner");   // Only owner can perform the operation
        isAllowed[_address] = true; // Set allowance flag
        allowanceLimit[_address] = _allowanceLimit; // Set allowance limit
    }

    /* Function to clear the allowance and allowance limit to an address.
     * param - _address: Address
     */
    function denyAllowance(address _address) public{
        require(owner == msg.sender, "Aborting!! You are not the owner");   // Only owner can perform the operation
        isAllowed[_address] = false;    // Clear allowance flag
        allowanceLimit[_address] = 0;   // Clear allowance limit
    }

    
    /* Function to set the guardians for this wallet
    * param - _address: address to be set as the guardian
    */
    function setGuardian(address _address) public {
        require(owner == msg.sender, "Aborting!! You are not the owner");
        require(owner != _address, "Aborting!! Guardian shall be different from the Owner");
        require(noOfGuardians < maxNoOfGuardians, "Aborting!! Already all guardians are set");
        require(false == guardianList[_address], "Aborting!! This address is already a Guardian");

        noOfGuardians++;
        guardianList[_address] = true;   
    }


    /* Function to nominate a new owner for this wallet.
     * Note: - Only once the owner can be change(to be used in case of emergency to withdraw the funds leftover in this wallet) 
     *       - Each guardian can vote only once
     * param - _address: address to be set as the guardian
     */
    function nominateNewOwner(address _address) public {
        require(false == isOwnerChangedAlready, "Aborting!! Owner has already been changed  for this wallet");
        require(guardianList[msg.sender], "Aborting!! You are not a Guardian to nominate a new owner");
        require(false == isGuardianVoted[msg.sender], "Aborting!! You have already voted for a new owner");

        isGuardianVoted[msg.sender] = true;    //Guardian has voted
        nextOwnerList[_address]++;   // Increment the vote for this address to be the nextOwner
        
        if(maxNoOfVotesForNewOwner <= nextOwnerList[_address])
        {
            isOwnerChangedAlready = true;   //Changing the owner for this wallet
            owner = payable(_address);  //Set new owner for this wallet
        }
    }

}

/* This contract is to test if the smart wallet send transaction is working fine */
contract consumer{

    /* Function to receive funds to the smart contract */
    function receiveMoney() public payable{}

    /* Function to return the current balance of this smart contract */
    function getBalance() public view returns(uint){
        return address(this).balance;
    }

}