// SPDX-License-Identifier: GPL-3.0-only

//Version
pragma solidity ^0.8.24;

// Functions 
    // 1. Deposit ether
    // 2. Withdraw ether

//Rules
    // 1. Multiuser
    // 2. Only can deposit ether
    // 3. User can only withdraw previosly deposited ether
    // 4. Max balance = 5 ether
    // 5. MAxbalance modifiable by owner
    // UserA -> Deposit (5 ether)
    // UserB -> Deposit (2 ether)
    // Bank balance = 7 ether
    // UserA -> Deposit 1 ether -> deposit 5 ether -> withdraw 2 ether -> deposit 5 ether

contract CryptoBankV2 {

    //<--Variables-->

    uint256 public maxBalance;
    address public admin;
    mapping (address => uint256) public userBalance;

    constructor(uint256 maxBalance_, address admin_) {
        maxBalance = maxBalance_;
        admin = admin_;
    }

    //<--Modifiers-->

    modifier Onlyadmin(){
        require(msg.sender == admin,"Not Allowed");
        _;
    }

    //<--Events-->

    event EtherDeposit(address user_, uint256 etherAmount_);
    event WithdrawEther(address user_, uint256 etherAmount_);

    //<--External Functions-->

    // Deposit
    function depositEther() external payable  {
        require(userBalance[msg.sender] + msg.value <= maxBalance,"MaxBalance Reached");

        userBalance[msg.sender] += msg.value;
        emit EtherDeposit(msg.sender, msg.value);
    }

    // Withdraw
    function withdrawEther(uint256 amount_) external  {
        require(amount_ <= userBalance[msg.sender], "Not enough ether");
                                            // CEI Pattern: 1. Checks 2. Effects (Update state) 3. Interaction
        // 1.Updted state                   // Reeanrancy Attacks  
        userBalance[msg.sender] -= amount_;

        // 2. Transfer Ether
        (bool success, ) = msg.sender.call{value: amount_}("");
        require(success,"Transfer Failed");

        emit WithdrawEther(msg.sender, amount_);
    }

    function modifyMaxBalance(uint256 newMaxBalance_) external  Onlyadmin{
         maxBalance = newMaxBalance_;
    }


    //<--Internal Functions-->
}