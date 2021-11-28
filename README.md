# Smart Contract Group 7
 Group Project 

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
