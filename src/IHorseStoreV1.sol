// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;



interface IHorseStoreV1  {
 function updateHorseNumber(uint256) external;
 function readNumberOfHorses() external view returns(uint256) ;
}