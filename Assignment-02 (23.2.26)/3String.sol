/**🔹 *Question 3 – String Operations*
Create a contract named UserProfile.
Requirements:
Store string public username
Create:
setUsername(string memory _name)
getLength()
compare(string memory _other)
Use keccak256 for comparison.

👉 Test Case:
Set username to "Blockchain"
Compare with "Blockchain" → true
Compare with "Crypto" → false**/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserProfile{
    string public username;
    function serUsername(string memory _name) public{
        username = _name;
    }
    function getLength() public view returns(uint){
        return bytes(username).length;
    }
    function compare(string memory _other) public view returns(bool){
        return keccak256(bytes(username)) == keccak256(bytes(_other)); 
    }
}