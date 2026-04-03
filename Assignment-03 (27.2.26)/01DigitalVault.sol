// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalVault{
    string public ownerName;            // user section 
    uint public vaultBalance;           // vault balance
    bool public isVaultOpen;            //  Vault Status (bool)
    int public netTranscation;          // Transaction Tracking
    bytes public secretCode;            // secret data storage

    constructor (){
        vaultBalance = 0;
        netTranscation = 0;
        isVaultOpen = true;
    }

    // Use section :
    function setOwnerName(string memory _name) public{
        ownerName = _name;
    }
    function getLength() public view returns(uint){
        return(bytes(ownerName).length);
    }
    function verifyOwner(string memory _name) public view returns(bool){
        return keccak256(bytes(ownerName)) == keccak256(bytes(_name));
    }

    //Vault Balance:
    // Increase vault balance
    function deposit(uint amount) public{
        require(isVaultOpen, "Vault is closed");
        vaultBalance += amount;
        netTranscation += int(amount);                     // track positive
    }
    // Withdraw function 
     function withdraw(uint amount) public {
        require(isVaultOpen, "Vault is closed");
        require(vaultBalance >= amount, "Insufficient balance");
        vaultBalance -= amount;
        netTranscation -= int(amount);                   // track negative
    }
    //3. Vault Status (bool)
     function openVault() public {
        isVaultOpen = true;
    }
    function closeVault() public {
        isVaultOpen = false;
    }
    function getVaultStatus() public view returns (bool) {
        return isVaultOpen;
    }
    // 5. Secret Data Storage (bytes)
    function setSecret (string memory _code) public {
        secretCode = bytes(_code);
    }
    function getSecretLength () public view returns (uint){
        return secretCode.length;
    }
     function getSecretByte(uint index) public view returns (bytes1) {
        require(index < secretCode.length, "Index out of bounds");
        return secretCode[index];
    }
    function getVaultDetails() public view returns(string memory, uint, int, bool){
        return(ownerName, vaultBalance, netTranscation, isVaultOpen);
    }        
}