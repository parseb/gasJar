// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/GasJar.sol";
import "../src/Jarrable.sol";



contract ContractTest is Test {

    address OW;
    UsesJar Jar;

    function setUp() public {

        OW = address(9);
        vm.prank(OW);
        Jar = new UsesJar();

    }

    function testDeployerIsHJarOwner() public {
        assertTrue(Jar.jarOwner() == OW, "Jar owner not deployer");
    }

    function testLastGas() public {
        uint[3] memory gassy;
        gassy = Jar.getGassy();
        assertTrue(gassy[0] == gassy[1] && gassy[1] == gassy[2] && gassy[2] == 0, "Gassy not zero");
        bytes4 plusOneSig = 0xf5a6259f;
        vm.prank(OW);
        Jar.createJar(plusOneSig, 234);
        
        vm.prank(OW);
        assertTrue(Jar.plusOne(33) == 34, "does not plus one");

        gassy = Jar.getGassy();
        assertFalse(gassy[0] == gassy[1] && gassy[1] == gassy[2] && gassy[2] == 0, "Gassy not changed");

    }
    
}
