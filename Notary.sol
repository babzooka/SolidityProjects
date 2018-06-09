pragma solidity ^0.4.0;

contract  Notary{
    struct documentData{
        uint time;
        address owner;
        string title;
    }
    mapping(string => documentData) documents;
    
    function setData(string _hash,string _title)public{
        require(documents[_hash].time == 0);
        documents[_hash] = documentsData({
                 time:now,
                 owner: msg.sender,
                 title: _title
        });
               
     
    }
    function returnData(string _hash)returns(string){
        return documents[_hash].title;
    }
}
