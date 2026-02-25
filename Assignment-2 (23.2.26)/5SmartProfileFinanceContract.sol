// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmartProfileFinace{
   
    uint public balance;             //Finance Section
    int public profitOrLoss;
    bool public isActive;            // Contract Status
    string public username;          // User Profile
    bytes public data;               // Raw data section 

    constructor(){
        balance = 0;
        profitOrLoss = 0;
        isActive = true;
    }

    // 1.Finance Section:
    function deposit(uint amount) public{
        require(isActive, "Contract is Active" );
        balance += amount;
    }
    function updaeProfit(int amount) public{
        require(isActive,"Contract is Active");
        profitOrLoss += amount;
    }

    // 2. Toggle Status
    function toggleStatus() view public{
        isActive != isActive;
    }

    // 3. User Profile:
    function setUsername(string memory _name) public{
        username = _name;
    }
    function getUsernameLength() public view returns (uint){
        return bytes(username).length;
    }
    function compareUsername(string memory _other) public view returns (bool){
        return keccak256(bytes(username)) == keccak256(bytes(_other));
    }
    

    // 4. Raw Data Section (bytes):
    function setData(string memory _text) public{
        data = bytes(_text);
    }
    function getDataLength() public view returns (uint){
        return data.length;
    }
    function getByte(uint index) public view returns (bytes1){
        require(index < data.length, "Index out of range");
        return data[index];
    }
    

    // 5. Final Function:
    function getFullDetails() public view returns(uint,int,bool,string memory){
        return (balance, profitOrLoss, isActive, username);
    }
}