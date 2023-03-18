// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

contract DogCoin {
    uint totalSupply = 2000000;
    address owner;
    mapping(address => uint) public balances;
    struct Payment {
        uint amount;
        address recipient;
    }
    mapping(address => Payment[]) payments;

    function getTotalSupply() public view returns (uint) {
        return totalSupply;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function increaseTotalSupply() public onlyOwner {
        totalSupply += 1000;
        emit totalSupplyChanged(totalSupply, "Total supply changed");
    }

    constructor() {
        owner = msg.sender;
        balances[owner] = totalSupply;
    }

    /*
    The "transfer" function does not need the sender's address as a parameter because the sender's address is already accessible through the "msg.sender".
    If the sender's address was included as a parameter in the "transfer" function, it would allow other users to transfer tokens on behalf of another address, which could create security and privacy concerns.  
    */
    function transfer(uint _amount, address _recipient) public {
        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;
        payments[msg.sender].push(
            Payment({amount: _amount, recipient: _recipient})
        );
        emit transferTo(_amount, _recipient);
    }

    event totalSupplyChanged(uint newSupply, string msg);
    event transferTo(uint _amount, address _recipient);
}
