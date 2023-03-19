# HW7 Solution

Look at the following contract, there are a number of vulnerabilities and flaws. In your teams try to find all of the problems. \
You do not need to fix any of the problems.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BadLotteryGame {
    uint256 public prizeAmount;         // payout amount
    address payable[] public players;    
    uint256 public num_players;        
    address payable[] public prize_winners; 
    event winnersPaid(uint256);

    constructor() {}

    function addNewPlayer(address payable _playerAddress) public payable {
        if (msg.value == 500000) {
            players.push(_playerAddress);
        }
        num_players++;
        if (num_players > 50) {
            emit winnersPaid(prizeAmount);
        }
    }

    function pickWinner(address payable _winner) public {
        if ( block.timestamp % 15 == 0){    // use timestamp for random number
            prize_winners.push(_winner);
        }          
    }

    function payout() public {
        if (address(this).balance == 500000 * 100) {
            uint256 amountToPay = prize_winners.length / 100;
            distributePrize(amountToPay);
        }
    }

    function distributePrize(uint256 _amount) public {
        for (uint256 i = 0; i <= prize_winners.length; i++) {
            prize_winners[i].transfer(_amount);
        }
    }
}
```
| SWC ID                                                                                | Title                                            | Description                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| ------------------------------------------------------------------------------------- | ------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [SWC-100]([https://swcregistry.io/docs/SWC-100](https://swcregistry.io/docs/SWC-100)) | Function Default Visibility                      | Functions that do not have a function visibility type specified are public by default. This can lead to a vulnerability if a developer forgot to set the visibility and a malicious user is able to make unauthorized or unintended state changes.                                                                                                                                                                                            |
| [SWC-102]([https://swcregistry.io/docs/SWC-102](https://swcregistry.io/docs/SWC-100)) | Outdated Compiler Version                        | Using an outdated compiler version can be problematic especially if there are publicly disclosed bugs and issues that affect the current compiler version.                                                                                                                                                                                                                                                                                    |
| [SWC-103]([https://swcregistry.io/docs/SWC-103](https://swcregistry.io/docs/SWC-100)) | Floating Pragma                                  | Contracts should be deployed with the same compiler version and flags that they have been tested with thoroughly. Locking the pragma helps to ensure that contracts do not accidentally get deployed using, for example, an outdated compiler version that might introduce bugs that affect the contract system negatively.                                                                                                                   |
| [SWC-120]([https://swcregistry.io/docs/SWC-120](https://swcregistry.io/docs/SWC-100)) | Weak Sources of Randomness from Chain Attributes | use of block.timestamp is insecure, as a miner can choose to provide any timestamp within a few seconds and still get his block accepted by others. Use of blockhash, block.difficulty and other fields is also insecure, as they're controlled by the miner. If the stakes are high, the miner can mine lots of blocks in a short time by renting hardware, pick the block that has required block hash for him to win, and drop all others. |
| N/A                                                                                   | Unused import                                    | Imports from the ERC20 smart contract but does not make use of any of this functionality                                                                                                                                                                                                                                                                                                                                                      |
| N/A                                                                                   | Unprotected functions                            | Functions are not protected as onlyOwner, so they can be called by any user meaning that any user can make themselves a winner and trigger a payout                                                                                                                                                                                                                                                                                           |
