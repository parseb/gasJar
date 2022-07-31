// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


/// @notice ether native inprotocol usage tax
/// @dev Experimental PlayyThing. Do not use.
/// @custom:security contact: petra306@protonmail.com
/// @author parseb (https://github.com/parseb/gasjar/src/GasJar.sol)
abstract contract GasJar {

uint immutable MAXU = type(uint).max -2;
/// 
mapping(bytes4 => uint) sigInterations;
mapping(address => uint[]) shelf;
address public jarOwner;

/// temp, maybe
uint[3] gassy; 

/// Events
   event jarOnwerChanged(address prev_, address next_);
   event createdJar(address contractaddress_, bytes4 sign_);

   constructor() { jarOwner = msg.sender;}

   modifier isJar() {
    gassy[0] = tx.gasprice;
    if (jarOwner == address(0)) {
    _;
    } else {
      gassy[1] = gasleft();
      // odo the do and render true
      _doTheDo(jarOwner, sigInterations[msg.sig]);
      _;
      gassy[2] = gasleft();
    }
   }


 function setJarOwner(address o_) external {
   require (jarOwner != address(0));
   jarOwner = o_;

   emit jarOnwerChanged(msg.sender, o_);
 }

 function createJar(bytes4 fxSig_, uint iterations_) external {
  require( msg.sender == jarOwner, "Not Jar Owner");

  sigInterations[fxSig_] = iterations_;

  emit createdJar(address(this), fxSig_);
 }


function _doTheDo(address to_, uint iterNum_) private {
  uint i = 1;
  for (i; i < iterNum_;) {
    shelf[to_].push( MAXU / i );
    unchecked { ++i; }
  }
}

function getGassy() external view returns (uint[3] memory zzz){
  zzz[0] = gassy[0];
  zzz[1] = gassy[1];
  zzz[2] = gassy[2];
}

}
