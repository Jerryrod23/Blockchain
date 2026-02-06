// license
// SPDX-License-Identifier: LGPL-3.0-only

// version  
pragma solidity ^0.8.24;

import  "./Interfaces/IResultado.sol";

contract Multiplier {
    // variables

    //address del contrato de resultado
    address public dirResultado;    

    constructor(address resultado_) {
        dirResultado = resultado_; 
    }

    // modifiers 

    // events

    // functions

    // External Functions

    function multiplier(uint256 num1_ , uint256 num2_) external {
        uint256 resultado_ = num1_ * num2_;

        IResultado(dirResultado).setResultado(resultado_);
    }

    function setFee(uint256 newFee_) external {
        IResultado(dirResultado).setFee(newFee_);
    }
    
    // Internal Functions 

}