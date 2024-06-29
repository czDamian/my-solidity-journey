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

contract sendAndReceive {
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function deposit() public payable {
        require(msg.value >= 1 wei, "Send at least 0.001ETH");
    }

    function withdraw() public onlyOwner {
        uint amount = address(this).balance;
        require(amount > 0, "Insufficient balance");
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to withdraw");
    }

    function transferTo(address payable _to, uint amount) public {
        uint balance = address(owner).balance;
        require(amount <= balance, "Insufficient balance");
        (bool success, ) = _to.call{value: amount}("");
        require(success, "Failed to send ETH");
    }
}
