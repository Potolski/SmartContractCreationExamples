// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import { Clones } from "@openzeppelin/contracts/proxy/Clones.sol";
import "./DefaultContract.sol";

contract Factory {

    DefaultContract[] public DefaultContractAddresses;
    
    address public implementationAddress = 0x417Bf7C9dc415FEEb693B6FE313d1186C692600F;

    function addDefaultContract() public {

        DefaultContract defaultContractAddress = DefaultContract(Clones.cloneDeterministic(implementationAddress, "salt"));

        defaultContractAddress.initialize(); 

        DefaultContractAddresses.push(defaultContractAddress);
    }
}

