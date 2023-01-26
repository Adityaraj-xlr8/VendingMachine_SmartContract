// SPDX-License-Identifier:MIT

pragma solidity >=0.7.0 <0.9.0;

contract VendingMachine{
    address public owner;
    mapping ( address => uint) public donateBalance;

    constructor(){
        owner=msg.sender;
        donateBalance[address(this)]=100;
    }

    function getVendingMachineBalance() public view returns(uint){
        return donateBalance[address(this)];
    }

    function restock(uint amount) public{
        require(msg.sender==owner,"Only can be Restocked by Owner!!!.");
        donateBalance[address(this)]+=amount;
    }

    function getDonate(uint amount) public payable{
        require(donateBalance[address(this)] >= amount,"Not Enough Donuts to meet your Requirement");
        require(msg.value >= amount * 1.5 ether, "You Must Pay 1.5 ethers/donut" );
        donateBalance[address(this)]-=amount;
        donateBalance[msg.sender]+=amount;
    }

}