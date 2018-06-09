pragma solidity ^0.4.21;

contract ICK{
    address public owner;
    mapping (string  => address) courses;
    
    constructor(){
        owner = msg.sender;
    }
    function addCourse(string _name,uint _capacity)public Owner{
        address newCourse = new Course(_name,_capacity);
        courses[_name] = newCourse;
    }
    function getCourse(string _name)public view returns(address){
        return courses[_name];
    }
    modifier Owner(){
        require(msg.sender == owner);
        _;
    }
    
}
contract Course{
    
     string public name;
     uint public capacity;
     
     struct Student{
         uint id;
         string name;
         string email;
         uint phoneNumber;
     }
     mapping (uint => Student) students;
     constructor(string _name,uint _capacity)public{
         name = _name;
         capacity = _capacity;
         
     }
     function register(uint _id,string _name ,string _email,uint _phoneNumber)public {
         require(isRegisterd(_id) == false);
         students[_id] = Student({
             id:_id,
             name : _name,
             email: _email,
             phoneNumber: _phoneNumber
         });
     }
    function isRegisterd(uint id)public view returns(bool){
        return students[id].id == id;
    }
  
    

    
}
contract StudentPresence{
    
    
    function StudentPresence(address course_address)public{
        Course loadCourse = Course(course_address);
    }
    // strut presence 
    struct Presence {
      
    }
    
    
    
    //if osh ne qat kurs rite inrement
    // nese jo krijo ne mapp me struct presence
    
   