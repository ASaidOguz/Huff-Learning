// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {IERC721Enumerable} from '../lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Enumerable.sol';

/* 
 * @title IHorseStore
 * @author equestrian_lover_420
 */
interface IHorseShit is IERC721Enumerable {
    function mintHorse() external;

    function feedHorse(uint256 horseId) external;

    function isHappyHorse(uint256 horseId) external view returns (bool);

    function shittyHorse() external;

    function OwnerOf() external;

    function unkwonFunc() external;
}