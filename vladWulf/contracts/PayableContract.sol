pragma solidity ^0.4.20;

contract PayableContract {
    
    address client;
    bool _switch = false;

    function PayableContract() {
        client = msg.sender;
    }

    function depositFunds() payable {
    }

    function withdrawFunds(uint amount) {
        if (client.send(amount) ) {
            _switch = true;
        } else {
            _switch = false;
        }
    }
    
    function getBalance() view returns(uint) {
        return this.balance;
    }
    
}