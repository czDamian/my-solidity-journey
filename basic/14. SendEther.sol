// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//This shows how you can use call function to send ether to another contract

contract sendMoney {
    address thisCA = address(this);
    //this gets the contract address of this particular contract

    event fundsReceived(uint amount, address sender);

    //emit an event whenever we receive ETH

    function donate(address payable _ca) public payable {
        // for sending to a custom contract address
        _ca.call{value: msg.value, gas: 5000};
        emit fundsReceived(msg.value, msg.sender);
    }

    function donateMore() public payable {
        //for sending to this contract contract's address
        thisCA.call{value: msg.value};
        require(msg.value >= 1 ether, "Please send at least 1 ETH");
        emit fundsReceived(msg.value, msg.sender);
    }
}
