# Smart Contract Group 7
 Group Project 

//SPDX-License-Identifier: MIT

// Warning: Do not use for actual funds.

pragma solidity ^0.8.9;

contract Blackjack {
    // Blackjack parameters
    Person[] public people;

    struct Person {
        string Player1;
    }

    function addPlayer(string memory Player1) public {
        people.push()
    }
