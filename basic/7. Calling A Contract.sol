// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//This shows how you can modify the values of one contract from another contract
//first we define x and value variables in Callee contract
//Then we modify the value in the Caller contract using the Contract Address of the Callee contract

contract Callee {
    uint public x;
    uint public value;

    function setX(uint _x) public returns (uint) {
        x = _x;
        return x;
    }

    function setXandSendEther(uint _x) public payable returns (uint, uint) {
        x = _x;
        value = msg.value;
        return (x, value);
    }
}

contract Caller {
    function setX(Callee _callee, uint _x) public {
        uint x = _callee.setX(_x);
    }

    //or this. They do the same thing.

    function setXfromAddress(address _addr, uint _x) public {
        Callee CA = Callee(_addr);
        CA.setX(_x);
        //I find this easier
    }

    function setXandSendEther(Callee _callee, uint _x) public payable {
        (uint x, uint value) = _callee.setXandSendEther{value: msg.value}(_x);
    }
}

//ANOTHER EXAMPLE

contract AboutMe {
    string public myName;
    uint public age;

    function setAboutMe(string memory _name, uint _age) public {
        myName = _name;
        age = _age;
    }
}

contract ModifyAboutMe {
    function Edit(address _CA, string memory _name, uint _age) public {
        AboutMe CA = AboutMe(_CA);
        CA.setAboutMe(_name, _age);
    }
}
