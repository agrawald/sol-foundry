// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.25 <0.9.0;

import { Test } from "forge-std/src/Test.sol";
import { ExpectEmit } from "../src/ExpectEmit.sol";

contract EmitContractTest is Test {
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function test_ExpectEmit() public {
        ExpectEmit emitter = new ExpectEmit();
        vm.expectEmit(true, true, false, true);
        emit Transfer(address(this), address(1337), 1337);
        emitter.t();
    }

    function test_ExpectEmit_DoNotCheckData() public {
        ExpectEmit emitter = new ExpectEmit();
        vm.expectEmit(true, true, false, false);
        emit Transfer(address(this), address(1337), 1338);
        emitter.t();
    }
}
