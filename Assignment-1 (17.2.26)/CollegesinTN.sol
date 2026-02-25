// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TamilnaduColleges {
    uint public TotalColleges;

    constructor() {
        TotalColleges = 0;
    }

    function totalcollege(uint newTotal) public {
        TotalColleges = newTotal;
    }

    function totalcollege() public view returns (uint) {
        return TotalColleges;
    }
}