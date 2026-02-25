// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SchoolStudentsAge {
    int public age;

    constructor() {
        age = 15;
    }

    function setMessage(int newAge) public {
        age = newAge;
    }

    function getMessage() public view returns (int) {
        return age;
    }
}