pragma solidity ^0.4.20;

contract PayableContract {
    
    function PayableContract() {
        
    }
    
    function receiveFunds() payable {
        
    }
    
    function getBalance() view returns(uint) {
        return this.balance;
    }
    
}