pragma solidity ^0.4.0;
library hashOperations{
    
    function hashString(string  self)public view returns(bytes32){
        return keccak256(self);
    }
    function compareStrings(string self , string b)public view returns(bool){
        return keccak256(self) == keccak256(b);
    }
    function size(string self)public view returns(uint){
        return bytes(self).length;
    }
}
library calculate{
    function add(int self , int b)public view returns(int){
        return self+b;
    }
    function sub(int self , int b)public view returns(int){
        return self-b;
    }
    
    
    
}

contract academy{
    using hashOperations for string;
    using calculate for int;
    
    function compare(string a, string b)public view returns(bool){
        return a.compareStrings(b);
    }
    function hash(string a)public view returns(bytes32){
        return a.hashString();
    }
    function getSize(string a)public view returns(uint){
        return a.size();
    }
    function addNumbers(int a, int b)public view returns(int){
         return a.add(b);
    }
    function subNumbers(int a , int b)public view returns(int){
        return a.sub(b);
    }
    
}