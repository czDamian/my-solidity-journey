// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
//This shows how you can use fallback and receive functions

//Fallback is called if receive() is not defined. 
//Both has to be declared as external functions
contract FallbackAndReceive{
    event Log(string func, uint gas);
   
    fallback() external payable {
        emit Log("fallback", gasleft());
     }

     receive() external payable { 
        emit  Log("receive", gasleft());
     }
     
}
contract SendEther {
    function transferEtherFallback ( address payable  _theCA) public  payable {
       _theCA.transfer(msg.value);
    }

    function callFallback(address payable  _to) public  payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

}