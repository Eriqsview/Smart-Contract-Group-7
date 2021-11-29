pragma solidity ^0.8.9;

//SPDX-License-Identifier: MIT

// Warning: Do not use for actual funds.

contract Blackjack { // Blackjack parameters
  address private Player = msg.sender;
  uint public TurnEndTime;// as UNIX timestamp for end of round
// Time for each round 1 min need to include mutliple rounds
  constructor (address _Player, uint _durationMinutes) {
    Player = _Player;
    TurnEndTime = block.timestamp + _durationMinutes * 1 minutes;
  }
  // accept and store valid bets

  function bet() public payable {
    require (block.timestamp < TurnEndTime, 'No bets allowed');
  }

  //State of the game
  uint public playerbet;
  address public winnerBlackjack;
  bool public hasEnded;

  function initialize (address _Player) external
  {
    Player = _Player;
  }
}
contract deck {
    enum suit { club, diamonds, hearts, spades }
    enum value { two, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace }
    struct card {
        value v;
        suit s;
    }

    card card1 = card(value.two, suit.club);
    card card2 = card({s: suit.club, v: value.two});

    // This function does a lot of copying
    function set_card1(card c) public returns (card previous) {
        previous = card1;
        card1 = c;
    }
}
address public player;

// Storing players bet
struct Player {
    uint amountofbet;
}

// simple mapping in storage
mapping(address => uint256) public betofplayer;

}
