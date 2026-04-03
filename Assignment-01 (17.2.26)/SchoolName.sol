// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SchoolName {
    string public name;

    constructor() {
        name = "My School is";
    }

    function setSchoolname(string memory newName) public {
        name = newName;
    }

    function getSchoolName() public view returns (string memory) {
        return name;
    }
}