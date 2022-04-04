// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ProfitSplitter {
    address payable person1;
    address payable person2;
    address payable person3;
    
    constructor(address payable _address1, address payable _address2, address payable _address3) {
        person1 = _address1;
        person2 = _address2;
        person3 = _address3;
    }
    function splitProfits() public payable {
        uint numberOfPeople = 3;
        uint amountPerPerson = msg.value / numberOfPeople;
        
        person1.transfer(amountPerPerson);
        person2.transfer(amountPerPerson);
        person3.transfer(amountPerPerson);
        
        payable(msg.sender).transfer(msg.value - amountPerPerson * numberOfPeople);
    }
}
