// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Base_Test, HorseStore} from "./Base_Test.t.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import {Test, console2} from "forge-std/Test.sol";

contract Handler is Test{
    HorseStore  horseStore;
    constructor(address _horseStore) {
        horseStore=HorseStore(_horseStore);
    }

    function feedHorse(uint256 randomId)public{
        vm.roll(randomId);
        vm.warp(randomId);
        horseStore.feedHorse(randomId);
    }

 
}