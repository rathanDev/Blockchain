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
    address instructorCode1 = 0x627306090abab3a6e1400e9345bc60c78a8bef57;
    address instructorCode2 = 0xf17f52151ebef6c7334fad080c5704d77216b732;

    function setInitialData() public {
        setInstrutors();
    }

    function setInstrutors() internal {
        setInstrutor(instructorCode1, "Mr.Smith");
        setInstrutor(instructorCode2, "Mrs.Smith");
    }

}
