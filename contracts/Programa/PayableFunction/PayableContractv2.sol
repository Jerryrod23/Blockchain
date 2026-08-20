// SPDX-License-Identifier: GPL-3.0

//Version
pragma solidity ^0.8.24;

contract PayableContractv2 {
    //<--Variables-->

    //<--Modifiers-->

    //<--Events-->

    //<--External Functions-->

    function sendEther() public payable  {
        
    }

    function withdrawEther(uint256 amount) public {
        // recipient + call + valor ether + datos

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer Failed");
    }
    //<--Internal Functions-->
}