// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import {Test, console2} from "forge-std/Test.sol";
import {HorseStoreV1} from "../../src/HorseStoreV1.sol";
import{IHorseStoreV1} from "../../src/IHorseStoreV1.sol";
abstract contract Base_TestV1 is Test{
          IHorseStoreV1 public horsestoreV1;

          function setUp() public virtual{
            horsestoreV1=IHorseStoreV1(address(new HorseStoreV1()));
          }

        function testReadValue() public{
           uint256 initialValue=horsestoreV1.readNumberOfHorses();
           assertEq(initialValue,0);
        }

        function testWriteValue() public{
            uint256 numberofhorse=6969;
            horsestoreV1.updateHorseNumber(numberofhorse);
            assertEq(horsestoreV1.readNumberOfHorses(),numberofhorse);
        }

}