// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


/// @notice ether native inprotocol usage tax
/// @dev Experimental. Do not use.
/// @custom:security contact: petra306@protonmail.com
/// @author parseb (https://github.com/parseb/gasjar/src/GasJar.sol)
abstract contract GasJar {

/// 
mapping(bytes4 => uint) sigInterations;

address jarOwner;

/// Events
   event jarOnwerChanged(address _prev, address _next);


   constructor() { jarOwner = msg.sender;}

   modifier isJar() {
    if (jarOwner == address(0)) {
    _;
    } else {
      // odo the do and render true
      _;
    }
   }


 function setJarOwner(address _o) public {
   require (jarOwner != address(0));
   jarOwner = _o;

   emit jarOnwerChanged(msg.sender, _o);
 }


}
