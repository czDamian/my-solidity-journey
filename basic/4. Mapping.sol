// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//@author Damian
//@notice This shows an example of how mapping are used in solidity

contract Mapping {
    address public wallet = msg.sender;
    mapping(address wallet => uint points) public WalletToPoints;

    function setPoints(uint _points) public {
        WalletToPoints[wallet] = _points;
    }
}

contract ArrayMapping {
    struct myeProfile {
        address myaddress;
        string fullName;
    }

    mapping(address => myeProfile[]) public eProfile;

    function addProfile(string memory _fullName) public {
        myeProfile memory newProfile = myeProfile({
            myaddress: msg.sender,
            fullName: _fullName
        });
        eProfile[msg.sender].push(newProfile);
    }
}
