<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    <HelloWorld msg="Welcome to Your Vue.js App"/>
    <button @click="checkBalance">Check Balance</button>
    <button @click="airdrop">Airdrop</button>
    <button @click="owner">Owner</button>
    <button @click="bno">bno</button>
  </div>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue';
import getWeb3 from './utils/getWeb3.js';
import FToken from './contracts/FrustratedToken.json';


export default {
  name: 'App',
  components: {
    HelloWorld,
  },
  data(){
    return {
      accounts:[],
      FContractInstance:"",
      loaded:false,
      isMinted:false,
      imgsrc:'',
    }
  },
  async created(){
    try{
    let web3= await getWeb3();
      console.log(web3)

      const accounts = await web3.eth.getAccounts();

      const networkId = await web3.eth.net.getId();

      const FContractInstance = new web3.eth.Contract(
          FToken.abi,
          FToken.networks[networkId] && FToken.networks[networkId].address,
      );

      this.$nextTick(()=>{
        this.accounts=accounts;
        this.FContractInstance=FContractInstance;
      });
    }
    catch (error) {
      alert(
        `Failed to load web3, accounts, or contract. Check console for details.`,
      );
      console.error(error);
    }

  },
  methods:{
    async checkBalance(){
      let a = await this.FContractInstance.methods.balanceOf(this.accounts[0]).call();
      let b = await this.FContractInstance.methods.totalSupply().call();
      // let c = await this.FContractInstance.methods.bno().call({from:this.accounts[0]});
      console.log("balance check",this.FContractInstance,a,b);
    },

    async airdrop(){

      // let a = await this.FContractInstance.methods.totalSupply().call({from:this.accounts[0]});
      let b = await this.FContractInstance.methods.airdrop().send({from:this.accounts[0]});
      console.log("airdrop check",b);
    },

    async balanceOf(){
      let b = await this.FContractInstance.methods.balanceOf(this.accounts[0]).call();
      console.log("balance check",b);
    },

    async owner(){
      let b = await this.FContractInstance.methods.owner().call();
      console.log("balance check",b);
    },

    async bno(){
      // for onlyOwner from is required
      // if not function happening inside use call if not use send
      let b = await this.FContractInstance.methods.bno(this.accounts[0]).call({from:this.accounts[0]});
      console.log("balance check",b);
    }
  }
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
