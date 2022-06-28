// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import "../Incrementer.sol";

contract DefaultContract {

    address public factoryAddress;
    uint256 public counter;

    function initialize() public {
        require(factoryAddress == address(0), "already initialized");
        factoryAddress = msg.sender;
    }
}
