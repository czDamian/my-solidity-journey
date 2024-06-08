// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//@author Damian
//@notice This shows an example of most common data types used in solidity

contract DataTypes {
    address myAddress;
    uint256 myNumber;
    int256 myIntNumber;
    string myName;

    function showAddress() public view returns (address) {
        return msg.sender;
        //returns the address of the person calling this funciton
    }

    function showMyNumber(uint256 num) public pure returns (uint256) {
        return num;
    }

    function showMyName(
        string memory _name
    ) public pure returns (string memory) {
        return _name;
    }
}
