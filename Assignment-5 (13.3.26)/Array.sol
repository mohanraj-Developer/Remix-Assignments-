// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentMarks{
    uint [] marks;
    function setMarks(uint mark) public{
        marks.push(mark);
    }
    function getMarks(uint index) public view returns(uint){
        return(marks[index]);
    }
}