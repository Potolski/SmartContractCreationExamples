// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import "../Incrementer.sol";

contract ContractACREATE is Incrementer{

    address internal immutable _contractBAddress;
    uint256 public counter;

    modifier onlyContractB{
        require(msg.sender == _contractBAddress, "only Contract B allowed");
        _;
    }

    constructor(address contractBAddress) {
        _contractBAddress = contractBAddress;
    }

    function incrementCounter() public onlyContractB{
        counter++;
    }

     function incrementContractBCounter() public {
        Incrementer(_contractBAddress).incrementCounter();
    }
    
}