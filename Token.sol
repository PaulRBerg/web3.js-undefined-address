//pragma solidity ^0.4.23;
//
//contract MyToken {
//    /* This creates an array with all balances */
//    mapping (address => uint256) public balanceOf;
//
//    /* Initializes contract with initial supply tokens to the creator of the contract */
//    constructor(uint256 initialSupply) public {
//        balanceOf[msg.sender] = initialSupply;              // Give the creator all initial tokens
//    }
//
//    /* Send coins */
//    function transfer(address _to, uint256 _value) public {
//        require(balanceOf[msg.sender] >= _value);           // Check if the sender has enough
//        require(balanceOf[_to] + _value >= balanceOf[_to]); // Check for overflows
//        balanceOf[msg.sender] -= _value;                    // Subtract from the sender
//        balanceOf[_to] += _value;                           // Add the same to the recipient
//    }
//}
pragma solidity ^0.4.0;
contract MyToken {
    address public creator;
    uint256 public totalSupply;

    mapping (address => uint256) public balances;
    constructor() public {
        creator = msg.sender;
        totalSupply = 10000;
        balances[creator] = totalSupply;
    }
    function balanceOf(address owner) public constant returns(uint256){
        return balances[owner];
    }

    function sendTokens(address receiver, uint256 amount) public returns(bool){
        address owner = msg.sender;

        require(amount > 0);
        require(balances[owner] >= amount);

        balances[owner] -= amount;
        balances[receiver] += amount;
        return true;
    }
}