// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {ERC721Enumerable, ERC721} from '../lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Enumerable.sol';
import {HorseStore} from "./HorseStore.sol";
import {IERC721Receiver} from '../lib/openzeppelin-contracts/contracts/token/ERC721/IERC721Receiver.sol';

contract Attacker /* is IERC721Receiver */{
       
       HorseStore public horseStore;
       uint256 public horseId;
       uint256 public counter=1;
       constructor(address _horseAddr) {
        horseStore=HorseStore(_horseAddr);
       }

       function mintHorse(uint256 _value)external{
        require(_value!=0,"Value shouldnt be zero!");
        for(uint i=0;i<_value;i++){
        horseStore.mintHorse();}
       }

       function feedHorse(uint256 _horseId)external{
        horseStore.feedHorse(_horseId);
       }

       function isHappyHorse(uint256 _horseId) external view returns(bool){
           return horseStore.isHappyHorse(_horseId);
       }
       /* function onERC721Received(
        address ,
        address ,
        uint256 tokenId,
        bytes calldata 
    ) external returns (bytes4){
        horseId=tokenId;
        if(counter>5){
        counter++;
        }
        return IERC721Receiver.onERC721Received.selector;
    } */

}


