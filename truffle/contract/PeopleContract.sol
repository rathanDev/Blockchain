pragma solidity ^0.4.20;

contract People {

    enum Status {ACTIVE, INACTIVE}
    enum Language {TAMIL, ENGLISH, SINHALA, OTHER}

    struct Person {
        uint id;
        bytes32 name;
        Language[] languages;
        Status status;
    }

    uint universalId = 1;

    mapping(address => Person) personMap;
    address[] public codes;

    function setPerson(bytes32 _name, uint[] _languages) public {
        Person storage person = personMap[msg.sender];
        person.id = universalId ++;
        person.name = _name;
        person.languages = uintsToLanguages(_languages);
        person.status = Status.ACTIVE;
        codes.push(msg.sender);
    }
    function getPerson() public view returns(uint, bytes32, Language[], Status) {
        Person storage person = personMap[msg.sender];
        return(person.id, person.name, person.languages, person.status);
    }

    function uintToLanguage(uint _uint) public pure returns(Language) {
        if(_uint == uint(Language.TAMIL)) {
            return Language.TAMIL;
        }
        if(_uint == uint(Language.ENGLISH)) {
            return Language.ENGLISH;
        }
        if(_uint == uint(Language.SINHALA)) {
            return Language.SINHALA;
        }
        return Language.OTHER;
    }
    function uintToLanguageString(uint _language) public pure returns(string) {
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

    function uintsToLanguages(uint[] _uints) public view returns(Language[]) {
        Language[] languages;
        for(uint i=0; i<_uints.length; i++) {
            languages.push(uintToLanguage(_uints[i]));
        }
        return languages;
    }

    function getUniversalId() public view returns(uint) {
        return universalId;
    }

    //test
    function setPersons() public {
        Person storage person = personMap[0xca35b7d915458ef540ade6068dfe2f44e8fa733c];
        person.id = universalId ++;
        person.name = "p1";
        person.languages = [Language.TAMIL, Language.ENGLISH];
        person.status = Status.ACTIVE;
        codes.push(0xca35b7d915458ef540ade6068dfe2f44e8fa733c);

        Person storage person2 = personMap[0x14723a09acff6d2a60dcdf7aa4aff308fddc160c];
        person2.id = universalId ++;
        person2.name = "p1";
        person2.languages = [Language.ENGLISH, Language.SINHALA];
        person2.status = Status.ACTIVE;
        codes.push(0x14723a09acff6d2a60dcdf7aa4aff308fddc160c);
    }

}