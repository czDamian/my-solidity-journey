// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//@author Damian Olebuezie//@notice This shows an example of how arrays are used in solidity

contract Arrays {
    //declare the array
    string[] public listOfArrays;

    //this shows that the array will contain a list of strings

    function addStringToArray(string memory _name) public {
        //this function pushes the string into our list of array
        listOfArrays.push(_name);
    }

    function viewAllArray() public view returns (string[] memory) {
        return listOfArrays;
    }

    function viewSingleArray(
        uint256 index
    ) public view returns (string memory) {
        return listOfArrays[index];
    }

    function deleteSingleArray(uint256 index) public {
        delete listOfArrays[index];
    }

    function deleteAllArrays() public {
        delete listOfArrays;
    }
}
