pragma solidity  ^0.4.18;

contract Instructors {

    mapping (address => Instructor) instructorMap;
    address[] instructorCodes;

    struct Instructor {
        address code;
        string name;
    }

    function setInstrutor(address _address, string _name) public {
        Instructor storage instructor = instructorMap[_address];
        instructor.code = _address;
        instructor.name = _name;
        instructorCodes.push(_address);
    }
    function getInstructor(address _address) view public returns(string name) {
        Instructor memory instructor = instructorMap[_address];
        return(instructor.name);
    }
    function getInstructorCodes() view public returns(address[]) {
        return instructorCodes;
    }



    //test
    address instructorCode1 = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c;
    address instructorCode2 = 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c;

    function setInitialData() {
        setInstrutors();
    }

    function setInstrutors() internal {
        setInstrutor(instructorCode1, "Mr.Smith");
        setInstrutor(instructorCode2, "Mrs.Smith");
    }

}