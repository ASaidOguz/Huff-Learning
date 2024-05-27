// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Base_Test} from "./Base_Test.t.sol";
import {Test, console2} from "forge-std/Test.sol";

contract HorseStoreSolidity is Base_Test {
   address public user1=makeAddr('user');
   address public maliciousUser=makeAddr("maliciousUser");
   address public maliciousUser1=address(1);
   address public maliciousUser2=address(2);
   address public maliciousUser3=address(3);
    uint256 counter;
   modifier mintHorse(address randomOwner){
        if(counter==0){ 
        vm.prank(randomOwner);
        horseStore.mintHorse();
        counter++;}
        _;
   }
//@audit in solidity there's arithmetic overflow/underflow revert-> 
function testFeedHorseSeveralTimesForSolidity(/* uint256 _feedCount */) public mintHorse(user){
uint256 _feedCount=2;
vm.assume(0<_feedCount&&_feedCount<horseStore.HORSE_HAPPY_IF_FED_WITHIN());
console2.log(msg.sender);
console2.log(_feedCount);
console2.log(block.timestamp);
vm.startPrank(msg.sender);
  for (uint256 i=0;i<_feedCount;i++) {
        horseStore.feedHorse(0);
        console2.log(i);
    }
vm.stopPrank();
console2.log(horseStore.isHappyHorse(0));
vm.roll(_feedCount);
vm.warp(_feedCount);
console2.log(horseStore.isHappyHorse(0));
assertEq(horseStore.isHappyHorse(0),true);
}

function testContractCanMintHorseSolidity()public {
    vm.startPrank(maliciousUser);
    horseStore.mintHorse();
    vm.stopPrank();

    vm.startPrank(user);
    horseStore.mintHorse();
    horseStore.mintHorse();
    horseStore.mintHorse();
    
    attacker.mintHorse(10);
    vm.stopPrank();

/*  vm.startPrank(maliciousUser2);
    horseStore.safeTransferFrom(maliciousUser2,address(attacker),3);
    vm.stopPrank();

    vm.startPrank(maliciousUser3);
    horseStore.safeTransferFrom(maliciousUser3,address(attacker),4);
    vm.stopPrank(); */

    console2.log(horseStore.totalSupply());
}

function testCanFeedNonExisthorseSolidity(uint256 _randomeId) public{
    //without minting
    //fuzzing random value..
    vm.startPrank(user);
    horseStore.feedHorse(_randomeId);
    vm.stopPrank();
    vm.roll(horseStore.HORSE_HAPPY_IF_FED_WITHIN());
    vm.warp(horseStore.HORSE_HAPPY_IF_FED_WITHIN());
    assertEq(horseStore.isHappyHorse(_randomeId),true);

}

function testFeedHorseSeveralTimesForSOLIR() public {
console2.log(block.timestamp);

vm.startPrank(user);
horseStore.feedHorse(0);
vm.stopPrank();
vm.roll(horseStore.HORSE_HAPPY_IF_FED_WITHIN()-1);
vm.warp(horseStore.HORSE_HAPPY_IF_FED_WITHIN()-1);
assertEq(horseStore.isHappyHorse(0),true);
}
}
