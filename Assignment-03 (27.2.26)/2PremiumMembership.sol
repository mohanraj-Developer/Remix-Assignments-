// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PremiumMember{
    string public Member;               // Member Identity 
    uint public subscriptionBalance;   // Subscription Payment Management 
    int public toatalSubAmount;
    int public ProfitLossTrack;        //  Profit and Loss Tracking
    bool public isActive;             // System Activation Control 
    bytes public secretKey;           // Secret Digital Access Key Storage

    constructor(){
        ProfitLossTrack = 0;
        isActive = true;
    }

    // 1. Member Identity Management:
    function setMember( string memory _member) public{
        Member = _member;
    }
    function verifictionMember(string memory _member) public view returns (bool){
        return keccak256(bytes(Member)) == keccak256(bytes(_member));
    }

    // 4. System Activation control(security layer)
    function Active() public{
        isActive = true;
    }
    function Inactive() public{
        isActive = false;
    }
    function getStatus() public view returns(bool){
        return isActive;
    }

    // 2. Subscription Payment Management (Financial Tracking):
    //payment Subscription:
    function setSubscription(uint amount) public {
        require(isActive,"Subscription payments  stop");
        subscriptionBalance += amount;
        ProfitLossTrack +=int(amount);
    }
    // Refund request:
    function refund(uint amount) public{
        require(isActive,"refund payments  stop");
        require(subscriptionBalance >= amount, "Insufficient subscription balance");
        subscriptionBalance -= amount;
        ProfitLossTrack -=int(amount);
    }
    function stopSubscription() public{
        require(isActive,"Subscription payments  stop");
        isActive = false;
    }

    // 5. secret Digital Access key storage:
    function setSecretKey(string memory _key) public {
        secretKey = bytes(_key);
    }
    function getSecretKeyLength(uint index) public view returns(bytes1){
        require(index < secretKey.length, "index out of range");
        return secretKey[index];
    }

    // Complete system Summary:
    function Summary() public view returns(string memory, uint, int, bool) {
        return(Member, subscriptionBalance, ProfitLossTrack, isActive);
    }
}