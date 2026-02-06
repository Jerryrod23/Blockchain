// license
// SPDX-License-Identifier: LGPL-3.0-only

// version  
pragma solidity ^0.8.24;

// Requerimientos 
    // 1. Un banco debe poder depositar dinero en las cuentas de sus clientes -> Deposit ether.
    // 2. Un banco debe poder retirar dinero de las cuentas de sus clientes ->  Withdaw ether.

// Reglas
    // 1. Multiuser
    // 2. Only can deposit ether
    // 3. User can only withdraw previously deposited ether
    // 4. Max balance = ether.
    // 5. Max balance modifiable by owner.

contract CryptoBank {

    // Variables

    uint256 public maxBalance;
    address public admin;
    mapping ( address => uint256 ) public userBalance;

    constructor(uint256 maxBalance_, address admin_) {
        maxBalance = maxBalance_;
        admin = admin_;
    }

    
    // Modifiers 

    // Events
    event Deposit(address indexed from, uint256 amount_);
    event Withdraw(address indexed from, uint256 amount_);

    // Structs

    // Fuctions

    // External Functions

    // 1. Deposit

     function deposit() external payable {
        require(msg.value <= maxBalance, string.concat("No puedes depositar mas deether"));
        require(msg.value != 0, "No puedes depositar 0 ether");
        if(userBalance[msg.sender] + msg.value > maxBalance) revert("No puedes depositar mas de ether");  //revert("No puedes depositar mas de 10 ether"); [msg.sender]);
        userBalance[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    // 2. Withdraw 
    
    function withdraw(uint256 amount_) external {
        // CEI pattern: 1. Checks 2. Update state 3. Interaction
        
        require(amount_ <= userBalance[msg.sender], "You don't have enough balance to withdraw"); 

        // 1. update state balance
            userBalance[msg.sender] -= amount_;
 
        // 2. Transfert ether
          (bool success,) = msg.sender.call{value: amount_}("") ;
            require(success, "Transfer failed");

        // 3. emit event
        emit Withdraw(msg.sender, amount_); 
    }

    // Internal Functions

}