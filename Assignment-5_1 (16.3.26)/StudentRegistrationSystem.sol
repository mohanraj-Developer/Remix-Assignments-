// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegSystem{
    enum StudentStatus{ Active, Inactive}

    struct Student {
        uint id; string name; string studentAddress;
        StudentStatus status; string Course;
    }

    mapping(uint => Student) public S1;

    // Creating Array to store Course Name
    string [] CourseName;
    function addCourse(string memory _course) public{
        CourseName.push(_course);
    }

    // Add reg Student details
    function registerStudent(uint _id, string memory _name, string memory _Staddress, StudentStatus _status, string memory _course) public{
        require(_id != 0, " id should not be in Zero ");
        S1[_id] = Student(_id, _name, _Staddress, _status, _course);
    }

    // Retrieve student details
    function setStudent(uint _id) public view returns(uint, string memory, string memory, StudentStatus, string memory){
        Student memory s = S1[_id];
        return (s.id,s.name, s.studentAddress, s.status, s.Course);
    }
}