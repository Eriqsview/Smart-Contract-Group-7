# Smart Contract Group 7 Project. Blackjack game.
 
### Rules of the game:
1. One player per game.
2. Player has to choose his bet between _ and _ .
3. Blackjack pays 3 to 2.
4. When doubling down, player has to double his initial bet.
5. No split available in this version.
6. Time per decision is set to _ .

### Game process.
1. Choose a value and deploy a contraact on remix;
2. Place a bet;
3. Approve the bet;
4. Generate ranadom number (RNG);
5. Start the game - cards are dealt;
6. Choose a move (hit/stand/DD/surrender);
7. Winnings distributed according to game outcomes;
8. Game ended, funds transferred from balance to players account;


### Player moves:
1. Hit - player gets one more card. This move can be repeated till player has 21 or more (or holds more than 5 cards?).
2. Stand - player takes no more cards.
3. Double down - player doubles his initial bet and gets only one more card. Can only be chosen after initial 2 cards are distributed.
4. Surrender - player stops the round and receives half of his initial bet back.

### Dealer moves:
There are 2 possible outcomes based on the value of dealer's 2 cards:
1. if the value of the 2 first cards is below 17, the dealer gets one more card. This will be repeated until dealer has card's value of 17 or more.
2. if the value of the 2 first cards is 17 or more, dealer doesn't receive any more cards.
 
## 

//SPDX-License-Identifier: MIT

// Warning: Do not use for actual funds.

pragma solidity ^0.8.9;

contract Blackjack {
    address public dealer;
    uint256 public minBet = 0.01 ether;
    uint256 public maxBet = 100 ether;
    
    address public player;

    // Storing players bet
    struct Player {
        uint amountofbet;
    }
    
    // simple mapping in storage
    mapping(address => uint256) public betofplayer;

    }
