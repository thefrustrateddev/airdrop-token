var FrustratedToken = artifacts.require("./FrustratedToken.sol");
var KYCWhiteList = artifacts.require("./FrustratedToken.sol");
var FrustratedTokenSale = artifacts.require("./FrustratedTokenSale.sol");

module.exports = async function(deployer) {
    let addr = await web3.eth.getAccounts();
    await deployer.deploy(FrustratedToken,1000);
    // await deployer.deploy(KYCWhiteList);
    // await deployer.deploy(FrustratedToken,1,addr[0],FrustratedTokenSale.address,KYCWhiteList.address);
    // let instance = await FrustratedToken.deployed();
    // await instance.transfer(FrustratedTokenSale.address,10000000000);
};