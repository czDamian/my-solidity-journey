// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//This shows how you can create a contract from another contract

contract carContract {
    address public owner;
    string public model;
    address public carContractCa;

    constructor(address _owner, string memory _model) payable {
        owner = _owner;
        model = _model;
        carContractCa = address(this);
    }
}

contract carArray {
    carContract[] public listOfCars;

    //function buildCar creates a new instance of carContract anytime its called

    function buildCar(address _owner, string memory _model) public {
        carContract carList = new carContract(_owner, _model);
        listOfCars.push(carList);
    }

    function createAndSendEth(
        address _owner,
        string memory _model
    ) public payable {
        carContract newwCar = (new carContract){value: msg.value}(
            _owner,
            _model
        );
        listOfCars.push(newwCar);
    }

    function getCar(
        uint _index
    )
        public
        view
        returns (address owner, string memory model, address carContractCa)
    {
        carContract carList = listOfCars[_index];
        return (carList.owner(), carList.model(), carList.carContractCa());
    }
}
