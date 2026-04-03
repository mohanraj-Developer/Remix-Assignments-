/**🔹 *Question 2 – Boolean Control*
Create a contract named ContractStatus.
Requirements:
Create bool public isActive
Constructor should set it to true
Create:
activate()
deactivate()
toggleStatus()
Add a function restrictedAction() that only works if contract is active (use require())
👉 Test Case:
Deactivate contract
Try calling restricted function
Observe revert message
**/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractStatus{
    bool public isActive;
    constructor() {
        isActive = true;
    }
    function activate() public {
        isActive = true;
    }
    function deactivate() public {
        isActive = false;
    }
    function toggleStatus() public {
        isActive = !isActive;
    }
    function restrictedAction() public view returns(bool) {
        require(isActive, "Contract is not active");
        return isActive;
    }
}