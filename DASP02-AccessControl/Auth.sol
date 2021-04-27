pragma solidity ^0.6.0;

contract Auth {
    
    address public owner;
    
    constructor () public {
        owner = msg.sender;
    }
    
    function getCallerByTX() public view returns (address) {
        return tx.origin;
    }
    
    function getCallerByMSG() public view returns (address) {
        return msg.sender;
    }
    
    function isOwnerByTX() public view returns (bool) {
        return tx.origin == owner;
    }
    
    function isOwnerByMSG() public view returns (bool) {
        return msg.sender == owner;
    }
    
    function kill() public {
        selfdestruct(msg.sender);
    }
}