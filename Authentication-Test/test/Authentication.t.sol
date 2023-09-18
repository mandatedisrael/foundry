// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Pool} from "../src/Pool.sol";

contract TestPool is Test {
    Pool public pool;

    function setUp() public {
        pool = new Pool();
    }

    function testSetOwner() public {
        vm.prank(address(1));
        pool.setOwner(address(1));
        assertEq(address(1), pool.owner());
    }

    function testWithdraw() public {
        vm.prank(address(1));
        pool.withdraw(address(1), 1);
    }

}
