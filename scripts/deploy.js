// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const wETH = await hre.ethers.deployContract("WETH");
  await wETH.waitForDeployment();
  console.log(`wETH @ ${wETH.target}`);

  const mphToken = await hre.ethers.deployContract("MPHToken");
  await mphToken.waitForDeployment();
  console.log(`MPHToken @ ${mphToken.target}`);

  const swap = await hre.ethers.deployContract("Swap", [wETH.target, mphToken.target]);
  await swap.waitForDeployment();
  console.log(`Swap @ ${swap.target}`);

  const depositNFT = await hre.ethers.deployContract("DepositNFT");
  await depositNFT.waitForDeployment();
  console.log(`DepositNFT @ ${depositNFT.target}`);

  const vestingNFT = await hre.ethers.deployContract("VestingNFT");
  await vestingNFT.waitForDeployment();
  console.log(`VestingNFT @ ${vestingNFT.target}`);

  const dInterest = await hre.ethers.deployContract("DInterest", [wETH.target, mphToken.target, depositNFT.target, vestingNFT.target]);
  await dInterest.waitForDeployment();
  console.log(`DInterest @ ${dInterest.target}`);

  const exploit = await hre.ethers.deployContract("Exploit", [wETH.target, mphToken.target, depositNFT.target, vestingNFT.target, dInterest.target, swap.target]);
  await exploit.waitForDeployment();
  console.log(`Exploit @ ${exploit.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
