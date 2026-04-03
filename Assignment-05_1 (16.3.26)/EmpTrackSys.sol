// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmpTrackSys{
    enum TaskStatus{ Pending, InProgress, Completed}
    struct Task { uint id; string name; string Address; TaskStatus status; }
    mapping (uint => Task) T1;

    string []  TaskName;
    function addTask (string memory _Tname) public {
        TaskName.push(_Tname);
    }
    function taskLength() public view returns (uint) {
        return TaskName.length;

    }

    function createTask(uint key,uint _id, string memory _name, string memory _address, TaskStatus _status) public {
        require(_id != 0);
        T1[key] = Task(_id, _name, _address, _status);
    }
    function getTask(uint key) public view returns (uint , string memory, string memory, TaskStatus ) {
        Task memory t = T1[key];
        return (t.id, t.name, t.Address, t.status);
    }

}