// Capstone Project : Student Course Management System

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentCourseManagementSystem {
    struct Student { uint id;                                       // creating a struct to store student details
                     string name;
                     uint age;
                     CourseStatus status;
    }
    enum CourseStatus{ NotStarted, InProgress, Completed}           // creating enum to store course status
    CourseStatus status;

    Student [] students;                                         // creating struct variable as DT and store details in array

    // Adding Student details and stored in array
    function addStudent(uint _id, string memory _name, uint _age, CourseStatus _status) public{
        students.push(Student(_id, _name, _age, _status));
    }

    // Get Student Details using Indexing

    function getStudent(uint index) public view returns (uint, string memory, uint, CourseStatus){
        return(students[index].id, students[index].name, students[index].age, students[index].status);
    }

    // Get Length of Student Details

    function StudentLength() public view returns(uint){
        return students.length;
    }

}