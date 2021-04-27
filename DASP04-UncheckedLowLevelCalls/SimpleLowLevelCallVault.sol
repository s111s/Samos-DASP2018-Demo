pragma solidity ^0.6.0;

contract Vault {
    uint256 public a;
    
    function setA(uint256 _value) public {
        a = _value;
    }
}

contract LowLevelCall {
    uint256 public a = 5;
    uint256 public b = 5;
    address vaultPointer = address(new Vault());
    
    function setA(uint256 _value) public {
        vaultPointer.delegatecall(abi.encodeWithSignature("setA(uint256)", _value));
    }
    
}