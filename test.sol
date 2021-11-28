//SPDX-License-Identifier: MIT

// Warning: Do not use for actual funds.

pragma solidity ^0.8.9;

contract Blackjack { // Blackjack parameters
  address private Player = msg.sender
  uint public endTime; // as UNIX timestamp for end of round
// Time for each round 1 min need to include mutliple rounds
  constructor (address _Player, uint _durationMinutes) {
    Player = _Player;
    endTime = block.timestamp + _durationMinutes * 1 minutes;
  }
  // accept and store valid bets

  function bet() public payable {
    require (block.timestamp < endTime, 'No bets allowed'
  );
  }

  //State of the game
  uint  public playerbet;
  address public winnerBlackjack;
  bool public has Ended;

  function initialize (address _Player) external
  {
    Player = _Player;
  }
}
