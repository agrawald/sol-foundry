// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.25;

error Unauthorized();

contract OwnerUpOnly {
    address public immutable OWNER;
    uint256 public count;

    constructor() {
        OWNER = msg.sender;
    }

    function increment() external {
        if (msg.sender != OWNER) {
            revert Unauthorized();
        }
        count++;
    }
}
