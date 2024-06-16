// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//This shows how you can create and emit events in solidity

contract Events {
    event Log(address indexed sender, string message);

    function fireEvent() public {
        emit Log(msg.sender, "Hello World!");
    }
}

//You can use the event to manage waitlist subscription in web3
contract WaitList {
    uint8 id = 0;
    event subscribers(
        address indexed user,
        uint8 indexed id,
        uint subscribedOn
    );

    function subscribe() public returns (string memory) {
        emit subscribers(msg.sender, id++, block.timestamp);
        return "Successfully subscribed";
    }
}
