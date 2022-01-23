// SPDX-License-Identifier: MIT

pragma solidity >=0.8.10;


import "@openzeppelin/contracts/access/Ownable.sol";
contract KYCWhitelist is Ownable{

    mapping(address=>bool) kyclist;

    function setKycCompleted(address _addr) public onlyOwner{
        kyclist[_addr]=true;
    }
    function setKycRevoked(address _addr) public onlyOwner{
        kyclist[_addr]=false;
    }

    function isKycCompleted(address _addr) public view returns(bool){
        return kyclist[_addr];
    }
}