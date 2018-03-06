pragma solidity ^0.4.20;

contract People {

    enum Status {ACTIVE, INACTIVE}
    enum Language {TAMIL, ENGLISH, SINHALA, OTHER}

    struct Person {
        uint id;
        bytes32 name;
        uint[] languages;
        Status status;
    }

    uint universalId = 0;

    mapping(address => Person) personMap;
    address[] public codes;

    function setPerson(bytes32 _name, uint[] _languages) public {
        Person memory person;
        person.id = universalId ++;
        person.name = _name;
        person.languages = _languages;
        person.status = Status.ACTIVE;
        personMap[msg.sender] = person;
        codes.push(msg.sender);
    }
    function getPerson() public view returns(uint, bytes32, uint[]) {
        Person storage person = personMap[msg.sender];
        return(person.id, person.name, person.languages);
    }

    function uintToLanguage(uint _language) public pure returns(string) {
        if(_language == uint(Language.TAMIL)) {
            return "TAMIL";
        }
        if(_language == uint(Language.ENGLISH)) {
            return "ENGLISH";
        }
        if(_language == uint(Language.SINHALA)) {
            return "SINHALA";
        }
        return "OTHER";
    }

    function getUniversalId() public view returns(uint) {
        return universalId;
    }

    //test
    function setPersons() public {
        Person memory person;
        person.id = universalId ++;
        person.name = "p1";
        // person.languages.push(0);
        person.status = Status.ACTIVE;
        personMap[0xca35b7d915458ef540ade6068dfe2f44e8fa733c] = person;
        codes.push(0xca35b7d915458ef540ade6068dfe2f44e8fa733c);
    }

}