// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Counter {
    uint public count;

    function increment() external {
        count += 1;
    }
}

interface ICounter {
    function count() external view returns (uint);

    function increment() external;
}

contract inheritCounter {
    function incrementCounter(address _addr) external {
        ICounter(_addr).increment();
    }

    function getCount(address _addr) external view returns (uint) {
        return ICounter(_addr).count();
    }
}
