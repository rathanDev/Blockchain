pragma solidity ^0.4.20;

contract EventContract {

    address client;

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
        client.send(amount)
    }

    function getBalance() ifClient view returns(uint) {
        return this.balance;
    }

}