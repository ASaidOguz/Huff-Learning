// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import {Test, console2} from "forge-std/Test.sol";
import {HorseStoreV1} from "../../src/HorseStoreV1.sol";
abstract contract Base_TestV1 is Test{
          HorseStoreV1 public horsestoreV1;

          function setUp() public virtual{
            horsestoreV1=new HorseStoreV1();
          }

        function testReadValue() public{
           uint256 initialValue=horsestoreV1.readNumberOfHorses();
           assertEq(initialValue,0);
        }

}