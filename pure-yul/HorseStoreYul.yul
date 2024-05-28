//Pure-Yul code of HorseStore--

   object "HorseStoreYul"{
        code {
        //Contract deployment
        datacopy(0,dataoffset("runtime"),datasize("runtime"))
        return(0,datasize("runtime"))
       }

    object "runtime" {
        code {
            //first we need to create function dispatcher...
            switch selector()
             //updateHorseNumber(uint256)
             case 0xcdfead2e {
              storeNumber(decodeAsUint(0))
             }

             //readNumberOfHorses()
             case 0xe026c017 {
                  returnUint(readNumber())
             }
             default {
                revert(0,0)
             }

             function storeNumber(newvalue){
                sstore(0,newvalue)
             }

             function readNumber() -> storedNumber{
                storedNumber := sload(0)
             }
             //decoding functions------------------
             function selector() -> s {
                  s := div(calldataload(0),0x100000000000000000000000000000000000000000000000000000000)
             }

             function decodeAsUint(offset) -> v {
                //positioninCalldata ->pos
                let pos := add(4,mul(offset,0x20))
                if lt(calldatasize(),add(pos,0x20)){
                    revert(0,0)
                }
                v:=calldataload(pos)
             }

             function returnUint(v) {
                mstore(0,v)
                return(0,0x20)
             }
             }
       }
}