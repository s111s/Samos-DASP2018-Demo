pragma solidity ^0.6.0;

contract BadRandomGame {
    
    constructor () public payable {
        // Require Ether on deploymeny for cost of contract to pay player
    }
    
    function veryBadRandom() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.number, msg.sender)));
    }
    
    function badRandom() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, msg.sender, block.coinbase)));
    }
    
    event Win(address indexed player, uint amount);
    event Lose(address indexed player, uint amount);

    
    function game(uint guess, address payable to) external payable {
        
        uint target = veryBadRandom();
        uint amount = msg.value;
        
        require (amount > 0, "GAME: INVALID_AMOUNT");
        
        if (target % 2 == guess % 2) {
            to.transfer(amount * 2);
            emit Win(msg.sender, amount);
        } else {
            emit Lose(msg.sender, amount);
        }
    }
}