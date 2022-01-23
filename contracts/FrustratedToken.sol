// SPDX-License-Identifier: MIT

pragma solidity >=0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FrustratedToken is ERC20{
    constructor(uint256 initialSupply) ERC20("Frustrated Token", "FDU"){
        _mint(msg.sender, initialSupply);
    }

    function checkBalance() public view returns(uint256) {
        return address(this).balance;
    }
}
