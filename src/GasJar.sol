// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


/// @notice ether native inprotocol usage tax
/// @dev Experimental PlayyThing. Do not use.
/// @custom:security contact: petra306@protonmail.com
/// @author parseb (https://github.com/parseb/gasjar/src/GasJar.sol)


/// @dev found much_and_very_great implementation at gastoken.io
/// https://github.com/projectchicago/gastoken
/// THE END
import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

abstract contract GasJar is ERC20("GasJar", "GAZ") {

uint immutable MAXU = type(uint).max -2;
/// OpenZeppelin/openzeppelin-contracts
mapping(bytes4 => uint) sigInterations;
mapping(address => uint[]) shelf;
address public jarOwner;
bool flippy;
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
      _doConserve(jarOwner, sigInterations[msg.sig]);
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


function _doConserve(address to_, uint iterNum_) private {
  uint i = 1;
  for (i; i < iterNum_;) {
    shelf[to_].push( MAXU / i );
    unchecked { ++i; }
  }
  _mint(jarOwner, iterNum);

}


function wildCall(address contractAddr_, bytes memory callBytes) private returns (bytes memory rr) {
  require(! flippy);
  flippy = true;
  delete[]
  require(contractaddress_.call(callBytes));
  flippy = false;
} 


function getGassy() external view returns (uint[3] memory zzz){
  zzz[0] = gassy[0];
  zzz[1] = gassy[1];
  zzz[2] = gassy[2];
}

}
