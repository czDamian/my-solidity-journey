// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//This contract is used to prevent re-entrancy attacks in smart contracts. The function can only be called once.
contract Counter {
    address public owner;
    uint8 private constant notCalled = 1;
    uint8 private constant called = 2;
    uint8 private status = notCalled;

    constructor() {
        owner = msg.sender;
    }

    modifier viewOnce() {
        require(status == notCalled, "You can't call me twice");
        _;
        status = called;
    }

    function viewOwner() public viewOnce returns (address) {
        return owner;
    }
}
