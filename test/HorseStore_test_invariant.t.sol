// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Base_Test, HorseStore} from "./Base_Test.t.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import {Test, console2} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";
import {Handler} from "./Handler.t.sol";
contract Invariant_HorseStoreHuff is StdInvariant,Base_Test{
    string public constant horseStoreLocation = "HorseStore";
    mapping(uint256 horse => bool exist) public horsesExist;
    uint256 public horseId=5;

    Handler handler;
    function setUp() public override {
        horseStore = HorseStore(
            HuffDeployer.config().with_args(bytes.concat(abi.encode(NFT_NAME), abi.encode(NFT_SYMBOL))).deploy(
                horseStoreLocation
            )
        );
       
        handler=new Handler(address(horseStore));

        targetContract(address(handler));
    }

    function invariant_HorseFeedAlwaysWorks() public{
//just run the test it will revert in value:115792089237316195423570985008687907853269984665640564039457584007913129639935
    //if u wanna remove the invariant breaking code -> remove the huff code line 88-91 
    }

}