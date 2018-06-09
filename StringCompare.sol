pragma solidity ^0.4.0;


contract StringComapre{
    
  string [] myArray;
  mapping(string => bool) myMap;
  
  function StringComapre(){
      myArray.push("Erin");
      myArray.push("Godanci");
  }

  function compareString(string a,string b)public view returns(bool){
       uint w1 = uint(keccak256(a));
       uint w2 = uint(keccak256(b));
       if(w1 == w2){return true;}
       else{return false;}
    
  }
  function getUser(string search)public view returns(string){
      for(uint i = 0 ; i< myArray.length ; i++){
          if(compareString(myArray[i],search)){
              return myArray[i];
          }
      }
      return "Does no exist";
  }
}