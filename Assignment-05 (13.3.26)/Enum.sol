// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Order{
    enum orderStatus{Pending, Shipped, Delivered}
    orderStatus status;

    function setStatus(orderStatus _status) public{
        status = _status;
    }
    function getStatus() public view returns(orderStatus){
        return(status);
    }
}