// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Counter {
    uint count = 0;

    function increaseCount() public {
        count++;
    }

    function decreaseCount() public {
        count--;
    }

    function viewCount() public view returns (uint) {
        return count;
    }
}

//with error messages
contract Counter2 {
    uint count = 0;

    function increaseCount() public {
        count++;
    }

    function decreaseCount() public {
        if (count <= 0) {
            revert("Count cannot be less than 0");
        } else {
            count--;
        }
    }

    function viewCount() public view returns (uint) {
        return count;
    }
}
