pragma solidity ^0.6.0;

interface IAuth {
    function getCallerByTX() external view returns (address);
    function getCallerByMSG() external view returns (address);
    function isOwnerByTX() external view returns (bool);
    function isOwnerByMSG() external view returns (bool);
    function kill() external;
}

contract CheckAuth {
    IAuth authPointer = IAuth(0x0000000000000000000000000000000000000000); // replace Auth conrtact address here
    
    function checkCallerByTX() public view returns (address) {
        return authPointer.getCallerByTX();
    }
    
    function checkCallerByMSG() public view returns (address) {
        return authPointer.getCallerByMSG();
    }
    
    function checkIsOwnerByTX() external view returns (bool) {
        return authPointer.isOwnerByTX();
    }
    
    function checkIsOwnerByMSG() external view returns (bool) {
        return authPointer.isOwnerByMSG();
    }
    
}