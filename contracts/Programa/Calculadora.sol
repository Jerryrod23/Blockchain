// license
// SPDX-License-Identifier: LGPL-3.0-only

// version  
pragma solidity ^0.8.24;

// contract
contract Calculadora{

    // Variables
    uint256 public resultado = 10;


    // Modifiers

    modifier checknumber(uint256 num_){
        if(num_ != 10) revert();
        _; // esto esta indicando que se ejecuta la funcion en donde se esta invocando el modificador
    }

    // Events

    // Evento creado para la funcion de adiccion.
    event Addition(uint256 number1, uint256 number2, uint256 resultado);

    // Evento creado para la funcion de resta.
    event Substraction(uint256 number1, uint256 number2, uint256 resultado);

    // Funciones 
    // Plabra (function) + nombre + argumentos + visibilidad + modifcadores + valor devuelto

    // Funciones External

    // funcion para sumar dos numeros.
    function addition(uint256 num1_, uint256 num2_) public returns(uint256 resultado_){
        resultado_ = num1_ + num2_;

        emit Addition(num1_, num2_, resultado_);
    }

    // funcion para restar dos numeros.
    function substraction(uint256 num1_, uint256 num2_) public returns(uint256 resultado_){
        resultado_ = Substraction_logic(num1_, num2_);

        emit Substraction(num1_ , num2_, resultado_);
    } 

    function multiplier (uint256 num_) public {
        resultado = resultado * num_;
    }

    function multiplier2 (uint256 num_) public checknumber(num_) {
        resultado = resultado * num_;
    }


    // Funciones Internas

    function Substraction_logic(uint256 num1_, uint256 num2_) internal pure returns(uint256 resultado_){
        resultado_ = num1_ - num2_;

    }

}