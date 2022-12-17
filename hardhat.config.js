require("dotenv").config();
require("@nomiclabs/hardhat-etherscan");
require("@nomicfoundation/hardhat-toolbox");
require("@nomicfoundation/hardhat-chai-matchers");
require('@openzeppelin/hardhat-upgrades');

const PRIVATE_KEY = process.env.PRIVATE_KEY;
const BSC_TESTNET_RPC_URL = process.env.BSC_TESTNET_RPC_URL;

module.exports = {
  solidity: "0.8.17",
  defaultNetwork: "bsc_testnet",
  networks: {
    bsc_testnet: {
      url: `${BSC_TESTNET_RPC_URL}`,
      accounts: [`${PRIVATE_KEY}`]
    },
    bsc_mainnet: {
      url: `https://bsc-dataseed.binance.org`,
      accounts: [`${PRIVATE_KEY}`]
    },
  },
  etherscan: {
    // Your API key for Etherscan
    // Obtain one at https://etherscan.io/
    apiKey: process.env.ETHERSCAN_API_KEY
  },
};