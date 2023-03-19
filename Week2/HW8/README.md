# HW5 Solution

BadgerCoin token deployed to BNB Testnet at:

```
0xEad3282DBf89696F9dBaBfbab29AA5e8eB16eAB4
```

Contract verified here:
[BSCScan](https://testnet.bscscan.com/address/0xEad3282DBf89696F9dBaBfbab29AA5e8eB16eAB4#code)

### Deployment and BSCScan Verification

The following scripts were run to deploy and verify the contract to the BNB testnet:

```shell
npx hardhat run --network bnbTestnet scripts/deploy.js
npx hardhat verify --network bnbTestnet 0xEad3282DBf89696F9dBaBfbab29AA5e8eB16eAB4
```
