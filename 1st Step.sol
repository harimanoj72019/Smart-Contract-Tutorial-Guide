// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; // 1. Defines the version of Solidity we are using

contract SimpleStorage { // 2. Defines the contract name
    
    // 3. This is a "State Variable". 
    // It is stored permanently on the blockchain (like a hard drive).
    uint256 public myNumber;

    // 4. A function to WRITE data to the blockchain
    // You have to pay "Gas" to run this because it changes data.
    function store(uint256 _number) public {
        myNumber = _number;
    }

    // 5. A function to READ data
    // This is free! It doesn't cost Gas because we are just looking, not writing.
    function retrieve() public view returns (uint256) {
        return myNumber;
    }
}
