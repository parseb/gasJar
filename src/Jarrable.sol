// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./GasJar.sol";

contract UsesJar is GasJar {
    function plusOne(uint _nr) public isJar() returns (uint) {
        return 1 + _nr;
    }
}