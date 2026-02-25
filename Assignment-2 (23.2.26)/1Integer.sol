/**🔹 *Question 1 – Integer (uint & int)*
Create a contract named FinanceTracker.
Requirements:
Store:
uint public totalBalance
int public profitOrLoss
Add a function deposit(uint amount) to increase balance.
Add a function updateProfit(int amount) to update profit or loss.
Add a function getStatus() that returns both values.

👉 Test Case:
Deposit 500
Update profit -200
Check final values**/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FinanceTracker{
    uint public totalBalance;
    int public profitOrLoss;

    constructor(){
        totalBalance = 1000;
        profitOrLoss = 0;
    }

    function deposit(uint amount) public{
        totalBalance += amount;
    }
    function updateProfit(int amount) public{
        profitOrLoss += amount;
    }
    function getStatus() public view returns (uint, int) {
        return (totalBalance, profitOrLoss);
    }
}