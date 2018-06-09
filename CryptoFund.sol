pragma solidity ^0.4.0;

contract CryptoFund{
    address public owner;
    mapping(string => address) projects;
    
    function CryptoFund()public{
        owner = msg.sender;
    }
    function addProject(string _name,string _description,uint _goal)public{
        address  newProject = new Project(_name,_description,_goal);
        projects[_name] = newProject;
    }
    function getProject(string _name)public view returns(address){
        return projects[_name];
    }

}
contract Project{
    string public name;
    string public description;
    address public owner;
    uint public balance;
    uint public goal;
    address [] public contributorAdr;
    
    struct Contributor{
        address adr;
        string name;
        bool hasContributed;
        uint value;
    }
    mapping (address => Contributor) contributors;
    function Project(string _name,string _description,uint _goal)public{
        owner = msg.sender;
        name = _name;
        description = _description;
        goal = _goal;
    }
    function invest(string _name)public payable returns(bool){
        require(msg.value >= 0.001 ether && (contributors[msg.sender].hasContributed == false));
           balance += msg.value;
           contributors[msg.sender] = Contributor({
               name : _name,
               adr : msg.sender,
               hasContributed : true,
               value : msg.value
           });
           contributorAdr.push(msg.sender);
    }
    function withdraw()public ownerOnly{
        if(balance >= goal){
            owner.transfer(balance);
            balance = 0;
            selfdestruct(owner);
        }
        else{
            for(uint i=0 ; i < contributorAdr.length; i++){
               balance = balance - contributors[contributorAdr[i]].value;
               contributorAdr[i].transfer(contributors[contributorAdr[i]].value);
            }
        }
    }
    function getContributor(address _address)public view returns(string,uint,bool){
        return (contributors[_address].name,contributors[_address].value,contributors[_address].hasContributed);
    }
    modifier ownerOnly{
        require(msg.sender == owner);
        _;
    }
}