pragma solidity ^0.6.0;

contract Vault {
    uint256 public balance;
    
    function setBalance(uint256 _value) public {
        balance = _value;
    }
}

contract LowLevelCall {
    address public owner;
    uint256 public balance = 5;
    address vaultPointer = address(new Vault());
    
    function setBalance(uint256 _value) public {
        vaultPointer.delegatecall(abi.encodeWithSignature("setBalance(uint256)", _value));
    }
    
}