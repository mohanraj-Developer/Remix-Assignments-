// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SchoolNameAndStudentsAge {
    string public name;
    int public age;

    constructor() {
        name = "GCS";
        age = 15;
    }
    function setSchoolName( string memory newName) public {
        name = newName;
    }
    function setStudentAge(int newAge) public {
        age = newAge;
    }

    function getSchoolName() public view returns (string memory) {
        return name;
    }
    function getStudentAge() public view returns (int) {
        return age;
    }
}