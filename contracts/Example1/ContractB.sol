// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import "../Incrementer.sol";

contract ContractB is Incrementer{

    address internal _addressContractA;
    address internal _owner;
    uint256 public counter;

    modifier onlyContractA{
        require(msg.sender == _addressContractA, "only Contract A allowed");
        _;
    }

    modifier onlyOwner{
        require(msg.sender == _owner, "only Owner allowed");
        _;
    }

    constructor() {
        _owner = msg.sender;
    }

    function incrementCounter() public onlyContractA{
        counter++;
    }

    function incrementContractACounter() public {
        Incrementer(_addressContractA).incrementCounter();
    }

    function setContractAAddress (address contractAAddress) public onlyOwner {
        _addressContractA = contractAAddress;
    }
}