// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import "../Incrementer.sol";

contract ContractA is Incrementer{

    address internal _contractBAddress;
    address internal _owner;
    uint256 public counter;

    modifier onlyContractB{
        require(msg.sender == _contractBAddress, "only Contract B allowed");
        _;
    }

    modifier onlyOwner{
        require(msg.sender == _owner, "only Owner allowed");
        _;
    }

    constructor() {
        _owner = msg.sender;
    }

    function incrementCounter() public onlyContractB{
        counter++;
    }

    function setContractBAddress (address contractBAddress) public onlyOwner {
        _contractBAddress = contractBAddress;
    }

     function incrementContractBCounter() public {
        Incrementer(_contractBAddress).incrementCounter();
    }
}