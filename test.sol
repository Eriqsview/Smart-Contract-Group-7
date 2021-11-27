//SPDX-License-Identifier: MIT

// Warning: Do not use for actual funds.

pragma solidity ^0.8.9;

contract Blackjack { // Blackjack parameters
  address public Player
  uint public endTime; // as UNIX timestamp for end of round

  constructor (address _Player, uint )

  //State of the game
  uint  public playerbet;
  address public winnerBlackjack;
  bool public has Ended;

  function initialize (address _Player) external
  {
    Player = _Player;
  }
}
