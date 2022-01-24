// SPDX-License-Identifier: MIT

pragma solidity >=0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FrustratedToken is ERC20,Ownable{
    constructor(uint256 initialSupply) ERC20("Frustrated Token", "FDU"){
        _mint(msg.sender, initialSupply);
    }

    address[] public arr =  [address(0xB22811B28A5ebD8cb107F8a4c3ce7FbED06Fba8b),address(0x1e8eE7BD73C51A77f0B7ED7d93A372E90b203017)];

    // uint256 _dropNumber, address[] calldata _list
    function airdrop() public onlyOwner{
        transfer(arr[0],10);
    }

    function bno(address _transferAddress) public onlyOwner returns(address){
        // payable(arr[0]).transfer(10);
        return _transferAddress;
    }
    
    function checkBalance() public view returns(uint256) {
        return address(this).balance;
    }
}
