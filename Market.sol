pragma solidity ^0.4.21;

contract Market{
       address public owner;
       struct Product{
           uint id;
           string name;
           uint price;
           uint stock;
       }
       struct Sold{
           address _address;
           Product _product;
           uint _amount;
           uint total;
       }
       mapping(uint => Product) products;
       mapping(address=> mapping(uint=>Sold)) purchased;
       
       
       /*
       Sold memory soldproduct = Sold({
           
       });
       purchased[address][uint] = soldproduct;
       
       
       function Market()public{
           owner = msg.sender;
       }
       */
       
       function addProduct(uint _id,string _name,uint _price,uint _stock)public{
           require(msg.sender == owner && (_stock > 0 && _id > 0 && _price > 0));
           products[_id] = Product({
                id: _id,
                name:_name,
                price:_price,
                stock:_stock
           });
       }
       function readProduct(uint _id)public view returns(uint,string , uint ,uint){
           return (products[_id].id,products[_id].name,products[_id].price,products[_id].stock);
       }
       function buyProduct(uint _id , uint _quantity)public view returns(bool){
            if(msg.value < (products[_id].price * _quantity)){
                return false;
            }
            return true;
       }
}