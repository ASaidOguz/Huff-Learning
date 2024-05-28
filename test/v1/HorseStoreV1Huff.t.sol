// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import{Base_TestV1,HorseStoreV1} from "./Base_TestV1.t.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import{IHorseStoreV1} from "../../src/IHorseStoreV1.sol";
contract HorseStoreV1Huff is Base_TestV1{
    string public constant HORSE_STORE_HUFF_LOCATION="HorseStoreV1";
    function setUp() public override{
    horsestoreV1= IHorseStoreV1((HuffDeployer.config().deploy(HORSE_STORE_HUFF_LOCATION)));
    }


}