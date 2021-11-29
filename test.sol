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
ragma solidity ^0.8.9;

//SPDX-License-Identifier: MIT

// Warning: Do not use for actual funds.

contract Blackjack { // Blackjack parameters
  address private Player = msg.sender;
  uint public TurnEndTime;// as UNIX timestamp for end of round
// Time for each round 1 min need to include mutliple rounds
  constructor (address _Player, uint _durationMinutes) {
    Player = _Player;
    TurnEndTime = block.timestamp + _durationMinutes * 1 minutes;
    uint private = values
    bool private = roundend

  }
  // accept and store valid bets

  function bet() public payable {
    require (block.timestamp < TurnEndTime, 'No bets allowed');

    //Randomisation 


   //Basic game allways runs
    playercard1 = RNG(values) 
    dealercard1 = RNG(values)
    playercard2 = RNG(values) 

 //players decision
   
   if playercard1 + playercard2 = 21 //black jack 
   roundend = false
   dealercard2 = RNG(values)
    if dealercard1 + dealercard2 = 21 
    roundend = true // player bet back
    if dealercard1 + dealercard2 < 21
    roundend = true // player wins

    //dealercard3 = RNG(values)
     // if dealercard1 + dealercard2 + dealercard3 = 21
     // roundend = true //dealer wins
     // if dealercard1 + dealercard2 + dealercard3 > 21 
     // roundend = true //player wins
     // if dealercard1 + dealercard2 + dealercard3 < 21
     // dealercard4 = RNG(values)
//loop required
    //  while (dealercards < 21) = 

    //if dealercard1 + dealercard2  = 21
    //roundend = true //dealer wins
    //if dealercard1 + dealercard2 > 21 
    //roundend = true //player wins
// player ADDITIONAL CARD
   if playercard1 + playercard2 < 21
   roundend = false
   msg send ("Karten") = values (playercard1 + playercard2)
   while (playercards < 21) = playercards + RNG(values)*1
   else roundend = true
   msg send ("Karten") = values (playercard1 + playercard2 + playercard3)




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

address public player;

// Storing players bet
struct Player {
    uint amountofbet;
}

// simple mapping in storage
mapping(address => uint256) public betofplayer;
