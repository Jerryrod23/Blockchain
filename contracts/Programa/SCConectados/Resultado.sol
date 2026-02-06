// license
// SPDX-License-Identifier: LGPL-3.0-only

// version  
pragma solidity ^0.8.24;
 
contract Resultado{
    // Variables
 
    uint256 public resultado;
    address public admin;
    uint256 public fee;

    constructor(address admin_) {
        admin = admin_; 
        fee = 5;
    }

    // Modifiers

    // Events

    // Functions

    // External Functions 

    function setResultado(uint256 num_) external  {
        resultado = num_;
    }

    function setFee(uint256 newfee_) external  {
        if(tx.origin != admin ) revert();
        fee = newfee_;
    }
 
    // Internal Fucttions 

}