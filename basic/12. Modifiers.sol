// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//This shows how you can use modifier to restrict access

contract functionModifier {
    string public message;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOWner() {
        require(owner == msg.sender, "You're not the contract owner");
        _;
    }

    modifier validAddress(address _addr) {
        require(_addr != address(0), "Enter a valid address");
        _;
    }

    function sayHi() public onlyOWner returns (string memory) {
        return message = "Hello Admin";
    }

    //This can be useful for renouncing contracts
    function transferOwnership(
        address newOwner
    ) public onlyOWner validAddress(newOwner) {
        owner = newOwner;
    }
}
