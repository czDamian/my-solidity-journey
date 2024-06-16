// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ifElse {
    uint num = 0;
    string public message = "Enter number to check";

    function check(uint _num) public {
        num = _num;
        if (num == 1) {
            message = "Number is 1";
        } else if (num == 2) {
            message = "Number is 2";
        } else {
            message = "Number is 0 or above 2";
        }
    }

    //using shorthand

    function checkNum(uint _no) public {
        num = _no;
        num == 1 ? message = "No is 1" : message = "No is 0 or greater than 1";
    }
}
