// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import { Clones } from "@openzeppelin/contracts/proxy/Clones.sol";
import "./DefaultContract.sol";

contract Factory {

    DefaultContract[] public DefaultContractAddresses;
    event PrintCoutner (uint256 _int);

    function addDefaultContract(address implementationAddress) public payable {

        DefaultContract defaultContractAddress = DefaultContract(Clones.clone(payable (implementationAddress)));

        defaultContractAddress.initialize(); 
        
        DefaultContractAddresses.push(defaultContractAddress);

    }

}

