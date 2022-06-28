// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import "../Incrementer.sol";

contract DefaultContract {

    address public factoryAddress;
    uint256 public counter;

    event FactoryAddressLOG (address _from);
    
     modifier onlyFactory{
        require(msg.sender == factoryAddress, "only Factory allowed");
        _;
    }

    function initialize() public {
        require(factoryAddress == address(0), "already initialized");
        factoryAddress = msg.sender;
        emit FactoryAddressLOG(msg.sender);
    }

    function incrementCounter() public onlyFactory{
        counter++;
    }
}
