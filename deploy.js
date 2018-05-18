const fs = require('fs');

//instance web3
const Web3 = require('web3');
provider = new Web3.providers.HttpProvider('http://localhost:7545');
web3 = new Web3(provider);

// load files
myTokenABIFile = fs.readFileSync('Token_sol_MyToken.abi');
myTokenABI  = JSON.parse(myTokenABIFile.toString());
myTokenBINFile = fs.readFileSync('Token_sol_MyToken.bin');
myTokenByteCode = myTokenBINFile.toString();

//deploy
account = web3.eth.accounts[0];
MyTokenContract = web3.eth.contract(myTokenABI);
contractData = { data: myTokenByteCode, from: account, gas: 999999 };
deployedContract = MyTokenContract.new(contractData);

console.log('deployedContract:', deployedContract);

// contractAddress = deployedContract.address;
// instance = MyTokenContract.at(contractAddress);
// web3.eth.accounts.forEach(address => {
// 	tokens = instance.balanceOf.call(address);
// 	console.log(address + ": " + tokens);
// });