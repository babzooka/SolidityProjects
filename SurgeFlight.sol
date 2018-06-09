pragma solidity ^0.4.21;

contract SurgeFlight{
    
    address public owner;
    string public name ;
    uint public price;
    uint public quantity;
    
    struct Passenger{
        address adr;
        string name;
        uint paid;
        uint quantity;
    }
    
    mapping (address => Passenger) passengers;
    
    
    function SurgeFlight(string _name,uint _price,uint _quantity){
        owner = msg.sender;
        name = _name;
        price = _price;
        quantity = _quantity;
        
    }
    function purchase(string _name ,uint _quantity,uint _value)public{
        require(_value >= _quantity * price && quantity >= _quantity);
            passengers[msg.sender] = Passenger({
                adr: msg.sender,
                name:_name,
                paid : _value,
                quantity: _quantity
            });
            quantity = quantity - _quantity;
    }
    function getPassenger(address _adr)public view returns(string,uint,uint){
        return (
            passengers[_adr].name,
            passengers[_adr].quantity,
            passengers[_adr].paid
        );
    }


    
    
   
}