// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import{HorseStore} from "../src/HorseStore.sol";

contract TestHorseStore is HorseStore{

       function echidna_nft_symbol_correct() public view returns (bool) {
        return ((keccak256(bytes(this.name()))==keccak256(bytes(NFT_NAME)))
                 &&
                (keccak256(bytes(this.symbol()))==keccak256(bytes(NFT_SYMBOL)))) ;
    }
}
