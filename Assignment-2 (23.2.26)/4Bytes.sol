/**🔹 *Question 4 – Bytes Handling*
Create a contract named DataStorage.
Requirements:
Store bytes public data
Create:
setData(string memory _text)
getLength()
getByte(uint index) with require() validation
Return a single byte using bytes1

👉 Test Case:
Set data = "HELLO"
Get byte at index 1 → should return "E"
Try index 10 → should revert**/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataStorage{
    bytes public data;
    function setData(string memory _text) public {
        data = bytes(_text);
    }
    function getLength() public view returns(uint){
        return data.length;
    }
    function getByte(uint index) public view returns(bytes1){
        require(index < data.length," Index out of ranges");
        return data[index];
    }
    
}
