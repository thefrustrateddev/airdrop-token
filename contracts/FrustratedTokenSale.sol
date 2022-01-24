// SPDX-License-Identifier: MIT

pragma solidity >=0.8.10;

import "./CrowdSale.sol";
import "./KYCWhitelist.sol";

contract FrustratedTokenSale is Crowdsale{

    KYCWhitelist kyc;
    constructor(
        uint256 rate,    // rate in TKNbits
        address payable wallet,
        IERC20 token,
        KYCWhitelist _kyc
    )
        // MintedCrowdsale()
        Crowdsale(rate, wallet, token)
    {
        kyc=_kyc;
    }

    
    function _preValidatePurchase(address _beneficiary, uint256 _weiAmount)internal view override{
        super._preValidatePurchase(_beneficiary,_weiAmount);
        require(kyc.isKycCompleted(msg.sender),"Please complete kyc first");
    }
}