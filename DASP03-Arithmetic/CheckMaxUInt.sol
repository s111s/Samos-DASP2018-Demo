pragma solidity ^0.6.0;

contract CheckMaxUInt {
    uint public maxuint1 = 2**256-1;
    uint public maxuint2 = ~uint(0);
    uint public maxuint3;
    
    uint public i = 115792089237316195423570985008687907853269984665640564039457584007913129639935;
    
    function setMaxUInt3(uint _a, uint _b) public {
        _a = 0;
        _b = 1;
        maxuint3 = _a-_b;
    }
    
    function checkMax1() public view returns(bool) {
        return maxuint1==i;
    }
    
    function checkMax2() public view returns(bool) {
        return maxuint2==i;
    }
    
    function checkMax3() public view returns(bool) {
        return maxuint3==i;
    }
    
}