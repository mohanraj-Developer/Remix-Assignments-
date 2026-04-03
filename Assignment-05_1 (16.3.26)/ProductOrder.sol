// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductOrder{
    enum OrderStatus{ Pending, Shipped, Delivered}

    struct Order{
        uint OrderId;
        string ProductName;
        uint quantity;
        string CusAddress;
        OrderStatus status;
    }
    mapping (uint => Order)  orders; 

    string [] ProductName;
    function addProduct(string memory _Pname) public{
        ProductName.push(_Pname);
    }
    function addProduct(uint key,uint _id, string memory _name, uint _qty, 
                        string memory _address, OrderStatus _status) public {
        require(_qty >0," Quanty should be Greater than Zero");
        orders[key] = Order(_id, _name, _qty, _address, _status);
                        }
    
    function getOrder(uint key) public view returns(uint, string memory, uint, string memory, OrderStatus){
        Order memory j = orders[key];
        return(j.OrderId, j.ProductName, j.quantity, j.CusAddress, j.status);
    }
}