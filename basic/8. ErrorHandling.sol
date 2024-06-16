// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//This shows how you can handle errors in solidity using assert, revert and require statement

contract AssertStatement {
    function sum(
        uint a,
        uint b
    ) public pure returns (uint res, string memory value) {
        res = a + b;
        assert(res <= 255);
        if (res <= 255) {
            return (res, " is less than 255");
        }
        //you cannot customize the error message to show if the condition is not met
    }
}

contract RevertStatement {
    function checkNum(
        uint _no1,
        uint _no2
    ) public pure returns (uint, string memory) {
        uint sum = _no1 + _no2;
        if (sum < 1 || sum > 255) {
            revert("sum is either 0 or greater than 255");
        } else {
            return (sum, "sum is greater than 0 but less than 255");
        }
    }
}

contract RequireStatement {
    string public message;

    function checkNum(uint no1, uint no2) public returns (string memory) {
        uint sum = no1 + no2;
        require(sum > 0 && sum < 256, "Invalid uint8 number");
        return message = "Valid uint8 number";
    }
}
