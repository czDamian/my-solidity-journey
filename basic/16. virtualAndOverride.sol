// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//inheritance in solidity

contract mainProfile {
    string public name = "cz";
    uint8 public age = 24;

    //mark the function as "virtual" to enable it to be overriden by another function
    function returnString() public virtual returns (string memory) {
        return "Hello World!";
    }
}

contract inheritMainProfile is mainProfile {
    //mark the function as "override" to show that it is overiding another function
    function returnString() public pure override returns (string memory) {
        return "In Solidity, we shall rise";
    }
}

contract inheritMain is mainProfile {
    //to change the values of state variables of another contract, do it this way
    constructor() {
        name = "Damiaaaan";
        age = 34;
    }
}
