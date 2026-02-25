// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RegistrationinTechara {

    uint public totalEnrolled;

    // Set number of persons enrolled
    function enroll(uint _enrolled) public {
        totalEnrolled = _enrolled;
    }

    // Return output with words
    function getTotalEnrolled() public view returns (string memory) {
        return string(
            abi.encodePacked(
                "Total Number of Enrollment in Techara: ",
                uintToString(totalEnrolled)
            )
        );
    }

    // Return only number
    function getTotalEnrolledNumber() public view returns (uint) {
        return totalEnrolled;
    }

    // Convert uint to string
    function uintToString(uint _i) internal pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint temp = _i;
        uint digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (_i != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint(_i % 10)));
            _i /= 10;
        }
        return string(buffer);
    }
}