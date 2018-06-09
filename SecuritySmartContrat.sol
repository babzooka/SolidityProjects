pragma solidity ^0.4.8;

contract DecentralizedBankInBlockchain {

    string public BankName = "ProCredit";
    uint public BankBalance;
    address public owner;
    
    mapping (address => uint) public balances;
    
    
    constructor() public {
        owner = msg.sender;
    }
    
    function depositEther() payable public {
        balances[msg.sender] = msg.value;
    }
  
    function withdrawEther() public {
        uint userBalance = balances[msg.sender];
        require(msg.sender.transfer(userBalance));
        balances[msg.sender] = 0;
        
        // uint bilance = balances[msg.sender];
        //bilance[msg.sender] = 0;
       // msg.sender.transfer(bilance);
    }
        
    function ownerWithdraw() public onlyOwner {
        require(msg.sender.call.value(address(this).balance)());
    }
    
    function kill() public onlyOwner {
        selfdestruct(msg.sender);
    }
    
    function contractBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }
    
}