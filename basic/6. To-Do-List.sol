// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ToDoList {
    struct myActivities {
        string taskName;
        bool isCompleted;
        address owner;
    }

    mapping(address owner => myActivities[]) public myToDoLists;

    function addTask(string memory _taskName) public {
        myActivities memory newToDoList = myActivities({
            isCompleted: false,
            taskName: _taskName,
            owner: msg.sender
        });
        myToDoLists[msg.sender].push(newToDoList);
    }

    function viewAllTasks() public view returns (myActivities[] memory) {
        return myToDoLists[msg.sender];
    }

    function markAsComplete(uint id) public {
        //provide the id of the task to set the iscompleted status to true
        myToDoLists[msg.sender][id].isCompleted = true;
    }
}
