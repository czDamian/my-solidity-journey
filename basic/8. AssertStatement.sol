// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//This shows how you can handle errors in solidity using assert statement

contract AssertStatement {
    bool public result = false;

    function Sum(uint a, uint b) public {
        uint Res = a + b;
        assert(Res <= 255);
        result = true;
    }

    function checkResult() public view returns (string memory) {
        if (result == true) {
            return "Sum is less than 255";
        } else {
            return "Sum is above 255";
        }
    }
}
