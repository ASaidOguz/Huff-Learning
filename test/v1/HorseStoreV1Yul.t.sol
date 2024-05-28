// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import{Base_TestV1} from "./Base_TestV1.t.sol";
import {HorseStoreV1} from "../../src/HorseStoreV1Yul.sol";
import{IHorseStoreV1} from "../../src/IHorseStoreV1.sol";
contract HorseStoreYul is Base_TestV1{
    //no need to override setup function cause we deploy the v1 as it's...
    
    function setUp() public override{
        horsestoreV1=IHorseStoreV1( address(new HorseStoreV1()));
    }
}