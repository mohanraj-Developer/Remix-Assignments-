
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/**
contract PremiumMember {

    address public owner;
    bool public isActive = true;
    int public profitLossTrack;
    uint public totalSubscriptionBalance;

    struct Member {
        string name;
        uint balance;
        bytes secretKey;
    }

    mapping(address => Member) public members;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only admin allowed");
        _;
    }

    modifier whenActive() {
        require(isActive, "System is paused");
        _;
    }

    // 1️⃣ Member Identity Management
    function setMember(string memory _member) public {
        members[msg.sender].name = _member;
    }

    function verificationMember(string memory _member) public view returns (bool) {
        return keccak256(abi.encodePacked(members[msg.sender].name)) ==
               keccak256(abi.encodePacked(_member));
    }

    // 2️⃣ Subscription Payment (REAL ETH)
    function setSubscription() public payable whenActive {
        require(msg.value > 0, "Send ETH");

        members[msg.sender].balance += msg.value;
        totalSubscriptionBalance += msg.value;

        profitLossTrack += int(msg.value);
    }

    function refund(uint amount) public whenActive {
        require(members[msg.sender].balance >= amount, "Insufficient balance");

        members[msg.sender].balance -= amount;
        totalSubscriptionBalance -= amount;
        profitLossTrack -= int(amount);

        payable(msg.sender).transfer(amount);
    }

    // 4️⃣ System Control
    function activate() public onlyOwner {
        isActive = true;
    }

    function deactivate() public onlyOwner {
        isActive = false;
    }

    // 5️⃣ Secret Key (Per User)
    function setSecretKey(string memory _key) public {
        members[msg.sender].secretKey = bytes(_key);
    }

    function getSecretKeyLength() public view returns (uint) {
        return members[msg.sender].secretKey.length;
    }

    function getSecretKeyByte(uint index) public view returns (bytes1) {
        require(index < members[msg.sender].secretKey.length, "Out of range");
        return members[msg.sender].secretKey[index];
    }

    // 6️⃣ Summary
    function summary() public view returns (
        string memory,
        uint,
        int,
        bool
    ) {
        return (
            members[msg.sender].name,
            totalSubscriptionBalance,
            profitLossTrack,
            isActive
        );
    }
}
**/