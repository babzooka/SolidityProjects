pragma solidity ^0.4.0;
 library SafeMath {
  function mul(uint256 a, uint256 b) internal constant returns (uint256) {
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }
 
  function div(uint256 a, uint256 b) internal constant returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }
 
  function sub(uint256 a, uint256 b) internal constant returns (uint256) {
    assert(b <= a);
    return a - b;
  }
 
  function add(uint256 a, uint256 b) internal constant returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}
contract SafeCalculator{
    
    using SafeMath for uint256;    
    
    uint256 public result;
 
    function addNumbers(uint256 a, uint256 b){
      result = 0;
      result = a.add(b);
    }
     function subNumbers(uint256 a, uint256 b) {
      result = 0;
      result = a.sub(b);
    }
     function multNumbers(uint256 a, uint256 b) {
      result = 0;
      result = a.mul(b);
    }
     function divNumbers(uint256 a, uint256 b) {
      result = 0;
      result = a.div(b);
    }
}