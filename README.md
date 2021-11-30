# Smart Contract Group 7 Project. Blackjack game.
 
### Rules of the game:
1. One player per game.
2. Player has to choose his bet betwenn _ and _ .
3. Blackjack pays 3 to 2.
4. No split available.
5. Time per decision is set to _ .
 

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
