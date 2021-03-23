pragma solidity ^0.6.0;

contract VulnReentrancy {
    
    mapping (address => uint) private balances; // map address to uint value
    
    function deposit() public payable {
        balances[msg.sender] += msg.value; // add ether balance in mapping address=>uint variable of sender
    }
    
    function withdraw(uint _amount) public returns (uint) {
        require(_amount <= balances[msg.sender]); // check withdraw amout must less than or equal ether balances stored in mapping address=>uint of sender
        msg.sender.call.value(_amount)(""); // msg.sender.call.value mean send ether value to sender
        
        balances[msg.sender] = balances[msg.sender] - _amount; // decrease ether amount that withdrawn in mapping address=>uint of sender
        return getMyBalance(); // show balances after withdraw
    }
    
    function getMyBalance() public view returns (uint) {
        return balances[msg.sender]; // show balance of sender
    }
}