// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentDetails{
    struct Student{ uint id; string name;}
    Student student;

    function setStudent(uint _id, string memory _name) public{
        student = Student(_id, _name);
        /* student.id = _id ;
         student.name = _name;
        */
    } 
    function getStudent() public view returns(uint, string memory){
        return (student.id, student.name);
    }
}