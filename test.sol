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
    uint [13] cardValues = [11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10];
    bool public = roundend;
    uint public playerbet;
    address public winnerBlackjack;
    string private playermsg;
    function initialize (address _Player) external
  }
  // accept and store valid bets

  function bet() public payable {
    require (block.timestamp < TurnEndTime, 'No bets allowed');

    //Randomisation 
//1. Generate a random number vom 0 to 13
    function RNG () internal returns(uint) {
        return uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender)
        )) % 13+1;
    }
// 2. adjust for card values

     if (RNG > 10);
     RNG = 10; // Defining value of KQJ of 10 

     if (RNG = 1);
     RNG = 11; //default value for ace



   //Basic game allways runs
    playercard1 = RNG(); 
    dealercard1 = RNG();
    playercard2 = RNG(); 

    if playercard1 + playercard2 > 21;
    playercard2 = 1

   //players decision
   
   if playercard1 + playercard2 = 21;  //black jack 
   playermsg = "Black Jack";
   roundend = false; 
   dealercard2 = RNG(values); 
    if dealercard1 + dealercard2 = 21 ;
    playermsg = "Tie";
    roundend = true;  // player bet back
    if dealercard1 + dealercard2 < 21;
    playermsg = "Player Wins"; 
    roundend = true;  // player wins

   if playercard1 + playercard2 < 21; 
   roundend = false; 
   msg send ("Cards") = values (playercard1 + playercard2); 
   while (playercards < 21) = playercards + RNG(values)*1; 
   else roundend = true; 
   msg send ("Cards") = values (playercard1 + playercard2 + playercard3); 

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
