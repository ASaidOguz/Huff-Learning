// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Base_Test, HorseStore} from "./Base_Test.t.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import {Test, console2} from "forge-std/Test.sol";
import {IHorseShit} from "../src/IHorseShit.sol";
import{Attacker} from "../src/Attacker.sol";
contract HorseStoreHuff is Base_Test {
    string public constant horseStoreLocation = "HorseStore";
    mapping(uint256 horse => bool exist) public horsesExist;
    address public user1=makeAddr('user');
    address public maliciousUser=makeAddr("maliciousUser");
    IHorseShit public horseShit;

    function setUp() public override {
        horseStore = HorseStore(
            HuffDeployer.config().with_args(bytes.concat(abi.encode(NFT_NAME), abi.encode(NFT_SYMBOL))).deploy(
                horseStoreLocation
            )
        );
        horseShit= IHorseShit(address(horseStore));
        attacker=new Attacker(address(horseStore));
    
    }
    uint256 counter;
   modifier mintHorse(address randomOwner){
        if(counter==0){ 
        vm.startPrank(randomOwner);
        horseStore.mintHorse();
        vm.stopPrank();
        counter++;}
        _;
   }
   //@audit there's no overflow/underflow check for isHappyhorse()  
   //@audit even if it's unrealistic for blocktime-stamp(unlike hardhat foundry starts timestamp from 1) 
   //@audit lower then 1 day test shows that huff  doesnt have overflow/underflow check 
function testFeedHorseSeveralTimesForHuff() public {
console2.log(block.timestamp);

vm.startPrank(user);
horseShit.feedHorse(0);
vm.stopPrank();
vm.roll(horseStore.HORSE_HAPPY_IF_FED_WITHIN()-1);
vm.warp(horseStore.HORSE_HAPPY_IF_FED_WITHIN()-1);
assertEq(horseStore.isHappyHorse(0),true);
}
//@audit High01:cant mint more then once -> why ??? index stucks in certain value??
//@audit Med01:huff contract doesnt check if the caller is contract...
function testCanMintManyHorseByDifferentUsersHuff()public {
    vm.startPrank(maliciousUser);
    //horseShit.mintHorse();
    horseShit.unkwonFunc();
    vm.stopPrank();
    //revert here with 'ALREADY_MINTED' error
    vm.startPrank(user);
    horseStore.mintHorse();
    vm.stopPrank();

    console2.log(horseStore.totalSupply());
}
function testCanFeedNonExisthorseHuff(uint256 _randomeId) public{
    //without minting
    //fuzzing random value..
    vm.startPrank(user);
    horseStore.feedHorse(_randomeId);
    vm.stopPrank();

}

function testCanContractMintEvenwithoutERC721receiverInterface()public{
    //current attack contracts erc721 receiver disabled..
    //minting success..
    attacker.mintHorse(1);
    console2.log(horseStore.totalSupply());
}
   


}
