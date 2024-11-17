import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";
import { ethers } from "hardhat";

const VisitorNFT = buildModule("VistorNFT", (m) => {
  const visitorNFT = m.contract("VistorNFT", []);
  return { visitorNFT };
});

export default VisitorNFT;

// npx hardhat ignition deploy ./ignition/modules/VisitorNFT.ts --network ethsepolia

// 3rd - Mantle Sepolia
// 0xB57b268E0baE4498AA3bff0A61D7f2e6Cd951f15

// 4th - flow evm
// 0xB57b268E0baE4498AA3bff0A61D7f2e6Cd951f15
