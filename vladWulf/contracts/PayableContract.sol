pragma solidity ^0.4.20;

contract PayableContract {
    
    address client;
    bool _switch = false;

    function PayableContract() {
        client = msg.sender;
    }

    modifier ifClient() {
        if(msg.sender != client) {
            throw;
        }
        _; //continue
    }

    function depositFunds() payable {
    }

    function withdrawFunds(uint amount) ifClient {
        if (client.send(amount) ) {
            _switch = true;
        } else {
            _switch = false;
        }
    }

    function getBalance() ifClient view returns(uint) {
        return this.balance;
    }
    
}