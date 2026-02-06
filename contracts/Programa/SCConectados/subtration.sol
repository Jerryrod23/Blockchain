// license
// SPDX-License-Identifier: LGPL-3.0-only

// version  
pragma solidity ^0.8.24;

import  "./Interfaces/IResultado.sol";

contract subtration {
    // variables

    //address del smart contrat de resultado, el cual quiero invocar.
    address public dirResultado; 

    constructor(address resultado_) {
        dirResultado = resultado_;
    }

    // Modifiers

    // Events

    // Functions

    // External Functions

    function subtract(uint256 num1_, uint256 num2_) external  {
        uint256 resultado_ = num1_ - num2_;

        IResultado(dirResultado).setResultado(resultado_);
    }

    // Internal Functions 



}
