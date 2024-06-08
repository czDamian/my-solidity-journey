// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//@author Damian 
//@notice This shows an example of how mapping are used in solidity

contract Mapping{
    address public  wallet = msg.sender;
     mapping (address wallet => uint points) public  WalletToPoints;

 function setPoints(uint _points) public {
    WalletToPoints[wallet] = _points;
 }
}