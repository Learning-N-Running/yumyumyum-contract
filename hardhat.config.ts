import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "dotenv/config";

const config: HardhatUserConfig = {
  defaultNetwork: "ethsepolia",
  solidity: "0.8.24",
  networks: {
    ethsepolia: {
      url: "https://eth-sepolia.g.alchemy.com/v2/NMLfkhtWl1gcH1dGS36xlFYGTxCQ-LiJ",
      accounts: [process.env.PRIVATE_KEY as string],
    },

    mantlesepolia: {
      url: "https://endpoints.omniatech.io/v1/mantle/sepolia/public",
      accounts: [process.env.PRIVATE_KEY as string],
    },
    flowevm: {
      url: "https://testnet.evm.nodes.onflow.org",
      accounts: [process.env.PRIVATE_KEY as string],
    },
  },
};

export default config;
