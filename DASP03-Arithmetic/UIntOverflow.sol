pragma solidity ^0.6.0;

contract UIntOverflow {
    
    uint public max_uint = ~uint256(0);
    
    function add(uint _a, uint _b) pure public returns (uint) {
        return _a + _b;
    }
    
    function sub(uint _a, uint _b) pure public returns (uint) {
        return _a - _b;
    }
    
}