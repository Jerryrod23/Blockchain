// SPDX-License-Identifier: LGPL-3.8-only

// version
pragma solidity ^ 0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CryptoSC is ERC20{

    constructor(string memory name_, string memory symbol_) ERC20(name_, symbol_){
        _mint(msg.sender, 1000 * 1e18); // 1e18 le coloca 18 ceros al mil, esto porque la funcion mint soporte 18 ceros.
    }

// Variables


// Modifiers

// Events


// Funciones 

// Funciones Externar


// funciones Internas





}