// license
// SPDX-License-Identifier: LGPL-3.0-only

// version  
pragma solidity ^0.8.24;

contract RequireTest {
    // Variables

    error SenderNotadmin(address);

    address public admin;

    constructor(address admin_) {
        admin = admin_;
    } 

    // Modifiers 

    // Events

    // Fuctions 

    // External Functions 

    // use if
    function CheckAdmin() public view {
        if(msg.sender != admin) revert();
    }
    // use require
    function CheckAdmin2() public view {
        require(msg.sender == admin, "msg.sender is not admin");
    }
    //if con custom error
    function CheckAdmin3() public view{
        if(msg.sender != admin) revert SenderNotadmin(msg.sender);
    }



    // Internal Functions


    
}