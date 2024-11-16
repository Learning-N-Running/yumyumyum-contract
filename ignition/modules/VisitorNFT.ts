import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";
import { ethers } from "hardhat";

const VisitorNFT = buildModule("VistorNFT", (m) => {
  const visitorNFT = m.contract("VistorNFT", []);
  return { visitorNFT };
});

export default VisitorNFT;

// npx hardhat ignition deploy ./ignition/modules/VisitorNFT.ts --network ethsepolia

// 1차 - Ethereum Sepolia
// 0xB57b268E0baE4498AA3bff0A61D7f2e6Cd951f15

// 2차 - Ethereum Sepolia
// 0xF283f3b139268e8d1B8001fB5F77Aca91a6ADeA5

// 3차 - Mantle Sepolia
// 0xB57b268E0baE4498AA3bff0A61D7f2e6Cd951f15
