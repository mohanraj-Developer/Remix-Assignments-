// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 1. Creaate Array to store Marks of students

contract StudentMarks{
    uint [] rollno;
    string [] name;
    uint[] mark;
    function student(uint _rollno, string memory _name, uint _mark) public{
        rollno.push(_rollno); name.push(_name); mark.push(_mark);
    }
    function Mark(uint index) public view returns (string memory, uint){
        return(name[index], mark[index]);
    }
}

// 2. Create a enum for order status:

contract OrderStatus{
    enum order{
        Pending, Shipped, Delivered
    }
    order public Status;
    function setStatus(order _Status) public{
        Status = _Status;
    }
    function getStatus() public view returns(order){
        return Status;
    }
}

// 3. Create a struct to store employe details:

contract EmployeeDetails{
    struct Employee{ uint id; string name; uint salary;}
    Employee employee;
    function setEmployee(uint _id, string memory _name, uint _salary) public {
        employee.id = _id;
        employee.name = _name;
        employee.salary = _salary;
    }
    function getEmployee() public view returns (uint, string memory, uint){
        return (employee.id, employee.name, employee.salary);
    }
}

// 4. Create enum, struct, array in one code:

contract StudentDetails{
    enum CourseStatus{ NotStarted, InProgress, Completed}
    CourseStatus status;

    struct Student{ 
        uint id; string name; uint age; CourseStatus status;
    }

    Student [] students;
    function addStudents(uint _id, string memory _name, uint _age, CourseStatus _status) public {
        students.push(Student(_id, _name, _age, _status));
    }
    function details(uint index) public view returns(uint, string memory, uint, CourseStatus){
        return (students[index].id, students[index].name, students[index].age, students[index].status);
    }
}