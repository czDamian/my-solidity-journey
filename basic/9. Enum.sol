// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//This shows how you can use Enum in solidity
//Enum returns a uint value
//similar to array, the first value has an index of 0
//The first value is the default value
//Use "delete" to reset the enum to default state

contract EnumTesting {
    enum Status {
        pending,
        publishing,
        published,
        rejected
    }

    Status private postStatus;

    function getStatus() public view returns (Status) {
        return postStatus;
    }

    function setStatus(Status _id) public {
        postStatus = _id;
    }

    function setAsRejected() public {
        postStatus = Status.rejected;
    }

    function resetStatus() public {
        delete postStatus;
    }
}
