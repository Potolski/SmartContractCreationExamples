// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import "../Incrementer.sol";

contract ContractBCREATE is Incrementer{

    address internal immutable _contractAAddress;
    uint256 public counter;

    modifier onlyContractB{
        require(msg.sender == _contractAAddress, "only Contract B allowed");
        _;
    }

    constructor(address contractAAddress) {
        _contractAAddress = contractAAddress;
    }

    function incrementCounter() public onlyContractB{
        counter++;
    }

     function incrementContractACounter() public {
        Incrementer(_contractAAddress).incrementCounter();
    }
    
}