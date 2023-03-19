# HW5 Solution

BadgerNFT contract deployed to BNB Testnet at:

```
0x31B56356Ef97213c2eF1358B25Af318b0B7D00B4
```

Contract verified here:
[BSCScan](https://testnet.bscscan.com/address/0x31B56356Ef97213c2eF1358B25Af318b0B7D00B4#code)

### Deployment and BSCScan Verification

The following scripts were run to deploy and verify the contract to the BNB testnet:

```shell
npx hardhat run --network bnbTestnet scripts/deploy.js
npx hardhat verify --network bnbTestnet 0x31B56356Ef97213c2eF1358B25Af318b0B7D00B4
```

### Unit Tests

Run the following command to execute the provided unit tests:

```shell
npx hardhat test
```