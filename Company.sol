pragma solidity ^0.4.21;

contract Company{
    address public owner;
    uint public nrPuntor = 0;
    
    constructor(){
        owner = msg.sender;
    }
    
    mapping(string => address) puntoret;
    
    event addedPuntori(string _name,string _surname,string _position);
    
    function addPuntori(string _name,string _surname,string _position)public onlyOwner test{
        address newPuntor = new Puntori(_name,_surname,_position);
        puntoret[_name] = newPuntor;
        addedPuntori(string _name ,string _surname,string _position);
        nrPuntor++;
    }
    function getPuntori(string _name)public view onlyOwner  returns(address){
        return puntoret[_name];
    }
    
    modifier onlyOwner(){
        require(owner == msg.sender);
        _; // nese osht true vazhdo
    }
    modifier test(){
        require(nrPuntor < 2);
        _;
    }
    
    
    
}
contract Puntori{
    string public  name;
    string public surname;
    string public position;
    
    function Puntori(string _name,string _surname,string _position)public{
        
        name = _name;
        surname = _surname;
        position = _position;
        
    }
    