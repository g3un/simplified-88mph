# Simplified 88MPH

https://medium.com/immunefi/88mph-theft-of-unclaimed-mph-rewards-bugfix-review-1dec98b9956b

## Usage

```bash
# Install depedency packages
$ npm i

$ npx hardhat node

# On another terminal
$ npx hardhat run scripts/deploy.js --network localhost
$ npx hardhat console --network localhost
> const Exploit = await ethers.getContractFactory("Exploit");
> const exploit = await Exploit.attach("{Exploit contract's address}");
> await exploit.run();
```
